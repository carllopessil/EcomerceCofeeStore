package Servlet;

import DAO.EnderecoDAO;
import br.com.gymcontrol.Model.Cliente;
import DAO.ClienteDAO;
import br.com.gymcontrol.Model.Endereco;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static DAO.ClienteDAO.validarCPF;
@WebServlet("/CadastrarClienteServlet")
public class CadastrarClienteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cliente cliente = new Cliente();


        String nomeCompleto = request.getParameter("nomeCompleto");
        String email = request.getParameter("email");
        String cpfComMascara = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String cepFaturamento = request.getParameter("cepFaturamento");
        String logradouroFaturamento = request.getParameter("logradouroFaturamento");
        int numeroFaturamento = Integer.parseInt(request.getParameter("numeroFaturamento"));
        String complementoFaturamento = request.getParameter("complementoFaturamento");
        String bairroFaturamento = request.getParameter("bairroFaturamento");
        String cidadeFaturamento = request.getParameter("cidadeFaturamento");
        String ufFaturamento = request.getParameter("ufFaturamento");

        String cpfSemMascara = cpfComMascara.replaceAll("\\D", "");

        String confirmarSenha = request.getParameter("confirmarSenha");

        if (!senha.equals(confirmarSenha)) {
            request.setAttribute("mensagemAlerta", "As senhas não coincidem. Por favor, verifique novamente.");
            request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
            return;
        }

        if (!validarCPF(cpfSemMascara)) {
            request.setAttribute("mensagemAlerta", "CPF inválido. Por favor, insira um CPF válido.");
            request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
            return;
        }


        if (ClienteDAO.cpfExistente(cpfSemMascara)) {
            request.setAttribute("mensagemAlerta", "CPF já cadastrado.");
            request.getRequestDispatcher("CadastrarCliente.jsp").forward(request, response);
            return;
        }

        cliente.setNomeCompleto(nomeCompleto);
        cliente.setEmail(email);
        cliente.setCpf(cpfSemMascara);
        cliente.setSenha(senha);
        cliente.setCepFaturamento(cepFaturamento);
        cliente.setLogradouroFaturamento(logradouroFaturamento);
        cliente.setNumeroFaturamento(numeroFaturamento);
        cliente.setComplementoFaturamento(complementoFaturamento);
        cliente.setBairroFaturamento(bairroFaturamento);
        cliente.setCidadeFaturamento(cidadeFaturamento);
        cliente.setBairroFaturamento(bairroFaturamento);
        cliente.setUfFaturamento(ufFaturamento);

        ClienteDAO clienteDAO = new ClienteDAO();
        boolean cadastroSucesso = clienteDAO.CadastrarCliente(cliente);

        EnderecoDAO enderecoDAO = new EnderecoDAO();

        if (cadastroSucesso) {
            List<Endereco> enderecosAdicionais = new ArrayList<>();

            String[] cepsAdicionais = request.getParameterValues("cepAdicional");
            String[] logradourosAdicionais = request.getParameterValues("logradouroAdicional");
            String[] numerosAdicionais = request.getParameterValues("numeroAdicional");
            String[] complementosAdicionais = request.getParameterValues("complementoAdicional");
            String[] bairrosAdicionais = request.getParameterValues("bairroAdicional");
            String[] cidadesAdicionais = request.getParameterValues("cidadeAdicional");
            String[] ufsAdicionais = request.getParameterValues("ufAdicional");


            if (cepsAdicionais != null) {
                for (int i = 0; i < cepsAdicionais.length; i++) {
                    Endereco endereco = new Endereco();

                    endereco.setCep(cepsAdicionais[i]);
                    endereco.setLogradouro(logradourosAdicionais[i]);
                    endereco.setNumero(Integer.parseInt(numerosAdicionais[i]));
                    endereco.setComplemento(complementosAdicionais[i]);
                    endereco.setBairro(bairrosAdicionais[i]);
                    endereco.setCidade(cidadesAdicionais[i]);
                    endereco.setUf(ufsAdicionais[i]);
                    endereco.setEnderecoAtivo(true);
                    // Adicione o ID do cliente aos endereços adicionais
                    endereco.setIdCliente(cliente.getId());

                    // Adicione o endereço à lista
                    enderecosAdicionais.add(endereco);
                }

                boolean sucessoEnderecos = enderecoDAO.inserirEnderecos(enderecosAdicionais);

                if (sucessoEnderecos) {
                    request.setAttribute("mensagemSucesso", "Usuário cadastrado com sucesso!");
                } else {
                    request.setAttribute("mensagemAlerta", "Erro ao cadastrar os endereços.");
                }
            } else {
                request.setAttribute("mensagemSucesso", "Usuário cadastrado com sucesso, mas nenhum endereço adicional foi fornecido.");
            }
        }
    }
}