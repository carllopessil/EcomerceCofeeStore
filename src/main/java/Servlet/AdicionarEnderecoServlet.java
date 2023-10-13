package Servlet;

import DAO.EnderecoDAO;
import br.com.gymcontrol.Model.Endereco;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdicionarEnderecoServlet")
public class AdicionarEnderecoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        int clienteId = Integer.parseInt(request.getParameter("clienteId"));
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        Endereco endereco = new Endereco();
        endereco.setCep(cep);
        endereco.setLogradouro(logradouro);
        endereco.setNumero(numero);
        endereco.setComplemento(complemento);
        endereco.setBairro(bairro);
        endereco.setCidade(cidade);
        endereco.setUf(uf);

        EnderecoDAO enderecoDAO = new EnderecoDAO();
        enderecoDAO.adicionarEndereco(clienteId, endereco);

        if ("Salvar e Continuar".equals(action)) {
            response.sendRedirect("adicionarEnderecoCliente.jsp");
        } else if ("Salvar e Voltar".equals(action)) {
            response.sendRedirect("perfilCliente.jsp");
        }
    }
}
