package DAO;

import Model.ItemPedido;
import Model.Pedido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PedidoDAO {
    private Connection connection; // Você precisa configurar a conexão com o banco de dados

    public void salvarPedido(Pedido pedido) {
        try {
            // Inserir informações na tabela "pedido"
            String queryPedido = "INSERT INTO pedido (cliente_id, status, valor_total, endereco_entrega_id, forma_pagamento) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatementPedido = connection.prepareStatement(queryPedido, PreparedStatement.RETURN_GENERATED_KEYS)) {
                preparedStatementPedido.setInt(1, pedido.getClienteId());
                preparedStatementPedido.setString(2, pedido.getStatus());
                preparedStatementPedido.setBigDecimal(3, pedido.getValorTotal());
                preparedStatementPedido.setInt(4, pedido.getEnderecoEntregaId());
                preparedStatementPedido.setString(5, pedido.getFormaPagamento());

                preparedStatementPedido.executeUpdate();

                // Recupera o ID gerado para o pedido
                // (Isso pode variar dependendo do banco de dados, aqui é um exemplo genérico)
                // ResultSet generatedKeys = preparedStatementPedido.getGeneratedKeys();
                // if (generatedKeys.next()) {
                //     int pedidoId = generatedKeys.getInt(1);
                //     pedido.setId(pedidoId);
                // }

                // Inserir informações na tabela "item_pedido"
                String queryItemPedido = "INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatementItemPedido = connection.prepareStatement(queryItemPedido)) {
                    for (ItemPedido item : pedido.getItensPedido()) {
                        preparedStatementItemPedido.setInt(1, 0);
                        preparedStatementItemPedido.setInt(2, item.getProdutoId());
                        preparedStatementItemPedido.setInt(3, item.getQuantidade());
                        preparedStatementItemPedido.setBigDecimal(4, item.getPrecoUnitario());
                        preparedStatementItemPedido.setBigDecimal(5, item.getSubtotal());

                        preparedStatementItemPedido.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Lide com a exceção apropriadamente (log, redirecionamento de erro, etc.)
        }
    }
}
