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
        <li><a href="Login.jsp">Sair</a></li>
    </nav>
     </ul>
<h2 class="titulo-centro">Produtos mais vendidos</h2>
 <hr>
 <div class="product-container">

        <div class="product-box">
            <img src="img/Encatodocafe.png" alt="Nome do Produto 1" class="product-image">
            <h2 class="product-title">Café</h2>
            <p>O pó de café é um produto essencial na cultura do café, e é o estado em que a maioria das pessoas encontra o café antes de ser preparado.</p>
           <span class="product-rating" id="product-rating-1"></span>
                       <br>
            <span class="product-price">R$ 29,99</span>
             <button class="buy-button">Comprar</button>
        </div>


        <div class="product-box">
            <img src="img/Kit cafe.png" alt="Nome do Produto 2" class="product-image">
            <h2 class="product-title">Kit café</h2>
            <p>Um kit de café é um conjunto cuidadosamente selecionado de itens que proporcionam uma experiência completa de preparo e degustação de café.</p>
           <span class="product-rating" id="product-rating-2"></span>
                       <br>
            <span class="product-price">R$ 49,99</span>
             <button class="buy-button">Comprar</button>
        </div>


        <div class="product-box">
            <img src="img/Capsulas1.png" alt="Nome do Produto 3" class="product-image">
            <h2 class="product-title">Kit cápsulas</h2>
            <p>Um kit de cápsulas de café é um conjunto conveniente e completo projetado para permitir que os amantes de café desfrutem de uma variedade de sabores e blends sem o incômodo de moer.</p>
            <span class="product-rating" id="product-rating-3"></span>
                        <br>
            <span class="product-price">R$ 89,99</span>
            <button class="buy-button">Comprar</button>
        </div>


        <div class="product-box">
            <img src="img/maquinadecafe.png" alt="Nome do Produto 4" class="product-image">
            <h2 class="product-title">Maquna de café</h2>
            <p>A máquina de café é um dispositivo engenhoso que simplifica a preparação de uma das bebidas mais apreciadas em todo o mundo: o café. Com um design que varia desde o simples ao sofisticado.</p>
            <span class="product-rating" id="product-rating-4"></span>
                        <br>
            <span class="product-price">R$ 199,99</span>
             <button class="buy-button">Comprar</button>
        </div>


        <div class="product-box">
            <img src="img/xicara-preta.png" alt="Nome do Produto 5" class="product-image">
            <h2 class="product-title">Kit xicara preta</h2>
            <p>A xícara preta é um elegante e sofisticado utensílio de cerâmica que se destaca por sua cor escura e atemporal.</p>
           <span class="product-rating" id="product-rating-5"></span>
                       <br>
            <span class="product-price">R$ 39,99</span>
             <button class="buy-button">Comprar</button>
        </div>
    </div>

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