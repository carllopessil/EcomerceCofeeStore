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

    <%-- Obter o ID do endereço selecionado --%>
    <% Object enderecoSelecionadoIdObj = request.getAttribute("enderecoSelecionadoId"); %>

    <%-- Verificar se o atributo não é nulo e é uma instância de String --%>
    <% if (enderecoSelecionadoIdObj != null && enderecoSelecionadoIdObj instanceof String) { %>
        <%-- Converter o atributo para String --%>
        <% String enderecoSelecionadoId = (String) enderecoSelecionadoIdObj; %>

        <p>Endereço Selecionado:</p>
        <p>ID: <%= enderecoSelecionadoId %></p>
        <%-- Adicione aqui as demais informações do endereço --%>
    <% } else { %>
        <p>Nenhum endereço selecionado.</p>
    <% } %>

    <form id="meiosDePagamentoForm" action="/ResumoPedidoServlet" method="get"> <!-- Alterado para método POST -->
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
          </script>
      </body>
      </html>