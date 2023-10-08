<!DOCTYPE html>
<%@ page import="br.com.gymcontrol.Model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Cliente</title>
</head>
<body>
    <h1>Cadastro de Cliente</h1>

    <% String mensagemSucesso = (String) request.getAttribute("mensagemSucesso"); %>
                <% if (mensagemSucesso != null) { %>
            <div class="alert alert-success">
                <%= mensagemSucesso %>
            </div>
                <% } %>

    <% String mensagemAlertaCPF = (String) request.getAttribute("mensagemAlertaCPF"); %>
    <% if (mensagemAlertaCPF != null) { %>
        <div class="alert alert-danger">
            <%= mensagemAlertaCPF %>
        </div>
    <% } %>

    <% String mensagemAlerta = (String) request.getAttribute("mensagemAlerta"); %>
    <% if (mensagemAlerta != null) { %>
        <div class="alert alert-danger">
            <%= mensagemAlerta %>
        </div>
    <% } %>

    <form action="/CadastrarClienteServlet" method="post">


<label for="nomeCompleto">Nome Completo:</label>
 <input type="text" name="nomeCompleto" required><br>

<label for="email">Email:</label>
 <input type="email" name="email" required><br>

<label for="cpf">CPF:</label>
 <input type="text" name="cpf" id="cpf" placeholder="000.000.000.-00" necessário
 oninput="aplicarMascaraCPF(this)">
 <div id="password-container">
                <label for="senha">Senha:</label>
                <input type="password" name="senha" id="senha" placeholder="Password" required><br>

                <label for="confirmarSenha">Confirmar:</label>
                <input type="password" name="confirmarSenha" id="confirmarSenha" placeholder="Password" required><br>

                <label for="showPassword" id="showPasswordLabel">
                    <input type="checkbox" id="showPassword">
                    Mostrar senha
                    <span class="show-password-icon"><i class="fas fa-eye"></i></span>
                </label>
                </div>

 <h2>Endereço Principal</h2>
<br>

<label for="cepFaturamento">CEP Faturamento:</label>
 <input type="text" name="cepFaturamento" required><br>

<label for="logradouroFaturamento">Logradouro Faturamento:</label>
 <input type="text" name="logradouroFaturamento" required><br>

<label for="numeroFaturamento">Número Faturamento:</label>
 <input type="número" name="numeroFaturamento" required><br>

<label for="complementoFaturamento">Complemento Faturamento:</label>
 <input type="text" name="complementoFaturamento"><br>

<label for="bairroFaturamento">Bairro Faturamento:</label>
 <input type="text" name="bairroFaturamento" required><br>

<label for="cidadeFaturamento">Cidade Faturamento:</label>
 <input type="text" name="cidadeFaturamento" required><br>

<label for="ufFaturamento">UF Faturamento:</label>
 <select id="ufFaturamento" name="ufFaturamento" obrigatório>
 <option value="AC">AC</option>
    <option value="AL">AL</option>
    <option value="AP">AP</option>
    <option value="AM">AM</option>
    <option value="BA">BA</option>
    <option value="CE">CE</option>
    <option value="DF">DF</option>
    <option value="ES">ES</option>
    <option value="GO">GO</option>
    <option value="MA">MA</option>
    <option value="MT">MT</option>
    <option value="MS">MS</option>
    <option value="MG">MG</option>
    <option value="PA">PA</option>
    <option value="PB">PB</option>
    <option value="PR">PR</option>
    <option value="PE">PE</option>
    <option value="PI">PI</option>
    <option value="RJ">RJ</option>
    <option value="RN">RN</option>
    <option value="RS">RS</option>
    <option value="RO">RO</option>
    <option value="RR">RR</option>
    <option value="SC">SC</option>
    <option value="SP">SP</option>
    <option value="SE">SE</option>
    <option value="TO">TO</option>
       </select>    <br>


    <br>
                      <button type="button" onclick="adicionarEndereco()">Adicionar Endereço</button><br><br>



            <br>

    <div id="enderecos"></div>


