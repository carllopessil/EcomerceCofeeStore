<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/ListarUsuario2.css">


</head>
<body>
<%
UsuarioBackOffice usuario = (UsuarioBackOffice) session.getAttribute("usuario");
if (usuario != null) {
    out.println("Grupo do Usuário: " + usuario.getGrupo());
}
%>

<input type="hidden" id="todosProdutos" value='<c:out value="${todosProdutosJSON}" />'>

<input id="input-busca" type="text" class="form-control mt-3 mb-3" placeholder="Digite o que você procura">
<table class="table table-hover table-striped">
    <thead class="table-dark">
        <tr>
            <th>Código do Produto</th>
            <th>Produto</th>
            <th>Status</th>
            <th>Preço</th>
            <th>Quantidade em estoque</th>
            <c:if test="${usuario != null && usuario.getGrupo().equals('Admin Group')}">
                <th>Habilita/Desabilita</th>
            </c:if>
            <th>Visualizar</th>
            <th>Editar</th>
        </tr>
    </thead>
    <tbody id="tabela-produtos">
      <c:forEach var="produto" items="${Produtos}" varStatus="loop">
          <tr class="editable-row" id="row-${loop.index}">
              <td><c:out value="${produto.produtoID}" /></td>
              <td><c:out value="${produto.nomeProduto}" /></td>
              <td>${produto.statusProduto ? 'Ativo' : 'Inativo'}</td>
              <td><c:out value="${produto.precoProduto}" /></td>
              <td><c:out value="${produto.qtdEstoque}" /></td>
              <c:if test="${usuario != null && usuario.getGrupo().equals('Admin Group')}">
                  <td>
                      <label class="switch">
                          <input type="checkbox" ${produto.statusProduto ? 'checked' : ''}
                              onchange="confirmarAtualizacaoStatus(${produto.produtoID}, this.checked)">
                          <span class="slider round"></span>
                      </label>
                  </td>
              </c:if>
              <td>
                  <a href="/Visualizar">
                      <img src="img/visualizar.png" alt="Imagem visualizar">
                  </a>
              </td>
              <td>
                  <a href="/Editar">
                      <img src="img/Editar.png" alt="Imagem Editar">
                  </a>
              </td>
              <td>
                  <a href="VisualizarImagemServlet?produtoID=<c:out value='${produto.produtoID}' />">
                      <img src="img/visualizar.png" alt="Imagem visualizar">
                  </a>
              </td>
          </tr>
      </c:forEach>


    </tbody>
</table>
<div class="pagination">
    <c:if test="${pageCount > 1}">
        <ul>
            <c:forEach var="i" begin="1" end="${pageCount}">
                <li><a href="?page=${i}">${i}</a></li>
            </c:forEach>
        </ul>
    </c:if>
</div>


<script src="eventosProduto.js"></script>
</body>
</html>
