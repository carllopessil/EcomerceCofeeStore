<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de Produto</title>
    <style>
        .image-preview {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="container">
    <nav>
        <ul class="menu">
            <li class="menu-logo">
                <img src="img/Logo de cafe.png">
                <h1>BEM-VINDO AO BREWMASTERS CAFÉ.BACKOFFICE</h1>
            </li>
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

        <!-- Campo inicial de imagem do produto -->
        <div class="image-preview">
            <label for="imagemProduto1">Imagem do Produto 1:</label>
            <input type="file" name="imagemProduto1" id="imagemProduto1" accept="image/*"
                   onchange="previewImage(this)">
            <img class="preview" src="#" alt="Preview da Imagem"
                 style="display: none; max-width: 100px; max-height: 100px;">
            <button type="button" onclick="removeImage(this)">Remover</button>
            <br>
        </div>

        <div class="image-previews"></div>

        <div class=" container">
            <div id="row">
                <div class="col-12 col-sm-6 col-md-4">
                    <!-- Botão para adicionar mais campos de imagem -->
                    <button type="button" onclick="addImageField()">Adicionar Imagem</button>
                    <br>
                    <input type="submit" value="Cadastrar" class="meu-botao">
                    <hr>
                </div>
            </div>
        </div>
    </form>

    <div id="roda-pe">
        <footer>
            <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
        </footer>
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
            fileInput.setAttribute("onchange", `previewImage(this)`);

            const label = document.createElement("label");
            label.htmlFor = "imagemProduto" + imageCount;
            label.textContent = "Imagem do Produto " + imageCount + ":";

            const preview = document.createElement("img");
            preview.classList.add("preview");
            preview.src = "#";
            preview.alt = "Preview da Imagem";
            preview.style.display = "none";
            preview.style.maxWidth = "100px";
            preview.style.maxHeight = "100px";

            const button = document.createElement("button");
            button.type = "button";
            button.textContent = "Remover";
            button.onclick = function () {
                removeImage(button);
            };

            const imagePreview = document.querySelector(".image-previews");
            imagePreview.appendChild(label);
            imagePreview.appendChild(fileInput);
            imagePreview.appendChild(preview);
            imagePreview.appendChild(button);

            // Adicione um botão de rádio associado à imagem atual
            const radioButtons = document.getElementById("radioButtons");
            const radioButton = document.createElement("input");
            radioButton.type = "radio";
            radioButton.name = "imagemPrincipalRadio";
            radioButton.value = imageCount;
            radioButtons.appendChild(radioButton);
        }

        function previewImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    const preview = input.nextElementSibling.nextElementSibling;
                    preview.style.display = "block";
                    preview.src = e.target.result;

                    const imagePreviews = document.querySelector('.image-previews');
                    const previewImage = document.createElement("img");
                    previewImage.src = e.target.result;
                    previewImage.style.maxWidth = "100px";
                    previewImage.style.maxHeight = "100px";
                    imagePreviews.appendChild(previewImage);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function removeImage(button) {
            const div = button.parentElement;

            // Remova apenas o campo de imagem específico
            div.remove();

            // Atualiza os valores dos botões de rádio
            updateRadioButtons();
        }

        // Função para atualizar os valores dos botões de rádio após a remoção de uma imagem
        function updateRadioButtons() {
            const radioButtons = document.getElementsByName("imagemPrincipalRadio");
            for (let i = 0; i < radioButtons.length; i++) {
                radioButtons[i].value = i + 1;
            }
        }
    </script>
</div>
</body>
</html>
