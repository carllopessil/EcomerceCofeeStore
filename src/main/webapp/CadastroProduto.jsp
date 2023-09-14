<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de Produto</title>

    <link rel="stylesheet" type="text/css" href="css/CadastroDeProduto.css">


</head>
<body>
<div id="container">
    <div id="row">
        <div class="col-12 col-sm-6 col-md-4">

            <nav>
                <ul class="menu">
                    <li class="menu-logo">
                        <img src="img/Logo de cafe.png">
                        <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>

                    <li><a href="Principal.jsp">Voltar</a></li>
                </ul>
            </nav>
            <section>
                <h1>
                    <img src="/img/Icon-cadastro.png" alt="Ícone do Produto" class="icon">
                    Cadastro de Produto
                </h1>
            </section>

            <form action="CadastroProdutoServlet" method="post" enctype="multipart/form-data">
                <p>Nome do Produto:</p> <input type="text" name="nomeProduto" required><br>
                <input type="hidden" name="status" value="1">
                <p>Avaliação: </p>  <input type="number" name="avaliacao" min="1" max="5" step="0.1" required><br>
                <p>Descrição Detalhada:</p> <textarea name="descricaoDetalhada" required></textarea><br>
                <p> Preço do Produto:</p> <input type="number" name="precoProduto" step="0.01" required><br>
                <p>Quantidade em Estoque:</p> <input type="number" name="qtdEstoque" required><br>

                <!-- Adicione os botões de rádio para selecionar a imagem principal -->
                <h3>Selecione a Imagem Principal:</h3>
                <div id="radioButtons">
                    <!-- Botão de rádio para a imagem principal -->
                    <input type="radio" name="imagemPrincipalRadio" value="1" checked data-preview-id="preview1"><br>
                </div>
            </form>
        </div>
    </div>


    <div class=" container">
        <div id="row">
            <div class="col-12 col-sm-6 col-md-4">

                <!-- Campo inicial de imagem do produto -->
                <div class="image-preview" id="image-preview1">
                    <label for="imagemProduto1">Imagem do Produto 1:</label>
                    <input type="file" name="imagemProduto1" id="imagemProduto1" accept="image/*"
                           onchange="previewImage(this, 'preview1')">
                    <img id="preview1" src="#" alt="Preview da Imagem"
                         style="display: none; max-width: 100px; max-height: 100px;">
                    <button type="button" onclick="removeImage(1)">Remover</button>
                    <br>
                </div>
                <!-- Botão para adicionar mais campos de imagem -->

                <button type="button" onclick="addImageField()">Adicionar Imagem</button>
                <br>
                <input type="submit" value="Cadastrar" class="meu-botao">
                <%--        <input type="submit" value="Cadastrar">--%>
                <hr>
            </div>
        </div>
    </div>
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
            fileInput.setAttribute("onchange", `previewImage(this, 'preview${imageCount}')`);

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
                removeImage(imageCount);
            };

            const form = document.querySelector("form");
            const imagePreview = document.getElementById(`image-preview${imageCount - 1}`);
            form.insertBefore(label, imagePreview);
            form.insertBefore(fileInput, imagePreview);
            form.insertBefore(preview, imagePreview);
            form.insertBefore(button, imagePreview);

            // Adicione um botão de rádio associado à imagem atual
            const radioButtons = document.getElementById("radioButtons");
            const radioButton = document.createElement("input");
            radioButton.type = "radio";
            radioButton.name = "imagemPrincipalRadio";
            radioButton.value = imageCount;
            radioButtons.appendChild(radioButton);
        }

        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);

            if (input.files && input.files[0]) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    preview.style.display = "flex";
                    preview.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                preview.style.display = "none";
                preview.src = "#";
            }
        }

        function removeImage(imageNumber) {
            const preview = document.getElementById(`preview${imageNumber}`);
            const input = document.getElementById(`imagemProduto${imageNumber}`);
            const form = document.querySelector("form");

            preview.style.display = "none";
            preview.src = "#";
            form.removeChild(input);

            // Também remova o botão de rádio associado quando uma imagem é removida
            const radioButtonToRemove = document.querySelector(`input[name="imagemPrincipalRadio"][value="${imageNumber}"]`);
            if (radioButtonToRemove) {
                radioButtonToRemove.remove();
            }
        }
    </script>

    <div id="roda-pe">
        <footer>
            <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
        </footer>
    </div>
</div>
</body>
</html>
