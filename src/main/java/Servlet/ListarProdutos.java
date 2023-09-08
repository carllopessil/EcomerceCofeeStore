package Servlet;

import DAO.ProdutosDAO;
import DAO.UsuarioBackOfficeDAO;
import br.com.gymcontrol.Model.Produtos;
import br.com.gymcontrol.Model.UsuarioBackOffice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ListarProdutos")
public class ListarProdutos extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");

        if (searchTerm != null && !searchTerm.isEmpty()) {
            List<Produtos> produtosEncontrados = ProdutosDAO.buscarProdutosPorTermo(searchTerm);
            request.setAttribute("Produtos", produtosEncontrados);
            request.setAttribute("pageCount", 1); // Apenas uma página para os resultados da busca
            request.setAttribute("paginaAtual", 1); // Estamos na única página
        } else {
            int produtosPorPagina = 10;
            int paginaAtual = 1;

            String paginaParam = request.getParameter("page");
            if (paginaParam != null && !paginaParam.isEmpty()) {
                paginaAtual = Integer.parseInt(paginaParam);
            }

            int offset = (paginaAtual - 1) * produtosPorPagina;
            List<Produtos> produtos = ProdutosDAO.listarProdutosPaginados(offset, produtosPorPagina);
            int pageCount = ProdutosDAO.calcularPageCount(produtosPorPagina);

            request.setAttribute("Produtos", produtos);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("paginaAtual", paginaAtual);
        }

        request.getRequestDispatcher("ListarProdutos.jsp").forward(request, response);
    }
}