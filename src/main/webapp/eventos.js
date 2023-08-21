
const INPUT_BUSCA = document.getElementById('input-busca');
const TABELA_USUARIOS = document.getElementById('tabela-usuarios');

INPUT_BUSCA.addEventListener('keyup', () => {
    let expressao = INPUT_BUSCA.value.toLowerCase();

    if (expressao.length === 1) {
        return;
    }

    let linhas = TABELA_USUARIOS.getElementsByTagName('tr');

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


});

const EDIT_BUTTONS = document.querySelectorAll('.edit-button');
const SAVE_BUTTONS = document.querySelectorAll('.save-button');
const EDITABLE_FIELDS = document.querySelectorAll('.editable');

for (let i = 0; i < EDIT_BUTTONS.length; i++) {
    EDIT_BUTTONS[i].addEventListener('click', () => {
        const fields = EDIT_BUTTONS[i].parentNode.parentNode.querySelectorAll('.editable');

        fields.forEach(field => {
            field.removeAttribute('disabled');
        });

        SAVE_BUTTONS.forEach(button => {
            button.disabled = true;
        });
        SAVE_BUTTONS[i].disabled = false;

        const nomeInput = fields[0]; // Índice 0 corresponde ao campo "Nome"
        const grupoInput = fields[1]; // Índice 1 corresponde ao campo "Grupo"

        // Preencher os campos hidden no formulário de salvar
        const form = EDIT_BUTTONS[i].parentNode.querySelector('.edit-form');
        form.querySelector('.input-nome').value = nomeInput.value;
        form.querySelector('.input-grupo').value = grupoInput.value;
    });

    SAVE_BUTTONS[i].addEventListener('click', () => {
        const form = EDIT_BUTTONS[i].parentNode.querySelector('.edit-form');
        const nomeInput = form.querySelector('.input-nome');
        const grupoInput = form.querySelector('.input-grupo');


        // Preencha os campos ocultos com os valores apropriados
        nomeInput.value = EDITABLE_FIELDS[0].value; // ou o valor correto do campo "Nome"
        grupoInput.value = EDITABLE_FIELDS[1].value; // ou o valor correto do campo "Grupo"

        form.submit();
            window.location.href = "/ListarUsuarioBackOffice.jsp";

    });
}
