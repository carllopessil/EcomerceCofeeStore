<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Usuário</title>
</head>
<body>
    <h1>Cadastrar Usuário BackOffice</h1>

    <% String mensagemSucesso = (String) request.getAttribute("mensagemSucesso"); %>
    <% if (mensagemSucesso != null) { %>
        <div class="alert alert-success">
            <%= mensagemSucesso %>
        </div>
    <% } %>

    <% String mensagemAlerta = (String) request.getAttribute("mensagemAlerta"); %>
    <% if (mensagemAlerta != null) { %>
        <div class="alert alert-danger">
            <%= mensagemAlerta %>
        </div>
    <% } %>

    <form action="/CadastrarUsuarioBackOffice" method="post">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="senha">Senha:</label>
        <input type="password" name="senha" required><br>

        <label for="grupo">Grupo:</label>
        <input type="text" name="grupo"><br>

        <label for="status">Status:</label>
        <input type="checkbox" name="status" checked><br>

        <label for="CPF">CPF:</label>
        <input type="text" name="CPF" required><br>

        <input type="submit" value="Cadastrar">
    </form>

</body>
</html>
