<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrinho de Compras</title>
</head>
<body>

<c:if test="${not empty erroQuantidade}">
    <div class="alert alert-danger">${erroQuantidade}</div>
</c:if>

    <h1>Produtos no Carrinho</h1>

    <c:if test="${not empty carrinho}">
        <table border="1">
            <tr>
                <th>Nome do Produto</th>
                <th>Quantidade</th>
                <th>Subtotal</th>
                <th>Excluir</th>
            </tr>
            <c:set var="total" value="0" /> <!-- Inicializa a variável total -->
            <c:forEach var="item" items="${carrinho}" varStatus="loop">
                <tr data-id="${item.produto.produtoID}">
                    <td>${item.produto.nomeProduto}</td>
                    <td>${item.quantidade}</td>
                    <td class="subtotal">R$ ${item.subtotal}</td>
                    <td>
                        <button class="btn-excluir" data-id="${item.produto.produtoID}">Excluir</button>
                    </td>
                </tr>
                <c:set var="total" value="${total + item.subtotal}" /> <!-- Soma o subtotal ao total -->
            </c:forEach>
        </table>
        <p id="totalSemFrete">Total sem frete: R$ ${total}</p> <!-- Exibe o total -->
    </c:if>

    <c:choose>
        <c:when test="${sessionScope.cliente == null}">
            <h2> Calcular frete: </h2>
            <label for="cepFaturamento">CEP:</label>
            <input type="text" name="cepFaturamento" id="cepFaturamento" placeholder="0.0000-000" required>

            <div id="container-button-cep">
                <div class="row-button">
                    <button type="button" id="buscarCEP"> OK </button>
                </div>
            </div>

            <div id="opcoesEntrega" style="display:none;">
                <h2>Tipos de entrega:</h2>
                <p>RECEBER NO MEU ENDEREÇO</p>
                <p>Turbo - Entrega em 60 minutos</p>
                <input type="radio" name="frete" value="10.90" id="freteTurbo"> 10.90<br>

                <p>Entrega rápida</p>
                <input type="radio" name="frete" value="4.90" id="freteRapida"> 4.90<br>

                <p>Normal - 1 dia(s) útil(eis)</p>
                <input type="radio" name="frete" value="3.90" id="freteNormal"> 3.90<br>

                <p> *O prazo de retirada do pedido inicia-se após a confirmação do pagamento. Escolha a forma de entrega na página de pagamento.</p>
            </div>
        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${not empty cliente}" >
            <h1>Tipos de entrega:</h1>
            <p>RECEBER NO MEU ENDEREÇO</p>
            <p>CEP: ${cliente.cepFaturamento}</p>
            <p>Turbo - Entrega em 60 minutos</p>
            <input type="radio" name="frete" value="10.90" id="freteTurbo"> 10.90<br>

            <p>Entrega rápida</p>
            <input type="radio" name="frete" value="4.90" id="freteRapida"> 4.90<br>

            <p>Normal - 1 dia(s) útil(eis)</p>
            <input type="radio" name="frete" value="3.90" id="freteNormal"> 3.90<br>

            <p> *O prazo de retirada do pedido inicia-se após a confirmação do pagamento. Escolha a forma de entrega na página de pagamento.</p>
        </c:when>
        <c:otherwise>
            <form action="LoginCliente.jsp" method="get">
                <button class="btn-primary" type="submit"><p> COMPRAR</p></button>
            </form>
        </c:otherwise>
    </c:choose>

    <p id="totalAtualizado" style="display:none;">Total com frete : R$ <span>0.00</span></p>

    <script>
        $(document).ready(function () {
            $("#buscarCEP").click(function () {
                var cep = $("#cepFaturamento").val();
                cep = cep.replace('-', '');

                var cepRegex = /^[0-9]{8}$/;
                if (!cepRegex.test(cep)) {
                    alert("CEP inválido. Digite um CEP com 8 dígitos.");
                    return;
                }

                $.get("https://viacep.com.br/ws/" + cep + "/json/", function (data) {
                    if (data.erro) {
                        alert("CEP não encontrado.");
                    } else {
                        $("#opcoesEntrega").show();
                    }
                });
            });

            $('input[name="frete"]').change(function () {
                var freteSelecionado = $('input[name="frete"]:checked').val();
                var total = parseFloat(freteSelecionado) + parseFloat('${total}');
                $('#totalAtualizado span').text(total.toFixed(2));

                $('#totalAtualizado').show();
            });

            $('.btn-excluir').click(function () {
                var produtoID = $(this).data('id');

                $.ajax({
                    url: 'removerDoCarrinho',
                    method: 'POST',
                    data: {produtoID: produtoID},
                    success: function () {
                        $('tr[data-id="' + produtoID + '"]').remove();

                        var total = calcularTotal();
                        $('#totalSemFrete').text('Total sem frete: R$ ' + total.toFixed(2));

                        var freteSelecionado = $('input[name="frete"]:checked').val();
                        var totalComFrete = parseFloat(freteSelecionado) + total;
                        $('#totalAtualizado span').text(totalComFrete.toFixed(2));
                    },
                    error: function () {
                        alert('Erro ao excluir o item do carrinho');
                    }
                });
            });

            function calcularTotal() {
                var total = 0;
                $('.subtotal').each(function () {
                    total += parseFloat($(this).text().replace('R$ ', ''));
                });
                return total;
            }
        });
 </script>
         </body>
         </html>