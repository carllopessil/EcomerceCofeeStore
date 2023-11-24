<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumo do Pedido</title>
    <link rel="stylesheet" type="text/css" href="css/ResumoPedido.css">
    <link rel="stylesheet" type="text/css" href="css/">
</head>
<body>


<video poster="https://i.gifer.com/fetch/w300-preview/09/097db72c8ff26d217f187fedb73f6d32.gif" loop autoplay muted
       playsinline>
    <source src="https://i.gifer.com/1410.mp4" type="video/mp4">
</video>

<h1>Resumo do Pedido</h1>

<div id="container">

    <!-- Exibir informações do pedido, por exemplo, produtos, valores, quantidades, frete, endereço, forma de pagamento, total geral -->
    <form action="PedidoServlet" method="post">
        <table>
            <!-- Tabela com informações do pedido -->
            <tr>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Preço unitário</th>
                <th>Valor subtotal</th>
            </tr>
            <!-- Loop para exibir cada item do pedido -->
            <c:forEach var="item" items="${itensCarrinho}">
                <tr>
                    <td>${item.produto.nomeProduto}</td>
                    <td>${item.quantidade}</td>
                    <td>R$ ${item.produto.precoProduto}</td>
                    <td>R$ ${item.subtotal}</td>
                </tr>
            </c:forEach>


            <tr>
                <td colspan="3">Total sem frete</td>
                <td>${totalGeral}</td>
            </tr>
        </table>
        <div id="enderco-entrega">
            <!-- Informações de entrega -->
            <h2>Endereço de Entrega</h2>
            <p>${enderecoDeEntrega}</p><img style="width: 60px; height: 40px; display: block; -webkit-user-select: none; margin: auto; background-color: hsl(0, 0%, 90%);" src="https://www.boutiquea.cl/wp-content/uploads/2021/06/65047-delivery-truck-animation.gif">
            <!-- Forma de pagamento -->
            <h2>Forma de Pagamento</h2>
            <p>${formaDePagamento}</p>


        </div>

        <style>
            /* Estilos para o status EM_PROCESSAMENTO */
            input[name="status"][value="Compra em processamento"] + .status-display {
                color: orange;
            }

            /* Estilos para o status OUTRO_STATUS */
            input[name="status"][value="OUTRO_STATUS"] + .status-display {
                color: red;
            }

        </style>
        <!-- Adiciona um campo hidden para o status do pedido -->
        <input type="hidden" name="status" value="EM_PROCESSAMENTO">

        <!-- Elemento visualmente relacionado com a classe status-display -->
        <div class="status-display">Status: COMPRA EM PROCESSAMENTO</div>

        <!-- Botões para Concluir Compra e Voltar -->
        <img src="img/carrinhoComprar.jpg" width="40" height="40">
        <input type="submit" value="Concluir Compra"class="styled-button">

    </form>
    <form action="MeiosDePagamentoServlet" method="get">
        <input type="submit" value="Voltar" class="styled-button">
    </form>

</div>
<script>
    function mudarStatus() {
        // Simula a mudança de status para OUTRO_STATUS
        document.querySelector('input[name="status"]').value = 'OUTRO_STATUS';
        atualizarExibicaoStatus();
    }

    function atualizarExibicaoStatus() {
        // Atualiza dinamicamente a exibição do status com base no valor do campo
        const statusInput = document.querySelector('input[name="status"]');
        const statusDisplay = document.querySelector('.status-display');

        // Aplica os estilos com base no valor do campo de status
        if (statusInput.value === 'COMPRA EM PROCESSAMENTO') {
            statusDisplay.style.color = 'orange';
        } else if (statusInput.value === 'OUTRO_STATUS') {
            statusDisplay.style.color = 'red';
        }

        // Atualiza o texto do elemento de exibição do status
        statusDisplay.textContent = 'Status: ' + statusInput.value;
    }

    // BUTTOM COMPRAR
    // Adicione este script para manipular o clique do botão
    document.addEventListener('DOMContentLoaded', function () {
        var styledButton = document.querySelector('.styled-button');

    });



</script>

</body>
</html>



<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Resumo do Pedido</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/ResumoPedido.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<style>--%>


<%--    video {--%>
<%--        position: fixed;--%>
<%--        top: 0;--%>
<%--        left: 0;--%>
<%--        width: 50%;--%>
<%--        height: 50%;--%>
<%--        object-fit: cover;--%>
<%--        z-index: -1;--%>
<%--    }--%>
<%--</style>--%>

<%--<video poster="https://i.gifer.com/fetch/w300-preview/09/097db72c8ff26d217f187fedb73f6d32.gif" loop autoplay muted--%>
<%--       playsinline>--%>
<%--    <source src="https://i.gifer.com/1410.mp4" type="video/mp4">--%>
<%--</video>--%>

<%--<h1>Resumo do Pedido</h1>--%>

<%--<!-- Exibir informações do pedido, por exemplo, produtos, valores, quantidades, frete, endereço, forma de pagamento, total geral -->--%>
<%--<form action="PedidoServlet" method="post">--%>
<%--    <table>--%>
<%--        <!-- Tabela com informações do pedido -->--%>
<%--        <tr>--%>
<%--            <th>Produto</th>--%>
<%--            <th>Quantidade</th>--%>
<%--            <th>Preço unitário</th>--%>
<%--            <th>Valor subtotal</th>--%>
<%--        </tr>--%>
<%--        <!-- Loop para exibir cada item do pedido -->--%>
<%--        <c:forEach var="item" items="${itensCarrinho}">--%>
<%--            <tr>--%>
<%--                <td>${item.produto.nomeProduto}</td>--%>
<%--                <td>${item.quantidade}</td>--%>
<%--                <td>R$ ${item.produto.precoProduto}</td>--%>
<%--                <td>R$ ${item.subtotal}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>


<%--        <tr>--%>
<%--            <td colspan="3">Total sem frete</td>--%>
<%--            <td>${totalGeral}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <!-- Informações de entrega -->--%>
<%--    <h2>Endereço de Entrega</h2>--%>
<%--    <p>${enderecoDeEntrega}</p>--%>

<%--    <!-- Forma de pagamento -->--%>
<%--    <h2>Forma de Pagamento</h2>--%>
<%--    <p>${formaDePagamento}</p>--%>

<%--    <!-- Adiciona um campo hidden para o status do pedido -->--%>
<%--    <input type="hidden" name="status" value="EM_PROCESSAMENTO">--%>

<%--    <!-- Botões para Concluir Compra e Voltar -->--%>
<%--    <input type="submit" value="Concluir Compra" class="styled-button">--%>
<%--</form>--%>
<%--<form action="MeiosDePagamentoServlet" method="get">--%>
<%--    <input type="submit" value="Voltar" class="styled-button">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>