<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meios de Pagamento</title>
    <link rel="stylesheet" type="text/css" href="css/MeiosDePagamento.css">
</head>
<body>
    <h1>Escolha seu Meio de Pagamento</h1>

    <form id="meiosDePagamentoForm" action="/ResumoPedidoServlet" method="get">
        <label for="formaPagamento">Forma de Pagamento:</label>
        <select name="formaPagamento" id="formaPagamento">
            <option value="boleto">Boleto</option>
            <option value="cartao">Cartão de Crédito</option>
        </select>

        <div id="cartaoFields" style="display: none;">
            <label for="numeroCartao">Número do Cartão:</label>
            <input type="text" name="numeroCartao" id="numeroCartao">

            <label for="codigoVerificador">Código Verificador:</label>
            <input type="text" name="codigoVerificador" id="codigoVerificador">

            <label for="nomeCompleto">Nome Completo:</label>
            <input type="text" name="nomeCompleto" id="nomeCompleto">

            <label for="dataVencimento">Data de Vencimento:</label>
            <input type="text" name="dataVencimento" id="dataVencimento">

            <label for="quantidadeParcelas">Quantidade de Parcelas:</label>
            <input type="number" name="quantidadeParcelas" id="quantidadeParcelas">
        </div>

        <input type="submit" value="Avançar para Validar Pedido Final" class="styled-button">
    </form>

    <script>
        document.getElementById("formaPagamento").addEventListener("change", function() {
            var selectedValue = this.value;
            var cartaoFields = document.getElementById("cartaoFields");
            if (selectedValue === "cartao") {
                cartaoFields.style.display = "block";
            } else {
                cartaoFields.style.display = "none";
            }
        });

        document.getElementById("meiosDePagamentoForm").addEventListener("submit", function(event) {
            var formaPagamento = document.getElementById("formaPagamento").value;
            var numeroCartao = document.getElementById("numeroCartao").value;
            var codigoVerificador = document.getElementById("codigoVerificador").value;
            var nomeCompleto = document.getElementById("nomeCompleto").value;
            var dataVencimento = document.getElementById("dataVencimento").value;
            var quantidadeParcelas = document.getElementById("quantidadeParcelas").value;

            if (formaPagamento === "cartao" && (numeroCartao === "" || codigoVerificador === "" || nomeCompleto === "" || dataVencimento === "" || quantidadeParcelas === "")) {
                alert("Preencha todos os campos do cartão de crédito.");
                event.preventDefault();
            } else if (formaPagamento === "boleto") {
                // Não é necessário preencher nada para o boleto
            } else {
                alert("Selecione uma forma de pagamento.");
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
