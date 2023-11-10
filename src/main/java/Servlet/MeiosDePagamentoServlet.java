package Servlet;

import DAO.EnderecoDAO;
import br.com.gymcontrol.Model.Endereco;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MeiosDePagamentoServlet")
public class MeiosDePagamentoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lógica para lidar com a escolha da forma de pagamento, se necessário

        // Recuperar o ID do endereço selecionado
        String enderecoSelecionadoId = request.getParameter("enderecoSelecionadoId");

        // Armazenar o ID do endereço selecionado na sessão
        HttpSession session = request.getSession();
        session.setAttribute("enderecoSelecionadoId", enderecoSelecionadoId);

        // Passar o ID do endereço selecionado para a próxima página
        request.setAttribute("enderecoSelecionadoId", enderecoSelecionadoId);

        // Redirecionar para a página "MeiosDePagamento.jsp"
        request.getRequestDispatcher("MeiosDePagamento.jsp").forward(request, response);
    }
}
