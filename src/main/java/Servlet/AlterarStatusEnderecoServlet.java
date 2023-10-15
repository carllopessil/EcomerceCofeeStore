package Servlet;

import DAO.EnderecoDAO;
import br.com.gymcontrol.Model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AlterarStatusEndereco")
public class AlterarStatusEnderecoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EnderecoDAO enderecoDAO = new EnderecoDAO();

        String enderecoPadraoId = request.getParameter("enderecoPadraoId");

        if (enderecoPadraoId != null) {
            int idEnderecoPadrao = Integer.parseInt(enderecoPadraoId);

            HttpSession session = request.getSession();
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            int idLogado = cliente.getId();

            boolean sucesso = enderecoDAO.atualizarIdEnderecoPadrao(idLogado, idEnderecoPadrao);

            if (sucesso) {
                response.sendRedirect(request.getContextPath() + "/ListarEnderecosCliente");
            } else {
                response.sendRedirect(request.getContextPath() + "/ListarEnderecosCliente");
            }
        }

        String[] acoes = request.getParameterValues("acao");
        if (acoes != null) {
            for (String acao : acoes) {
                if (acao.startsWith("excluir ")) {
                    int enderecoId = Integer.parseInt(acao.substring(8)); // Remove o prefixo "excluir_"
                    boolean sucesso2 = enderecoDAO.alterarStatusEndereco(enderecoId, false);

                    if (!sucesso2) {
                        response.getWriter().println("Erro ao alterar status do endereço.");
                    }
                }
            }
        }

        response.sendRedirect(request.getContextPath() + "/ListarEnderecosCliente");
}
}
