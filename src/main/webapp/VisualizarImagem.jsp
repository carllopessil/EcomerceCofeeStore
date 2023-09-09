<%@ page import="br.com.gymcontrol.Model.Produtos" %>
<!DOCTYPE html>
<html>
<head>
    <title>Visualizar Imagem</title>
</head>
<body>
    <h1>Imagens do Produto</h1>

    <%
    // Supondo que você tenha o objeto Produto com a lista de URLs das imagens
    Produtos produto = (Produtos) request.getAttribute("produto");
    if (produto != null) {
        String nomeProduto = produto.getNomeProduto();
        String descricaoDetalhada = produto.getDescricaoDetalhada();

        // Itera sobre a lista de URLs das imagens
        for (String imagePath : produto.getImagens()) {
    %>
        <img src="<%= imagePath %>" alt="Imagem do Produto">
    <%
        }
    %>
        <h2><%= nomeProduto %></h2>
        <%= descricaoDetalhada %>
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
