<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto</title>
</head>
<body>
    <h1>Cadastro de Produto</h1>
    <form action="CadastroProdutoServlet" method="post">
        Nome do Produto: <input type="text" name="nomeProduto" required><br>
        Status: <input type="checkbox" name="status" checked><br>
        Avaliação: <input type="number" name="avaliacao" min="1" max="5" step="0.1" required><br>
        Descrição Detalhada: <textarea name="descricaoDetalhada" required></textarea><br>
        Preço do Produto: <input type="number" name="precoProduto" step="0.01" required><br>
        Quantidade em Estoque: <input type="number" name="qtdEstoque" required><br>
        Caminho da Imagem: <input type="text" name="imagePATH"><br>
        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
