document.addEventListener('DOMContentLoaded', function () {
    const INPUT_BUSCA = document.getElementById('input-busca');
    const TABELA_PRODUTOS = document.getElementById('tabela-produtos');

    INPUT_BUSCA.addEventListener('keyup', () => {
        let expressao = INPUT_BUSCA.value.toLowerCase();

        if (expressao.length === 0) {
            let linhas = TABELA_PRODUTOS.getElementsByTagName('tr');

            for (let posicao in linhas) {
                if (true === isNaN(posicao)) {
                    continue;
                }

                linhas[posicao].style.display = '';
            }
        } else {
            let linhas = TABELA_PRODUTOS.getElementsByTagName('tr');

            for (let posicao in linhas) {
                if (true === isNaN(posicao)) {
                    continue;
                }

                let conteudoDaLinha = linhas[posicao].innerHTML.toLowerCase();

                if (true === conteudoDaLinha.includes(expressao)) {
                    linhas[posicao].style.display = '';
                } else {
                    linhas[posicao].style.display = 'none';
                }
            }
        }
    });
});


 function confirmarAtualizacaoStatus(produtoId, novoStatus) {
     var confirmacao = confirm("Deseja realmente alterar o status do produto?");

     if (confirmacao) {
         atualizarStatusProduto(produtoId, novoStatus);

         var switchElement = document.querySelector(`#row-${produtoId} .slider`);
         switchElement.classList.toggle("green", novoStatus);
         switchElement.classList.toggle("red", !novoStatus);
     } else {
         var checkbox = document.querySelector(`#row-${produtoId} input[type="checkbox"]`);
         checkbox.checked = !novoStatus;
     }
 }


    function atualizarStatusProduto(produtoId, novoStatus) {
        // Criação do objeto XMLHttpRequest
        var xhttp = new XMLHttpRequest();

        // Configuração da função de callback para quando a resposta for recebida
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // Atualizar a página após a atualização do status
                window.location.reload();
            }
        };

        // Abertura da requisição POST para o servlet responsável por atualizar o status do produto
        xhttp.open("POST", "AtualizaStatusProdutoServlet?produtoId=" + produtoId + "&novoStatus=" + novoStatus, true);
        xhttp.send();
    }

    const modal = document.querySelector('.modal-container')

    function openModal() {
      modal.classList.add('active')
    }

    function closeModal() {
      modal.classList.remove('active')
    }





