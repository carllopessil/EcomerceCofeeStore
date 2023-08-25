<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Usuários</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
          crossorigin="anonymous">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body class="container" style="background-color: #DEDEDE;">
<div class="card card-body mt-5">
    <h1>Gerenciamento de Usuários do Sistema</h1>

    <a href="CadatrarUsuarioBackOffice.jsp" class="btn">Cadastrar Usuário</a>

    <hr>

    <input id="input-busca" type="text" class="form-control mt-3 mb-3" placeholder="O que você procura?">

    <table class="table table-hover table-striped">
        <thead class="table-dark">
        <tr>
            <th>#ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Status</th>
            <th>Habilitar/Desabilitar</th>
            <th>Grupo</th>
            <th>Editar</th>
        </tr>
        </thead>
        <tbody id="tabela-usuarios">
        <c:forEach var="UsuarioBackOffice" items="${UsuarioBackOffice}" varStatus="loop">
            <tr class="editable-row" id="row-${loop.index}">
                <td><text>${UsuarioBackOffice.ID}</text></td>
                <td><text>${UsuarioBackOffice.nome}</text></td>
                <td><text>${UsuarioBackOffice.email}</text></td>
                <td><text>${UsuarioBackOffice.status}</text></td>
                <td>
                    <button class="btn btn-info status-button"
                            data-id="${UsuarioBackOffice.ID}"
                            data-status="${UsuarioBackOffice.status}"
                            data-url="/AtualizarStatusUsuarioBackOffice">
                        Alterar Status
                    </button>
                </td>
                <td><text>${UsuarioBackOffice.grupo}</text></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- ... -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const statusButtons = document.querySelectorAll(".status-button");

        statusButtons.forEach(button => {
            button.addEventListener("click", function() {
                const userId = this.getAttribute("data-id");
                const newStatus = this.getAttribute("data-status") === "true" ? "false" : "true";

                console.log("Id:", userId);
                console.log("newStatus:", newStatus);

                if (confirm("Tem certeza de que deseja alterar o status deste usuário?")) {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", this.getAttribute("data-url"), true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            console.log("Resposta da solicitação AJAX:", xhr.responseText);
                            const statusCell = document.querySelector(`#row-${userId} td:nth-child(4)`);
                            statusCell.textContent = newStatus === "true" ? "Ativo" : "Inativo";
                        }
                    };
                    xhr.send(`ID=${userId}`);
                }
            });
        });
    });

</script>
</body>
</html>
