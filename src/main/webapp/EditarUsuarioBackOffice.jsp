<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="css/CadastrarUsuarioBackOffice.css">

</head>
<body>

     <% String mensagemAlertaCPF = (String) request.getAttribute("mensagemAlertaCPF"); %>
         <% if (mensagemAlertaCPF != null) { %>
            <div class="alert alert-danger">
                <%= mensagemAlertaCPF %>
            </div>
                <% } %>

                 <% String mensagemAlerta = (String) request.getAttribute("mensagemAlerta"); %>
                            <% if (mensagemAlerta != null) { %>
                        <div class="alert alert-danger">
                            <%= mensagemAlerta %>
                        </div>
                            <% } %>
    <div class="error-message">${error}</div>

    <div class="container">
        <h1>Editar Usuário</h1>
        <form action="/AlterarUsuarioServlet" method="post">
            <input type="hidden" name="userID" value="${param.userID}">

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="${param.nome}" required><br>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="${param.cpf}" placeholder="000.000.000-00" required
                   oninput="aplicarMascaraCPF(this)"><br>


        <%
            UsuarioBackOffice usuarioSessao = (UsuarioBackOffice) session.getAttribute("usuario");
            int userID = Integer.parseInt(request.getParameter("userID")); // Converte para int

            if (usuarioSessao != null && !String.valueOf(usuarioSessao.getID()).equals(String.valueOf(userID))) {
        %>
            <label for="grupo">Grupo:</label>
            <input type="text" id="grupo" name="grupo" value="${param.grupo}"><br>
        <% } %>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha"><br>

            <label for="confirmaSenha">Confirmar Senha:</label>
            <input type="password" id="confirmaSenha" name="confirmaSenha"><br>

            <button type="submit">Salvar</button>

            <button onclick="window.history.back();" class="back-button">
                <i class="fas fa-arrow-left"></i> Voltar
            </button>
        </form>
    </div>
<script>


     function aplicarMascaraCPF(input) {
        var cpfAtualizado = formatarCPF(input.value);
        input.value = cpfAtualizado;
    }

        function formatarCPF(cpf) {
            cpf = cpf.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
            cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
            cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
            cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
            return cpf;
        }


    </script>
</body>
</html>
