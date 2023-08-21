<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
          crossorigin="anonymous">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body class="container" style="background-color: #DEDEDE;">
<div class="card card-body mt-5">
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
                <th>Grupo</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody id="tabela-usuarios">
            <c:forEach var="UsuarioBackOffice" items="${UsuarioBackOffice}" varStatus="loop">
                <tr class="editable-row" id="row-${loop.index}">
                    <td><text>${UsuarioBackOffice.ID}</text></td>
                    <td><input class="editable nome" value="${UsuarioBackOffice.nome}" disabled data-rowid="row-${loop.index}"></td>
                    <td><text>${UsuarioBackOffice.email}</text></td>
                    <td><text>${UsuarioBackOffice.status}</text></td>
                    <td><input class="editable grupo" value="${UsuarioBackOffice.grupo}" disabled data-rowid="row-${loop.index}"></td>
                    <td>
                        <button class="btn btn-primary edit-button">Editar</button>
                        <form class="edit-form" action="/atualizarUsuarioBackOffice" method="post">
                            <input type="hidden" name="id" value="${UsuarioBackOffice.ID}">
                            <input type="hidden" class="input-nome" name="nome">
                            <input type="hidden" class="input-grupo" name="grupo">

                            <button class="btn btn-success save-button" disabled>Salvar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="eventos.js"></script>
</body>
</html>
