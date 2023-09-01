package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import DAO.UsuarioBackOfficeDAO;
import br.com.gymcontrol.Model.UsuarioBackOffice;

@WebServlet("/AlterarUsuarioServlet")
public class AlterarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String grupo = request.getParameter("grupo");
        String senha = request.getParameter("senha");
        String confirmaSenha = request.getParameter("confirmaSenha");

        // Verificar se o usuário está logado e se o grupo está sendo alterado por ele
        HttpSession session = request.getSession();
        UsuarioBackOffice usuarioLogado = (UsuarioBackOffice) session.getAttribute("usuario");

        if (usuarioLogado != null && userID != usuarioLogado.getID()) {

        } else if (usuarioLogado != null && userID == usuarioLogado.getID()) {
            request.setAttribute("error", "Você não pode alterar o grupo do seu próprio usuário. seu grupo ao salvar se mantera o mesmo!");
            grupo = usuarioLogado.getGrupo(); // Mantém o grupo do usuário logado

        }

        if (senha.isEmpty()) {
            UsuarioBackOfficeDAO.atualizarUsuario2(userID, nome, cpf, grupo);
        } else if (!senha.equals(confirmaSenha)) {
            // Senhas não coincidem
            request.setAttribute("error", "As senhas não coincidem.");
            request.getRequestDispatcher("EditarUsuarioBackOffice.jsp").forward(request, response);
            return;
        } else {
            UsuarioBackOfficeDAO.atualizarUsuario(userID, nome, cpf, grupo, senha);
        }


        // Redirecionar para a página de listagem após a atualização
        List<br.com.gymcontrol.Model.UsuarioBackOffice> usuarios = UsuarioBackOfficeDAO.listarUsuarios();
        request.setAttribute("UsuarioBackOffice", usuarios);
        request.getRequestDispatcher("ListarUsuarioOFC.jsp").forward(request, response);

    }
}