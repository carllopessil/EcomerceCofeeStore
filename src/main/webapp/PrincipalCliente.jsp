<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page import="br.com.gymcontrol.Model.Produtos" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>Tela Inicial Cliente</title>
    <link rel="stylesheet" href="css/Principal.css">
        <style>
            .product-description {
                max-width: 300px; /* Defina o valor máximo de largura desejado */
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            .product-image {
                width: 300px; /* Defina o tamanho horizontal desejado */
                height: 300px; /* Mantenha o mesmo valor que o tamanho horizontal para manter a imagem quadrada */
                overflow: hidden;
            }

            .product-image img {
                width: 100%; /* Ajusta a largura da imagem para preencher a div de imagem */
                height: auto; /* Altura automática para manter a proporção original da imagem */
            }
                .product-description, .product-name {
                    max-width: 300px; /* Defina o valor máximo de largura desejado */
                    overflow: hidden;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                }

        </style>

</head>
<body>
    <div class="slideshow-container">
        <img class="slideshow-image active" src="img/Fundo2.jpg">
        <img class="slideshow-image" src="img/Fundo3.jpg">
        <img class="slideshow-image" src="img/Fundo5.jpg">
    </div>
    <nav>
        <ul class="menu">
            <li class="menu-logo">
                <img src="img/Logo de cafe.png">
                <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
            </li>

        <div class="container">
            <div class="form-container">
                <div class="btn-container">
                    <form action="/ListarProdutos_2" method="get">
                        <button class="btn-primary" type="submit">Lista de Produtos</button>
                    </form>
                    <hr>

                    <form action="/ListarUsuarioBackOffice_2" method="get">
                        <button class="btn-primary" type="submit">Buscar usuários dos sistemas</button>
                    </form>


                </div>
            </div>
        </div>
        <li><a href="Login.jsp">Sair</a></li>
    </nav>
     </ul>
<h2 class="titulo-centro">Ultimos produtos adicionados</h2>
 <hr>


<c:forEach var="produto" items="${Produtos}">
    <div class="product-box">

        <div class="product-image">
            <img src="${produto.imagePATH}" alt="Imagem do Produto">
        </div>
        <div class="product-details">
            <h2 class="product-name">${produto.nomeProduto}</h2>

            <p class="product-description">${produto.descricaoDetalhada}</p>
            <span class="product-rating" id="product-rating-1"></span>
            <br>
            <p class="product-price">R$: <span>${produto.precoProduto}</span></p>

            <h2>${produto.avaliacao}</h2>
 <a class="buy-button" href="ComprarCliente?produtoID=<c:out value='${produto.produtoID}' />">                COMPRAR
            </a>
        </div>
    </div>
</c:forEach>



    <footer>
        © 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.
    </footer>
</body>
</html>