<button type="submit" class="submit-button" onclick="return validarSenhas();">
                <i class="fas fa-user-plus"></i> Cadastrar
            </button>
    </form>


    <script>
        function adicionarEndereco() {
            var divEnderecos = document.getElementById("enderecos");
            var novoEndereco = document.createElement("div");
            novoEndereco.innerHTML = `
                <h2>Endereço Adicional</h2>
                <label for="cepAdicional">CEP:</label>
                <input type="text" name="cepAdicional" required><br>

                <label for="logradouroAdicional">Logradouro:</label>
                <input type="text" name="logradouroAdicional" required><br>

                <label for="numeroAdicional">Número:</label>
                <input type="number" name="numeroAdicional" required><br>

                <label for="complementoAdicional">Complemento:</label>
                <input type="text" name="complementoAdicional"><br>

                <label for="bairroAdicional">Bairro:</label>
                <input type="text" name="bairroAdicional" required><br>

                <label for="cidadeAdicional">Cidade:</label>
                <input type="text" name="cidadeAdicional" required><br>

                <label for="ufAdicional">UF:</label>
                <select name="ufAdicional" required>
 <option value="AC">AC</option>
    <option value="AL">AL</option>
    <option value="AP">AP</option>
    <option value="AM">AM</option>
    <option value="BA">BA</option>
    <option value="CE">CE</option>
    <option value="DF">DF</option>
    <option value="ES">ES</option>
    <option value="GO">GO</option>
    <option value="MA">MA</option>
    <option value="MT">MT</option>
    <option value="MS">MS</option>
    <option value="MG">MG</option>
    <option value="PA">PA</option>
    <option value="PB">PB</option>
    <option value="PR">PR</option>
    <option value="PE">PE</option>
    <option value="PI">PI</option>
    <option value="RJ">RJ</option>
    <option value="RN">RN</option>
    <option value="RS">RS</option>
    <option value="RO">RO</option>
    <option value="RR">RR</option>
    <option value="SC">SC</option>
    <option value="SP">SP</option>
    <option value="SE">SE</option>
    <option value="TO">TO</option>
    </select>
    <br>
                <button type="button" onclick="apagarEndereco(this)">Apagar Endereço</button><br><br>
            `;
            divEnderecos.appendChild(novoEndereco);
        }

        function apagarEndereco(botao) {
            var divEndereco = botao.parentElement;
            divEndereco.remove();
        }



          function formatarCPF(cpf) {
                cpf = cpf.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d)/, '$1.$2');
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
                return cpf;
            }

            function aplicarMascaraCPF(input) {
                var cpfAtualizado = formatarCPF(input.value);
                input.value = cpfAtualizado;
            }


            function validarSenhas() {
                var senha = document.getElementById("senha").value;
                var confirmarSenha = document.getElementById("confirmarSenha").value;

                if (senha !== confirmarSenha) {
                    alert("As senhas não coincidem. Por favor, verifique novamente.");
                    return false;
                }
                return true;
            }


            const showPasswordCheckbox = document.getElementById("showPassword");
            const senhaInput = document.getElementById("senha");
            const confirmarSenhaInput = document.getElementById("confirmarSenha");
            const showPasswordIcon = document.querySelector(".show-password-icon");

            showPasswordCheckbox.addEventListener("change", function () {
                if (this.checked) {
                    senhaInput.type = "text";
                    confirmarSenhaInput.type = "text";
                    showPasswordIcon.innerHTML = '<i class="fas fa-eye-slash"></i>';
                } else {
                    senhaInput.type = "password";
                    confirmarSenhaInput.type = "password";
                    showPasswordIcon.innerHTML = '<i class="fas fa-eye"></i>';
                }
            });

    </script>
</body>
</html>
