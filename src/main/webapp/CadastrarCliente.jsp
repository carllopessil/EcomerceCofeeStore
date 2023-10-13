
<!DOCTYPE html>
<%@ page import="br.com.gymcontrol.Model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

 <label for="cep">CEP:</label>
    <input type="text" name="cepFaturamento" id="cepFaturamento" required>
    <button type="button" id="buscarCEP">Buscar CEP</button>

    <div id="resultadoCEP">

<label for="logradouroFaturamento">Logradouro Faturamento:</label>
        <input type="text" name="logradouroFaturamento" id="logradouroFaturamento" required><br>

        <label for="numeroFaturamento">Número Faturamento:</label>
         <input type="número" name="numeroFaturamento" required><br>

         <label for="complementoFaturamento">Complemento Faturamento:</label>
                  <input type="text" name="complementoFaturamento" required><br>

        <label for="bairroFaturamento">Bairro Faturamento:</label>
        <input type="text" name="bairroFaturamento" id="bairroFaturamento" required><br>

        <label for="cidadeFaturamento">Cidade Faturamento:</label>
        <input type="text" name="cidadeFaturamento" id="cidadeFaturamento" required><br>

        <label for="ufFaturamento">UF Faturamento:</label>
        <select id="ufFaturamento" name="ufFaturamento" required>


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

</div>
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
            <label for="cepAD">CEP:</label>
                <input type="text" name="cepAdicional" id="cepAdicional" required>
        <button type="button" class="buscarCEPAdicional">Buscar CEP</button>

                <div id="resultadoCEPad">

            <label for="logradouroAdicional">Logradouro:</label>
                    <input type="text" name="logradouroAdicional" id="logradouroAdicional" required><br>

                    <label for="numeroAdicional">Número:</label>
                     <input type="número" name="numeroAdicional" required><br>

                     <label for="complementoAdicional">complemento Adicional:</label>
                    <input type="text" name="complementoAdicional" required><br>

                    <label for="bairroAdicional">Bairro Faturamento:</label>
                    <input type="text" name="bairroAdicional" id="bairroAdicional" required><br>

                    <label for="cidadeAdicional">Cidade Faturamento:</label>
                    <input type="text" name="cidadeAdicional" id="cidadeAdicional" required><br>

                    <label for="ufAdicional">UF Faturamento:</label>
                    <select id="ufAdicional" name="ufAdicional" required>

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
            </div>

    <br>
                <button type="button" onclick="apagarEndereco(this)">Apagar Endereço</button><br><br>
            `;
            divEnderecos.appendChild(novoEndereco);
        }

        document.addEventListener('click', function(e) {
            if(e.target && e.target.classList.contains('buscarCEPAdicional')) {
                buscarCEPAdicional(e.target);
            }
        });

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


   $(document).ready(function() {
               $("#buscarCEP").click(function() {

                   var cep = $("#cepFaturamento").val();
            cep = cep.replace('-', '');

                   // Verifique se o CEP possui 8 dígitos
                   if (cep.length !== 8) {
                       alert("CEP inválido. Digite um CEP com 8 dígitos.");
                       return;
                   }

                   // Faça a chamada à API do ViaCEP
                   $.get("https://viacep.com.br/ws/" + cep + "/json/", function(data) {
                       if (data.erro) {
                           alert("CEP não encontrado.");
                       } else {
                           // Preencha os campos com os dados do CEP
                           $("#logradouroFaturamento").val(data.logradouro);
                           $("#bairroFaturamento").val(data.bairro);
                           $("#cidadeFaturamento").val(data.localidade);
                           $("#ufFaturamento").val(data.uf);
                           // Adicione outras informações que desejar preencher
                       }
                   });
               });
           });



function buscarCEPAdicional(botao) {
    var divEndereco = botao.parentElement;

    var cepAdicional = divEndereco.querySelector("#cepAdicional").value;
    cepAdicional = cepAdicional.replace('-', '');

     // Verifique se o CEP possui 8 dígitos
     if (cepAdicional.length !== 8) {
         alert("CEP inválido. Digite um CEP com 8 dígitos.");
         return;
     }

     // Faça a chamada à API do ViaCEP
     $.get("https://viacep.com.br/ws/" + cepAdicional + "/json/", function(data) {
         if (data.erro) {
             alert("CEP não encontrado.");
         } else {
             // Preencha os campos com os dados do CEP
           divEndereco.querySelector("#logradouroAdicional").value = data.logradouro;
                   divEndereco.querySelector("#bairroAdicional").value = data.bairro;
                   divEndereco.querySelector("#cidadeAdicional").value = data.localidade;
                   divEndereco.querySelector("#ufAdicional").value = data.uf;  // Adicione outras informações que desejar preencher
         }
     });
 }

    </script>
</body>
</html>
