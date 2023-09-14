<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<%@ page import="br.com.gymcontrol.Model.Produtos" %>
<%@ page import="DAO.ProdutosDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/EditarProduto.css">
</head>
<body>
<div class="edit-product-form">
    <h1>Editar Produto</h1>
    <form action="EditarProdutoServlet" method="post" enctype="multipart/form-data">
        <c:if test="${not empty produto}">
            <input type="hidden" name="produtoID" value="<c:out value='${produto.produtoID}' />">
            Nome do Produto: <input type="text" name="nomeProduto" value="<c:out value='${produto.nomeProduto}' />" required><br>
            Status do Produto: <input type="checkbox" name="status" value="1" <c:if test="${produto.statusProduto}">checked</c:if>><br>
            Avaliação: <input type="number" name="avaliacao" min="1" max="5" step="0.1" value="<c:out value='${produto.avaliacao}' />" required><br>
            Descrição Detalhada: <textarea name="descricaoDetalhada" required><c:out value='${produto.descricaoDetalhada}' /></textarea><br>
            Preço do Produto: <input type="number" name="precoProduto" step="0.01" value="<c:out value='${produto.precoProduto}' />" required><br>
            Quantidade em Estoque: <input type="number" name="qtdEstoque" value="<c:out value='${produto.qtdEstoque}' />" required><br>

            <!-- Adicione isso dentro do formulário existente no seu arquivo EditarProduto.jsp -->
            <h3>Imagens Existentes:</h3>
            <c:forEach items="${imagensExistentes}" var="imagemExistente">
                <div>
                    <img src="${imagemExistente}" alt="Imagem do Produto">
                    <button type="button" onclick="setMainImage('<c:out value="${produto.produtoID}" />', '<c:out value="${imagemExistente}" />')">Definir como Principal</button>
                    <button type="button" onclick="deleteImage('<c:out value="${imagemExistente}" />', <c:out value="${produto.produtoID}" />)">Deletar</button>
                </div>
            </c:forEach>

            <!-- Campo para fazer upload de novas imagens -->
            <label for="novaImagem">Nova Imagem:</label>
            <input type="file" name="novaImagem" id="novaImagem">

            <input type="submit" value="Salvar Alterações">
        </c:if>
    </form>
</div>

<footer>
    <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
</footer>


<script>
    function setMainImage(produtoID, imageUrl) {
        // Enviar uma solicitação para o servidor para definir a imagem como principal
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "SetMainImageServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Atualize a interface do usuário após a definição bem-sucedida da imagem principal
                // Isso pode incluir destaque visual para a imagem principal ou outra forma de feedback para o usuário.
            }
        };
        xhr.send('produtoID=' + produtoID + '&imageUrl=' + encodeURIComponent(imageUrl));
    }

    function deleteImage(imageUrl, produtoID) {
        // Enviar uma solicitação para o servidor para excluir a imagem com a URL fornecida
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "DeleteImageServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Atualize a interface do usuário após a exclusão bem-sucedida
                const deletedImage = document.querySelector('img[src="' + imageUrl + '"]');
                if (deletedImage) {
                    deletedImage.parentNode.remove(); // Remove a div que envolve a imagem e o botão
                }
            }
        };
        xhr.send('imageUrl=' + encodeURIComponent(imageUrl) + '&produtoID=' + produtoID);
    }
</script>

</body>
</html>
