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
    <form action="AlterarStatusEndereco" method="post">
        <c:forEach var="endereco" items="${enderecos2}">
            <p><strong>ID:</strong> ${endereco.id}</p>
            <p><strong>CEP:</strong> ${endereco.cep}</p>
            <input type="radio" name="enderecoPadraoId" value="${endereco.id}"> Tornar Padrão

            <input type="hidden" name="enderecoId" value="${endereco.id}">
<input type="submit" name="acao" value="excluir ${endereco.id}">Excluir
            <p><strong>Logradouro:</strong> ${endereco.logradouro}</p>
            <p><strong>Número:</strong> ${endereco.numero}</p>
            <p><strong>Complemento:</strong> ${endereco.complemento}</p>
            <p><strong>Bairro:</strong> ${endereco.bairro}</p>
            <p><strong>Cidade:</strong> ${endereco.cidade}</p>
            <p><strong>UF:</strong> ${endereco.uf}</p>
            <hr>
        </c:forEach>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>