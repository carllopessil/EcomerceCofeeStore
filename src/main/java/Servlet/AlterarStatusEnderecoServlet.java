package Servlet;

import DAO.EnderecoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AlterarStatusEndereco")
public class AlterarStatusEnderecoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int enderecoId = Integer.parseInt(request.getParameter("enderecoId"));

        EnderecoDAO enderecoDAO = new EnderecoDAO();

        boolean sucesso = enderecoDAO.alterarStatusEndereco(enderecoId, false);

        if (sucesso) {
            response.sendRedirect(request.getContextPath() + "/ListarEnderecosCliente");
        } else {
            response.getWriter().println("Erro ao alterar status do endereço.");
        }
    }
}
