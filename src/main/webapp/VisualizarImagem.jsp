<%@ page import="br.com.gymcontrol.Model.Produtos" %>
<!DOCTYPE html>
<html>
<head>
    <title>Visualizar Produto</title>
</head>
<body>
    <h1>Detalhes do Produto</h1>

    <%
    Produtos produto = (Produtos) request.getAttribute("produto");
    if (produto != null) {
        String nomeProduto = produto.getNomeProduto();
        String descricaoDetalhada = produto.getDescricaoDetalhada();
        double avaliacao = produto.getAvaliacao();
        double precoProduto = produto.getPrecoProduto();
        int qtdEstoque = produto.getQtdEstoque();

        // Exibe todas as imagens do produto
        for (String imagePath : produto.getImagens()) {
    %>
        <img src="<%= imagePath %>" alt="Imagem do Produto">
    <%
        }
    %>

        <h2><%= nomeProduto %></h2>
        <p><%= descricaoDetalhada %></p>
        <p>Avaliação: <%= avaliacao %></p>
        <p>Preço: <%= precoProduto %></p>
        <p>Quantidade em Estoque: <%= qtdEstoque %></p>
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
