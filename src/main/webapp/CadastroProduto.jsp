<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto</title>
    <link rel="stylesheet" type="text/css" href="css/CadastroDeProduto.css">
</head>
<body>
<div id="container">
    <ul class="menu">
        <li class="menu-logo">
            <img src="img/Logo de cafe.png" alt="Logo do café">
            <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
        </li>

        <li><a href="Principal.jsp">Voltar </a></li>
    </ul>
</div>

<section>
    <h1>Cadastro de Produto</h1>
</section>
<form action="CadastroProdutoServlet" method="post" enctype="multipart/form-data">
    Nome do Produto: <input type="text" name="nomeProduto" required><br>
    Status: <input type="checkbox" name="status" checked><br>
    Avaliação: <input type="number" name="avaliacao" min="1" max="5" step="0.1" required><br>
    Descrição Detalhada: <textarea name="descricaoDetalhada" required></textarea><br>
    Preço do Produto: <input type="number" name="precoProduto" step="0.01" required><br>
    Quantidade em Estoque: <input type="number" name="qtdEstoque" required><br>
    Imagem do Produto: <input type="file" name="imagemProduto"><br>
    <input type="submit" value="Cadastrar">
</form>

<footer>
    <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
</footer>
</body>
</html>
