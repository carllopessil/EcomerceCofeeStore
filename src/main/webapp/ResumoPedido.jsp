<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        <!-- Informações de entrega -->
        <h2>Endereço de Entrega</h2>
        <p>${enderecoDeEntrega}</p>

        <!-- Forma de pagamento -->
        <h2>Forma de Pagamento</h2>
        <p>${formaDePagamento}</p>

        <!-- Adiciona um campo hidden para o status do pedido -->
        <input type="hidden" name="status" value="EM_PROCESSAMENTO">

        <!-- Botões para Concluir Compra e Voltar -->
        <input type="submit" value="Concluir Compra" class="styled-button">
    </form>
    <form action="MeiosDePagamentoServlet" method="get">
        <input type="submit" value="Voltar" class="styled-button">
    </form>
</body>
</html>
