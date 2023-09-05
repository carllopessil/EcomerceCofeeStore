package Servlet;

import com.azure.core.util.BinaryData;
import com.azure.storage.blob.BlobClient;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import DAO.ProdutosDAO;
import br.com.gymcontrol.Model.Produtos;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@WebServlet("/CadastroProdutoServlet")
@MultipartConfig
public class CadastroProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Configurações do Azure Blob Storage
    private static final String storageConnectionString = "DefaultEndpointsProtocol=https;"
            + "AccountName=pi4senac;"
            + "AccountKey=uQk8tRzdibr2QdYRM8O8T9Xw88YzcWNhEoXg6BeWGN9+6UaEUtFktOBCtAWxNBuKtjEuVuHK96P4+AStNVP/vA==;"
            + "EndpointSuffix=core.windows.net";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenha os dados do formulário
        Produtos produto = new Produtos();
        produto.setNomeProduto(request.getParameter("nomeProduto"));
        String statusParameter = request.getParameter("status");
        boolean statusProduto = statusParameter != null && statusParameter.equalsIgnoreCase("on");
        produto.setStatusProduto(statusProduto);
        produto.setAvaliacao(Double.parseDouble(request.getParameter("avaliacao")));
        produto.setDescricaoDetalhada(request.getParameter("descricaoDetalhada"));
        produto.setPrecoProduto(Double.parseDouble(request.getParameter("precoProduto")));
        produto.setQtdEstoque(Integer.parseInt(request.getParameter("qtdEstoque")));

        // Processar o upload da imagem
        Part filePart = request.getPart("imagemProduto");
        String uploadedFileName = filePart.getName();
        String imageBlobName = UUID.randomUUID().toString() + "_" + uploadedFileName;

        try {
            // Salve a imagem temporariamente no servidor
            File uploadDir = new File("/caminho/para/salvar/arquivos/temporarios");
            uploadDir.mkdirs();
            File file = new File(uploadDir, uploadedFileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            // Realize o upload da imagem para o Azure Blob Storage
            BlobServiceClient blobServiceClient = new BlobServiceClientBuilder().connectionString(storageConnectionString).buildClient();
            String containerName = "pi4imagens";
            BlobContainerClient containerClient = blobServiceClient.getBlobContainerClient(containerName);
            containerClient.createIfNotExists();
            BlobClient blobClient = containerClient.getBlobClient(imageBlobName);
            blobClient.upload(BinaryData.fromFile(file.toPath()));

            // Salve o URL do Blob no banco de dados
            produto.setImagePATH(blobClient.getBlobUrl());

            // Apague o arquivo temporário no servidor
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Insira o produto no banco de dados
        try {
            ProdutosDAO produtoDAO = new ProdutosDAO();
            produtoDAO.inserirProduto(produto);
        } catch (Exception e) {
            System.out.println(e);
        }

        // Redirecione de volta para a página de cadastro de produtos
        response.sendRedirect("CadastroProduto.jsp");
    }
}
