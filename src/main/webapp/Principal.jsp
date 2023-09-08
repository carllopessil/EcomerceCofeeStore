<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page import="br.com.gymcontrol.Model.Produtos" %>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>Backoffice - Principal</title>
    <link rel="stylesheet" href="css/Principal.css">
</head>
<body>
    <div class="slideshow-container">
        <img class="slideshow-image active" src="img/Fundo2.jpg">
        <img class="slideshow-image" src="img/Fundo3.jpg">
        <img class="slideshow-image" src="img/Fundo5.jpg">
    </div>
    <nav>
        <ul class="menu">
            <li class="menu-logo">
                <img src="img/Logo de cafe.png">
                <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
            </li>

            <!--Acesso temporario quando sair vai diretopagina index
             <li><a href="Logout">Sair</a></li>-->

            <!--Apos ajuste final apagar essa tag e acessa a tag Logout com link-->
            <li><a href="Login.jsp">Sair</a></li>
        </ul>







        <div class="container">
            <div class="form-container">
                <div class="btn-container">
                    <form action="/ListarProdutos" method="get">
                        <button class="btn-primary" type="submit">Lista de Produtos</button>
                    </form>
                    <hr>

                    <% if (((UsuarioBackOffice) session.getAttribute("usuario")).getGrupo().equals("Admin Group")) { %>

                    <form action="/ListarUsuarioBackOffice" method="get">
                        <button class="btn-primary" type="submit">Buscar usuários dos sistemas (TESTE, EXEMPLO)</button>
                    </form>

                    <hr>

                    <form action="/ListarUsuarioBackOffice_2" method="get">
                        <button class="btn-primary" type="submit">Buscar usuários dos sistemas</button>
                    </form>
                    <%
                        UsuarioBackOffice usuario = (UsuarioBackOffice) session.getAttribute("usuario");
                        if (usuario != null && usuario.getGrupo().equals("Admin Group")) {
                    %>
                    <form action="CadastroProduto.jsp" method="get">
                        <button class="btn-primary" type="submit">Cadastro de Produto</button>
                    </form>
                    <%
                    } else {
                    %>
                    <p>Você não tem permissão para acessar esta página.</p>
                    <%
                        }
                    %>
                </div>
                <% } %>
            </div>
        </div>
    </nav>

<c:forEach var="produto" items="${Produtos}">
    <tr class="editable-row" id="row-${loop.index}">
        <label>Nome do produto: </label>
        <td><c:out value="${produto.nomeProduto}"/></td>
        <td><img src="${produto.imagePATH}" alt="Imagem do Produto"></td>
        <label>Preço do produto: </label>
        <td><c:out value="${produto.precoProduto}"/></td>
        <td>
            <a href="VisualizarImagemServlet?produtoID=${produto.produtoID}" class="btn btn-primary">
                Comprar
            </a>
        </td>
    </tr>
</c:forEach>



    <footer>
        © 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.
    </footer>
</body>
</html>