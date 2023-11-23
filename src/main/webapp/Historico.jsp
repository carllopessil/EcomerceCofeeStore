<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Histórico de Pedidos</title>
</head>
<body>
    <h2>Histórico de Pedidos</h2>

    <table border="1">
        <tr>
            <th>Número</th>
            <th>Data</th>
            <th>Valor Total</th>
            <th>Status</th>
            <th>Mais Detalhes</th>
        </tr>

     <c:forEach var="pedido" items="${pedidos}">
         <tr>
             <td>${pedido.id}</td>
             <td>${pedido.dataPedido}</td>
             <td>${pedido.valorTotal}</td>
             <td>${pedido.status}</td>
             <td><a href="detalhesPedido?id=${pedido.id}">Detalhes</a></td>
         </tr>
     </c:forEach>


    </table>
</body>
</html>
