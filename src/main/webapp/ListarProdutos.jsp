<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/ListarProdutos.css">
    <title>Listar Produtos</title>
</head>

<body>
<div id="container">
    <ul class="menu">
        <li class="menu-logo">
            <img src="img/Logo de cafe.png" alt="Logo do café">
            <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
        </li>


        <li><a href="/ListarTop8Produtos">Voltar </a></li>
    </ul>

    <div id="usuarios-grupos">
        <%
            UsuarioBackOffice usuario = (UsuarioBackOffice) session.getAttribute("usuario");
            if (usuario != null) {
                out.println("Grupo do Usuário: " + usuario.getGrupo());
            }
        %>
    </div>

<button type="button" class="btn btn-primary" onclick="window.location.href='CadastroProduto.jsp'">
    <i class="fas fa-user-plus"></i> Cadastrar novo produto
</button>


   <div class="search-bar">
    <form action="ListarProdutos_2" method="get">
        <input class="search-input" type="text" name="searchTerm" placeholder="Digite sua pesquisa">
        <input type="submit" value="Buscar">
    </form>
       </div>


    <table border="1"  class="table table-hover table-striped">
        <thead  class="table-dark">
            <div class="pagination">
                    <c:forEach var="i" begin="1" end="${pageCount}">
                        <a href="#" onclick="irParaPagina(${i})">${i}</a>
                    </c:forEach>
                </div>
            <tr>
                <th>Código do Produto</th>
                <th>Nome do Produto</th>
                 <th>Quantidade em estoque</th>
                 <th>Preço</th>
                 <th>Status</th>
                 <c:if test="${usuario != null && usuario.getGrupo().equals('Admin Group')}">
                   <th>Habilita/Desabilita</th>
                   </c:if>
                   <th>Visualizar</th>
                   <th>Editar</th>
                   <th>Visualizar-Img</th>
            </tr>
        </thead>
         <tbody id="tabela-produtos">
            <c:forEach var="produto" items="${produtos}">
                <tr>
                    <td>${produto.produtoID}</td>
                    <td>${produto.nomeProduto}</td>
                    <td><c:out value="${produto.qtdEstoque}"/></td>
                    <td><c:out value="${produto.precoProduto}"/></td>
                    <td>${produto.statusProduto ? 'Ativo' : 'Inativo'}</td>
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
                      <a href="EditarProdutoServlet?produtoID=<c:out value='${produto.produtoID}' />">
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



<footer>
    <p1>
        © 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.
    </p1>
</footer>
<script src="eventosProduto.js"></script>

        <script>
            function irParaPagina(pagina) {
                var novaURL = window.location.href.split('?')[0] + '?page=' + pagina;
                window.location.href = novaURL;
            }
        </script>
</body>
</html>
