package br.com.gymcontrol.Model;

import br.com.gymcontrol.Model.Produtos;

public class ItemCarrinho {
    private Produtos produto;
    private int quantidade;

    public ItemCarrinho(Produtos produto, int quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public Produtos getProduto() {
        return produto;
    }

    public void setProduto(Produtos produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getSubtotal() {
        return produto.getPrecoProduto() * quantidade;
    }
}
