<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Usuário</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/CadastrarUsuarioBackOffice.css">
</head>
<body>
<div id="container">
    <nav>
        <ul class="menu">
            <li class="menu-logo">
                <img src="img/Logo de cafe.png">
                <h1>BEM-VINDO AO BACKOFFICE</h1>
            </li>

            <li><a href="Logout">Sair</a></li>
        </ul>
    </nav>
</div>
<heare>


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
        <hr>

        <!-- Botón "Cadastrar" con ícono -->
        <button type="submit" class="submit-button" type="submit" value="Cadastrar"><!-- Back button -->
            <i class="fas fa-user-plus"></i> Cadastrar
        </button>

        <button style="background-color: rgba(31,8,8,0.04)"></button> <!-- Back button -->
        <button onclick="window.history.back();" class="back-button">
            <i class="fas fa-arrow-left"></i> Voltar
        </button>



    </form>
</heare>

<footer>
    © 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.
</footer>
</body>
</html>
