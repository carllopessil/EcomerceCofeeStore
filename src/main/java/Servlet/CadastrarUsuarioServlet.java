package Servlet;

import DAO.CadastrarUsuarioDAO;
import DAO.UsuarioBackOfficeDAO;
import br.com.gymcontrol.Model.UsuarioBackOffice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CadastrarUsuarioBackOffice")
public class CadastrarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String grupo = request.getParameter("grupo");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String cpf = request.getParameter("CPF");

        UsuarioBackOffice userBackOffice = new UsuarioBackOffice();
        userBackOffice.setNome(nome);
        userBackOffice.setEmail(email);
        userBackOffice.setSenha(senha);
        userBackOffice.setGrupo(grupo);
        userBackOffice.setStatus(status);
        userBackOffice.setCPF(cpf);

        UsuarioBackOfficeDAO usuarioDAO = new UsuarioBackOfficeDAO();
        boolean cadastroSucesso = usuarioDAO.CadastrarUsuarioBackOffice(userBackOffice);

        if (cadastroSucesso) {
            request.setAttribute("mensagemSucesso", "Usuário cadastrado com sucesso!");
        } else {
            request.setAttribute("mensagemAlerta", "E-mail já cadastrado. Por favor, escolha outro e-mail.");
        }

        request.getRequestDispatcher("CadatrarUsuarioBackOffice.jsp").forward(request, response);
    }
}