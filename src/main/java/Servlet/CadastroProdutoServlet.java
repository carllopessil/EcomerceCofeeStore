package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import DAO.ProdutosDAO;
import br.com.gymcontrol.Model.Produtos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CadastroProdutoServlet")
public class CadastroProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenha os dados do formulário e crie um objeto Produto
        Produtos produto = new Produtos();
        produto.setNomeProduto(request.getParameter("nomeProduto"));

        // Verifique se o campo de status foi enviado no corpo da solicitação
        String statusParameter = request.getParameter("status");
        boolean statusProduto = statusParameter != null && statusParameter.equalsIgnoreCase("on");
        produto.setStatusProduto(statusProduto);

        produto.setAvaliacao(Double.parseDouble(request.getParameter("avaliacao")));
        produto.setDescricaoDetalhada(request.getParameter("descricaoDetalhada"));
        produto.setPrecoProduto(Double.parseDouble(request.getParameter("precoProduto")));
        produto.setQtdEstoque(Integer.parseInt(request.getParameter("qtdEstoque")));
        produto.setImagePATH(request.getParameter("imagePATH"));

        try {
            // Crie um ProdutoDAO e insira o produto no banco de dados
            ProdutosDAO produtoDAO = new ProdutosDAO();
            produtoDAO.inserirProduto(produto);
        } catch (Exception e) {
            System.out.println(e);
        }

        // Redirecione de volta para a página de cadastro de produtos
        response.sendRedirect("CadastroProduto.jsp");
    }

}
