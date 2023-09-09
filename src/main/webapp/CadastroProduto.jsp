<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Produto</title>
    <link rel="stylesheet" type="text/css" href="css/CadastroDeProduto.css">
</head>
<body>
<div id="container">
    <ul class="menu">
        <li class="menu-logo">
            <img src="img/Logo de cafe.png" alt="Logo do café">
            <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
        </li>

        <li><a href="Principal.jsp">Voltar </a></li>
    </ul>
</div>

<section>
    <h1>Cadastro de Produto</h1>
</section>
<form action="CadastroProdutoServlet" method="post" enctype="multipart/form-data">
    Nome do Produto: <input type="text" name="nomeProduto" required><br>
    <input type="hidden" name="status" value="1">
    Avaliação: <input type="number" name="avaliacao" min="1" max="5" step="0.1" required><br>
    Descrição Detalhada: <textarea name="descricaoDetalhada" required></textarea><br>
    Preço do Produto: <input type="number" name="precoProduto" step="0.01" required><br>
    Quantidade em Estoque: <input type="number" name="qtdEstoque" required><br>

    <!-- Campo para imagem principal -->
    Imagem Principal: <input type="file" name="imagemPrincipal" accept="image/*" onchange="previewImage(this, 'previewPrincipal')"><br>
    <img id="previewPrincipal" src="#" alt="Preview da Imagem Principal" style="display: none; max-width: 100px; max-height: 100px;">
    <button type="button" onclick="removeImage('previewPrincipal', 'imagemPrincipal')">Remover</button>


    <!-- Campo inicial de imagem do produto -->
    <div class="image-preview" id="image-preview1">
        <label for="imagemProduto1">Imagem do Produto 1:</label>
        <input type="file" name="imagemProduto1" id="imagemProduto1" accept="image/*" onchange="previewImage(this)">
        <img id="preview1" src="#" alt="Preview da Imagem" style="display: none; max-width: 100px; max-height: 100px;">
        <button type="button" onclick="removeImage(1)">Remover</button>
    </div>

    <!-- Botão para adicionar mais campos de imagem -->
    <button type="button" onclick="addImageField()">Adicionar Imagem</button>

    <input type="submit" value="Cadastrar">
</form>

<footer>
    <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
</footer>
<script>
    // Contador para rastrear o número de campos de imagem adicionados
    let imageCount = 1;

    function addImageField() {
        imageCount++;
        const fileInput = document.createElement("input");
        fileInput.type = "file";
        fileInput.name = "imagemProduto" + imageCount;
        fileInput.id = "imagemProduto" + imageCount;
        fileInput.accept = "image/*";
        fileInput.setAttribute("onchange", "previewImage(this)");

        const label = document.createElement("label");
        label.htmlFor = "imagemProduto" + imageCount;
        label.textContent = "Imagem do Produto " + imageCount + ":";

        const preview = document.createElement("img");
        preview.id = "preview" + imageCount;
        preview.src = "#";
        preview.alt = "Preview da Imagem";
        preview.style.display = "none";
        preview.style.maxWidth = "100px";
        preview.style.maxHeight = "100px";

        const button = document.createElement("button");
        button.type = "button";
        button.textContent = "Remover";
        button.onclick = function () {
            removeImage("preview" + imageCount, "imagemProduto" + imageCount);
        };

        const form = document.querySelector("form");
        const imagePreview = document.getElementById("image-preview" + (imageCount - 1));
        form.insertBefore(label, imagePreview);
        form.insertBefore(fileInput, imagePreview);
        form.insertBefore(preview, imagePreview);
        form.insertBefore(button, imagePreview);
    }

    function previewImage(input, previewId) {
        const preview = document.getElementById(previewId);

        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                preview.style.display = "block";
                preview.src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            preview.style.display = "none";
            preview.src = "#";
        }
    }

    function removeImage(previewId, inputId) {
        const preview = document.getElementById(previewId);
        const input = document.getElementById(inputId);
        const form = document.querySelector("form");

        preview.style.display = "none";
        preview.src = "#";
        form.removeChild(input);
    }
</script>

</body>
</html>
