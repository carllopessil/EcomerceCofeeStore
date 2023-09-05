<%@ page import="br.com.gymcontrol.Model.Produtos" %>
<!DOCTYPE html>
<html>
<head>
    <title>Visualizar Imagem</title>
</head>
<body>
    <h1>Imagem do Produto</h1>

    <%
    // Supondo que você tenha o objeto Produto com o URL da imagem
    Produtos produto = (Produtos) request.getAttribute("produto");
    if (produto != null) {
    %>
        <img src="<%= produto.getImagePATH() %>" alt="Imagem do Produto">
    <%
    } else {
    %>
        <p>Produto não encontrado.</p>
    <%
    }
    %>

    <a href="ListaProdutos.jsp">Voltar para a lista de produtos</a>
</body>
</html>
