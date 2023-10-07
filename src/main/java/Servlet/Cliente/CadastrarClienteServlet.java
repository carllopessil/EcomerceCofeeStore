package Servlet.Cliente;

import DAO.ClienteDAO;
import DAO.UsuarioBackOfficeDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastrarClienteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomeCompleto = request.getParameter("nomeCompleto");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String cepFaturamento = request.getParameter("cepFaturamento");
        String logradouroFaturamento = request.getParameter("logradouroFaturamento");
        int numeroFaturamento = Integer.parseInt(request.getParameter("numeroFaturamento"));
        String complementoFaturamento = request.getParameter("complementoFaturamento");
        String bairroFaturamento = request.getParameter("bairroFaturamento");
        String cidadeFaturamento = request.getParameter("cidadeFaturamento");
        String ufFaturamento = request.getParameter("ufFaturamento");
        int idEnderecoPadrao = Integer.parseInt(request.getParameter("idEnderecoPadrao"));

        ClienteDAO clienteDAO = new ClienteDAO();
        boolean cliente = clienteDAO.CadastrarUsuarioBackOffice(userBackOffice);


        response.sendRedirect("CadastrarCliente.jsp");
    }
}
