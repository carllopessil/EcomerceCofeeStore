<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Endereços do Cliente</title>
</head>
<body>
    <h1>Endereços do Cliente</h1>
    <c:forEach var="endereco" items="${enderecos2}">
        <p><strong>ID:</strong> ${endereco.id}</p>
        <p><strong>CEP:</strong> ${endereco.cep}</p>
        <!-- Adicione o botão para alterar o status do endereço -->
        <form action="/AlterarStatusEndereco" method="post">
            <input type="hidden" name="enderecoId" value="${endereco.id}">
            <input type="submit" value="Alterar Status">
        </form>
        <p><strong>Logradouro:</strong> ${endereco.logradouro}</p>
        <p><strong>Número:</strong> ${endereco.numero}</p>
        <p><strong>Complemento:</strong> ${endereco.complemento}</p>
        <p><strong>Bairro:</strong> ${endereco.bairro}</p>
        <p><strong>Cidade:</strong> ${endereco.cidade}</p>
        <p><strong>UF:</strong> ${endereco.uf}</p>
        <hr>
    </c:forEach>
</body>
</html>
