<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Cliente</title>
</head>
<body>
    <h1>Cadastro de Cliente</h1>

    <form action="CadastrarClienteServlet" method="post">
        <label for="nomeCompleto">Nome Completo:</label>
        <input type="text" name="nomeCompleto" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="cpf">CPF:</label>
        <input type="text" name="cpf" required pattern="\d{11}"><br>

        <label for="senha">Senha:</label>
        <input type="password" name="senha" required><br>

        <label for="cepFaturamento">CEP Faturamento:</label>
        <input type="text" name="cepFaturamento" required><br>

        <label for="logradouroFaturamento">Logradouro Faturamento:</label>
        <input type="text" name="logradouroFaturamento" required><br>

        <label for="numeroFaturamento">Número Faturamento:</label>
        <input type="number" name="numeroFaturamento" required><br>

        <label for="complementoFaturamento">Complemento Faturamento:</label>
        <input type="text" name="complementoFaturamento"><br>

        <label for="bairroFaturamento">Bairro Faturamento:</label>
        <input type="text" name="bairroFaturamento" required><br>

        <label for="cidadeFaturamento">Cidade Faturamento:</label>
        <input type="text" name="cidadeFaturamento" required><br>

        <label for="ufFaturamento">UF Faturamento:</label>
        <input type="text" name="ufFaturamento" required maxlength="2"><br>

        <label for="idEnderecoPadrao">ID Endereço Padrão:</label>
        <input type="number" name="idEnderecoPadrao" required><br>

        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
