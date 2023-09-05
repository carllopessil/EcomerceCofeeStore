package br.com.gymcontrol.Model;

public class Produtos {
    private int produtoID;
    private String nomeProduto;
    private boolean statusProduto;

    private double avaliacao;
    private String descricaoDetalhada;
    private double precoProduto;
    private int qtdEstoque;

    public String getImagePATH() {
        return imagePATH;
    }

    public void setImagePATH(String imagePATH) {
        this.imagePATH = imagePATH;
    }

    private String imagePATH;

    public Produtos() {
    }

    public Produtos(int produtoID, String nomeProduto, boolean statusProduto, double avaliacao, String descricaoDetalhada, double precoProduto, int qtdEstoque, String imagePATH) {
        this.produtoID = produtoID;
        this.nomeProduto = nomeProduto;
        this.statusProduto = statusProduto;
        this.avaliacao = avaliacao;
        this.descricaoDetalhada = descricaoDetalhada;
        this.precoProduto = precoProduto;
        this.qtdEstoque = qtdEstoque;
        this.imagePATH = imagePATH;
    }

    public Produtos(int produtoID, String nomeProduto, boolean statusProduto, double avaliacao, String descricaoDetalhada, double precoProduto, int qtdEstoque) {
        this.produtoID = produtoID;
        this.nomeProduto = nomeProduto;
        this.statusProduto = statusProduto;
        this.avaliacao = avaliacao;
        this.descricaoDetalhada = descricaoDetalhada;
        this.precoProduto = precoProduto;
        this.qtdEstoque = qtdEstoque;
    }

    public int getProdutoID() {
        return produtoID;
    }

    public void setProdutoID(int produtoID) {
        this.produtoID = produtoID;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public boolean isStatusProduto() {
        return statusProduto;
    }

    public void setStatusProduto(boolean statusProduto) {
        this.statusProduto = statusProduto;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getDescricaoDetalhada() {
        return descricaoDetalhada;
    }

    public void setDescricaoDetalhada(String descricaoDetalhada) {
        this.descricaoDetalhada = descricaoDetalhada;
    }

    public double getPrecoProduto() {
        return precoProduto;
    }

    public void setPrecoProduto(double precoProduto) {
        this.precoProduto = precoProduto;
    }

    public int getqtdEstoque() {
        return qtdEstoque;
    }

    public void setQtdEstoque(int qtdEstoque) {
        this.qtdEstoque = qtdEstoque;
    }

    public int getQtdEstoque() {
        return qtdEstoque;
    }


}