<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta tags, title, and stylesheets here -->
</head>
<body>
    <!-- Header and navigation if needed -->
    <div class="error-message">${error}</div>

    <div class="container">
        <h1>Editar Usuário</h1>
        <form action="/AlterarUsuarioServlet" method="post">
            <input type="hidden" name="userID" value="${param.userID}">

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="${param.nome}" required><br>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="${param.cpf}" required><br>

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

    <!-- Footer and scripts if needed -->
</body>
</html>
