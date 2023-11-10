package Servlet;

import DAO.PedidoDAO;
import Model.ItemPedido;
import Model.Pedido;
import br.com.gymcontrol.Model.Cliente;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PedidoServlet")
public class PedidoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera os parâmetros do pedido do request
        HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("cliente");
        int clienteId = cliente.getId();
        String status = request.getParameter("status");
        String valorTotalParameter = request.getParameter("valorTotal");
        BigDecimal valorTotal = valorTotalParameter != null ? new BigDecimal(valorTotalParameter) : BigDecimal.ZERO;

        int enderecoEntregaId = (int) session.getAttribute("enderecoDeEntrega");
        String formaPagamento =  (String) session.getAttribute("formaDePagamento");

        // Crie uma instância de Pedido com os parâmetros recuperados
        Pedido pedido = new Pedido(clienteId, status, valorTotal, enderecoEntregaId, formaPagamento);

        // Recupera os itens do pedido do request
        List<ItemPedido> itensPedido = new ArrayList<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("produto_")) {
                int produtoId = Integer.parseInt(paramName.substring("produto_".length()));
                int quantidade = Integer.parseInt(request.getParameter(paramName));
                // Lógica para recuperar preço unitário e subtotal do produto
                BigDecimal precoUnitario = null /* Lógica para recuperar preço unitário */;
                BigDecimal subtotal = null /* Lógica para calcular subtotal */;

                // Cria um novo ItemPedido e adiciona à lista
                ItemPedido itemPedido = new ItemPedido(pedido.getId(), produtoId, quantidade, precoUnitario, subtotal);
                itensPedido.add(itemPedido);
            }
        }

        // Adiciona os itens do pedido à instância de Pedido
        pedido.setItensPedido(itensPedido);

        // Crie uma instância do seu DAO (PedidoDAO) e chame um método para salvar o pedido no banco de dados
        PedidoDAO pedidoDAO = new PedidoDAO();
        pedidoDAO.salvarPedido(pedido);

        // Redireciona para a página de confirmação ou outra página desejada
        response.sendRedirect("confirmacao.jsp");
    }
}
