<%@ page import="Model.PedidoDetalhes" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalhes do Pedido</title>
</head>
<body>

<h1>Detalhes do Pedido</h1>

<%
    PedidoDetalhes detalhes = (PedidoDetalhes) request.getAttribute("detalhes");
    // Agora você pode acessar as propriedades do objeto detalhes e exibi-las na página
%>

<p>Quantidade: <%= detalhes.getQuantidade() %></p>
<p>Subtotal: <%= detalhes.getSubtotal() %></p>

<h1>Detalhes do Endereço</h1>
<p>ID do endereço: <%= detalhes.getEnderecoEntregaId() %></p>
<p>CEP: <%= detalhes.getCep() %></p>
<p>Logradouro: <%= detalhes.getLogradouro() %></p>
<p>Complemento: <%= detalhes.getComplemento() %></p>
<p>Número: <%= detalhes.getNumero() %></p>
<p>Cidade: <%= detalhes.getCidade() %></p>
<p>Estado: <%= detalhes.getEstado() %></p>

<h1>Detalhes do Pagamento</h1>
<p>Forma de pagamento: <%= detalhes.getFormaPagamento() %></p>



</body>
</html>
