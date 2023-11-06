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
        String parametroQuantidade = request.getParameter("quantidade");
        int novaQuantidade;

        if (parametroQuantidade != null && !parametroQuantidade.isEmpty()) {
            novaQuantidade = Integer.parseInt(parametroQuantidade);
        } else {
            novaQuantidade = 1; // Defina um valor padrão, como 1, se não houver quantidade fornecida
        }

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
                        if (item.getQuantidade() + novaQuantidade <= quantidadeDisponivel) {
                            item.setQuantidade(item.getQuantidade() + novaQuantidade);
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
                    ItemCarrinho item = new ItemCarrinho(produto, novaQuantidade);
                    carrinho.add(item);
                }
                request.setAttribute("itensCarrinho", carrinho);
                request.getSession().setAttribute("carrinho", carrinho); // Atualiza o carrinho na sessão
                System.out.println("Carrinho na sessão: " + carrinho);

                response.sendRedirect("Carrinho.jsp");
                return;
            }
        }

        response.sendRedirect("ErroProdutoNaoDisponivel.jsp");
    }





}
