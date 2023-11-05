<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumo do Pedido</title>
    <link rel="stylesheet" type="text/css" href="css/ResumoPedido.css">
</head>
<body>
    <h1>Resumo do Pedido</h1>

    <!-- Exibir informações do pedido, por exemplo, produtos, valores, quantidades, frete, endereço, forma de pagamento, total geral -->
    <table>
        <!-- Tabela com informações do pedido -->
        <tr>
            <th>Produto</th>
            <th>Valor Unitário</th>
            <th>Quantidade</th>
            <th>Valor Total</th>
        </tr>
        <!-- Loop para exibir cada item do pedido -->
        <c:forEach var="item" items="${itensDoPedido}">
            <tr>
                <td>${item.nomeProduto}</td>
                <td>${item.valorUnitario}</td>
                <td>${item.quantidade}</td>
                <td>${item.valorTotalItem}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">Frete</td>
            <td>${frete}</td>
        </tr>
        <tr>
            <td colspan="3">Total Geral</td>
            <td>${totalGeral}</td>
        </tr>
    </table>

    <!-- Informações de entrega -->
    <h2>Endereço de Entrega</h2>
    <p>${enderecoDeEntrega}</p>

    <!-- Forma de pagamento -->
    <h2>Forma de Pagamento</h2>
    <p>${formaDePagamento}</p>

    <!-- Botões para Concluir Compra e Voltar -->
    <form action="ConcluirCompraServlet" method="post">
        <input type="submit" value="Concluir Compra" class="styled-button">
    </form>
    <form action="MeiosDePagamentoServlet" method="get">
        <input type="submit" value="Voltar" class="styled-button">
    </form>
</body>
</html>
