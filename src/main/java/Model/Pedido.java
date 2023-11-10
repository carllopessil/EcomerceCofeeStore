package Model;

import java.math.BigDecimal;
import java.util.List;

public class Pedido {
    private int id;
    private int clienteId;
    private String status;
    private BigDecimal valorTotal;
    private int enderecoEntregaId;
    private String formaPagamento;
    private List<ItemPedido> itensPedido;

    // Construtores, getters e setters

    // Exemplo de construtor
    public Pedido(int clienteId, String status, BigDecimal valorTotal, int enderecoEntregaId, String formaPagamento) {
        this.clienteId = clienteId;
        this.status = status;
        this.valorTotal = valorTotal;
        this.enderecoEntregaId = enderecoEntregaId;
        this.formaPagamento = formaPagamento;
    }

    public Pedido() {

    }

    public void setItensPedido(List<ItemPedido> itensPedido) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(BigDecimal valorTotal) {
        this.valorTotal = valorTotal;
    }

    public int getEnderecoEntregaId() {
        return enderecoEntregaId;
    }

    public void setEnderecoEntregaId(int enderecoEntregaId) {
        this.enderecoEntregaId = enderecoEntregaId;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public List<ItemPedido> getItensPedido() {
        return itensPedido;
    }

// Outros métodos, se necessário
}
