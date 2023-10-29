package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProdutosDAO;
import br.com.gymcontrol.Model.ItemCarrinho;
import br.com.gymcontrol.Model.Produtos;

@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {

    private ProdutosDAO produtosDAO;

    public void init() {
        produtosDAO = new ProdutosDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int produtoID = Integer.parseInt(request.getParameter("produtoID"));

        Produtos produto = produtosDAO.obterProdutoPorID(produtoID);

        if (produto != null) {
            int quantidadeDisponivel = produtosDAO.obterQuantidadeDisponivel(produtoID);

            if (quantidadeDisponivel > 0) {
                ArrayList<ItemCarrinho> carrinho = (ArrayList<ItemCarrinho>) request.getSession().getAttribute("carrinho");
                if (carrinho == null) {
                    carrinho = new ArrayList<>();
                }

                boolean produtoJaNoCarrinho = false;
                for (ItemCarrinho item : carrinho) {
                    if (item.getProduto().getProdutoID() == produtoID) {
                        if (item.getQuantidade() < quantidadeDisponivel) {
                            item.setQuantidade(item.getQuantidade() + 1);
                            produtoJaNoCarrinho = true;
                        } else {
                            request.setAttribute("erroQuantidade", "Quantidade máxima atingida para este produto.");
                            response.sendRedirect("Carrinho.jsp");  // Redireciona para o carrinho
                            return;
                        }
                        break;
                    }
                }

                if (!produtoJaNoCarrinho) {
                    ItemCarrinho item = new ItemCarrinho(produto, 1);
                    if (quantidadeDisponivel > 1) {
                        carrinho.add(item);
                    } else {
                        request.setAttribute("erroQuantidade", "Quantidade máxima atingida para este produto.");
                        response.sendRedirect("Carrinho.jsp");

                        return;
                    }
                }

                request.getSession().setAttribute("carrinho", carrinho);
                response.sendRedirect("Carrinho.jsp");
                return;
            }
        }

        response.sendRedirect("ErroProdutoNaoDisponivel.jsp");
    }
}