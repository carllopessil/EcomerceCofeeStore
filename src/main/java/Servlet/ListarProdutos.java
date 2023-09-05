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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int produtosPorPagina = 10; // Defina a quantidade desejada de produtos por página
        int paginaAtual = 1; // Página inicial

        String paginaParam = request.getParameter("page");
        if (paginaParam != null && !paginaParam.isEmpty()) {
            paginaAtual = Integer.parseInt(paginaParam);
        }

        int offset = (paginaAtual - 1) * produtosPorPagina; // Calcular o offset para a consulta SQL

        List<Produtos> produtos = ProdutosDAO.listarProdutosPaginados(offset, produtosPorPagina);
        int pageCount = ProdutosDAO.calcularPageCount(produtosPorPagina);

        request.setAttribute("Produtos", produtos);
        request.setAttribute("pageCount", pageCount);
        request.setAttribute("paginaAtual", paginaAtual);

        request.getRequestDispatcher("ListarProdutos.jsp").forward(request, response);
    }
}
