package Model;

import br.com.gymcontrol.Model.Cliente;

public class Pedido {
    private int numeroPedido;
    private double valorTotal;
    private String statusPedido;
    private Cliente cliente;
    // Outros atributos, construtores e métodos getters/setters

    public Pedido(int numeroPedido, double valorTotal, String statusPedido, Cliente cliente) {
        this.numeroPedido = numeroPedido;
        this.valorTotal = valorTotal;
        this.statusPedido = statusPedido;
        this.cliente = cliente;
    }

    public Pedido() {
    }
}

