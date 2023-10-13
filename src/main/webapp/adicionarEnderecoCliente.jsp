<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adicionar Endereço</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>Adicionar Endereço</h1>
    <form action="AdicionarEnderecoServlet" method="post">
        <input type="hidden" name="clienteId" value="${cliente.id}" />
        <label for="cep">CEP:</label>
        <input type="text" id="cep" name="cep" required>
        <button type="button" id="buscarCEP">Buscar CEP</button><br>
        <label for="logradouro">Logradouro:</label>
        <input type="text" id="logradouro" name="logradouro" required><br>
        <label for="numero">Número:</label>
        <input type="number" id="numero" name="numero" required><br>
        <label for="complemento">Complemento:</label>
        <input type="text" id="complemento" name="complemento"><br>
        <label for="bairro">Bairro:</label>
        <input type="text" id="bairro" name="bairro" required><br>
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade" required><br>
        <label for="uf">UF:</label>
        <input type="text" id="uf" name="uf" required><br>
        <input type="submit" name="action" value="Salvar e Continuar">
        <input type="submit" name="action" value="Salvar e Voltar">
    </form>
    <div id="resultadoCEP"></div>

    <script>
        $(document).ready(function() {
            $("#buscarCEP").click(function() {
                var cep = $("#cep").val();
                cep = cep.replace('-', '');

                if (cep.length !== 8) {
                    alert("CEP inválido. Digite um CEP com 8 dígitos.");
                    return;
                }

                $.get("https://viacep.com.br/ws/" + cep + "/json/", function(data) {
                    if (data.erro) {
                        alert("CEP não encontrado.");
                    } else {
                        $("#logradouro").val(data.logradouro);
                        $("#bairro").val(data.bairro);
                        $("#cidade").val(data.localidade);
                        $("#uf").val(data.uf);
                    }
                });
            });
        });
    </script>
</body>
</html>
