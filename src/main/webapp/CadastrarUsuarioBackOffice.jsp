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

    <% String mensagemAlertaCPF = (String) request.getAttribute("mensagemAlertaCPF"); %>
    <% if (mensagemAlertaCPF != null) { %>
        <div class="alert alert-danger">
            <%= mensagemAlertaCPF %>
        </div>
    <% } %>


    <form action="/CadastrarUsuarioBackOffice" method="post">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

             <label for="CPF">CPF:</label>
               <input type="text" name="CPF" id="cpfInput" required oninput="aplicarMascaraCPF(this)">

                <hr>


        <label for="senha">Senha:</label>
        <input type="password" name="senha" id="senha" required><br>

        <label for="confirmarSenha">Confirmar:</label>
        <input type="password" name="confirmarSenha" id="confirmarSenha" required><br>


        <label for="grupo">Grupo:</label>
        <input type="text" name="grupo"><br>

        <label for="status">Status:</label>
        <input type="checkbox" name="status" checked><br>


       <button type="submit" class="submit-button" onclick="return validarSenhas();">
           <i class="fas fa-user-plus"></i> Cadastrar
       </button>

        <button style="background-color: rgba(31,8,8,0.04)"></button> <!-- Back button -->
        <button onclick="window.history.back();" class="back-button">
            <i class="fas fa-arrow-left"></i> Voltar
        </button>

    </form>

    <div id="mensagem-erro" style="color: red;"></div>

    <script>

        // Dentro da função de callback do XMLHttpRequest
        if (this.readyState == 4) {
            if (this.status == 200) {
                // Atualizar a página após a atualização do status
                window.location.reload();
            } else if (this.status == 400) {
                // Exibir a mensagem de erro na página
                var mensagemErro = document.getElementById("mensagem-erro");
                mensagemErro.innerHTML = "Erro: " + this.responseText;
            }
        }

         function formatarCPF(cpf) {
                cpf = cpf.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                return cpf;
            }

            function aplicarMascaraCPF(input) {
                var cpfAtualizado = formatarCPF(input.value);
                input.value = cpfAtualizado;
            }

            function validarSenhas() {
                    var senha = document.getElementById("senha").value;
                    var confirmarSenha = document.getElementById("confirmarSenha").value;

                    if (senha !== confirmarSenha) {
                        alert("As senhas não coincidem. Por favor, verifique novamente.");
                        return false;
                    }
                    return true;
                }
    </script>

</body>
</html>
