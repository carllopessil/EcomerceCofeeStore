<%@ page import="Model.PedidoDetalhes" %>
<%@ page import="Model.ItemPedidoDetalhes" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Detalhes do Pedido</title>
</head>
<body>


    <h1>Detalhes do Pedido</h1>





    <% PedidoDetalhes detalhes = (PedidoDetalhes) request.getAttribute("detalhes"); %>

    <!-- Verifique se a lista de itensPedido não é nula antes de iterar -->
    <c:if test="${not empty detalhes.itensPedido}">
        <h1>Itens do Pedido</h1>
        <table border="1">
            <tr>
                <th>Produto ID</th>
                <th>Nome do Produto</th>
                <th>Quantidade</th>
                <th>Preço Unitário</th>
                <th>Subtotal</th>
            </tr>
            <!-- Iteração sobre a lista de itensPedido -->
            <c:forEach var="item" items="${detalhes.itensPedido}">
                <tr>
                    <td>${item.produtoId}</td>
                    <td>${item.nomeProduto}</td>
                    <td>${item.quantidade}</td>
                    <td>${item.precoUnitario}</td>
                    <td>${item.subtotal}</td>
                </tr>
            </c:forEach>
        </table>

            <h2>Detalhes do Pedido</h2>
            <p>Pedido ID: ${detalhes.pedidoId}</p>
            <p>Cliente ID: ${detalhes.clienteId}</p>
            <p>Forma pagamento: ${detalhes.formaPagamento}</p>
            <p>Valor Total: ${detalhes.valorTotal}</p>
            <p>Data do Pedido: ${detalhes.dataPedido}</p>
            <!-- Adicione os demais campos conforme necessário -->
    </c:if>

</body>
</html>