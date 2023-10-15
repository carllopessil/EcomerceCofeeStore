package Servlet;

import DAO.ClienteDAO;
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
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        EnderecoDAO enderecoDAO = new EnderecoDAO();

        String enderecoPadraoId = request.getParameter("enderecoPadraoId");

        if (enderecoPadraoId != null) {
            int idEnderecoPadrao = Integer.parseInt(enderecoPadraoId);

            HttpSession session = request.getSession();
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            int idLogado = cliente.getId();

            boolean sucesso = enderecoDAO.atualizarIdEnderecoPadrao(idLogado, idEnderecoPadrao);

            if (sucesso) {
                // Atualiza o cliente na sessão após a alteração
                cliente.setIdEnderecoPadrao(idEnderecoPadrao);
                session.setAttribute("cliente", cliente);

                response.sendRedirect(request.getContextPath() + "/");
                return;
            } else {
                // Atualiza o cliente na sessão após a alteração
                cliente.setIdEnderecoPadrao(idEnderecoPadrao);
                session.setAttribute("cliente", cliente);
                response.sendRedirect(request.getContextPath() + "/");
                return;
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
