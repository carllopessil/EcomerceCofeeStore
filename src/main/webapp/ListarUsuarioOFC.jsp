<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/ListarUsuario.css">
      <link rel="stylesheet" href="css/Bootstrap.min.css">
    <title>Document</title>


    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body >

 <div class="slideshow-container">
        <img class="slideshow-image active" src="img/Fundo2.jpg">
        <img class="slideshow-image" src="img/Fundo3.jpg">
        <img class="slideshow-image" src="img/Fundo5.jpg">
    </div>

            <ul class="menu">
                <li class="menu-logo">
                    <img src="img/Logo de cafe.png">
                    <h1>BEM-VINDO AO  BACKOFFICE</h1>
                </li>


                <li><a href="Principal.jsp">Voltar </a></li>
            </ul>
<div class="card">
    <h1>Gerenciamento de Usuários do Sistema</h1>




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
                      <td><button class="btn btn-info status-button"
                                  data-id="${UsuarioBackOffice.ID}"
                                  data-status="${UsuarioBackOffice.status}"
                                  data-url="/AtualizarStatusUsuarioBackOffice">
                              Alterar Status
                          </button> </td>
                    <td><text>${UsuarioBackOffice.grupo}</text></td>





                    <td>
                         <form action="/AtualizarUsuarioBackOffice">
                                <button type="submit">Editar</button>
                         </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="CadatrarUsuarioBackOffice.jsp" class="btn">Cadastrar Usuário</a>

</div>


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
                    // Envia a solicitação para atualizar o status
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", this.getAttribute("data-url"), true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhr.send(`ID=${userId}`);

                    // Atualiza o valor exibido na tabela (opcional)
                    const statusCell = document.querySelector(`#row-${userId} .status-cell`);
                    statusCell.textContent = newStatus === "true" ? "Ativo" : "Inativo";
                }
            });
        });
    });
</script>
<!-- ... -->

<script src="eventos_ofc.js"></script>

    <footer>
        © 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.
    </footer>
</body>
</html>
