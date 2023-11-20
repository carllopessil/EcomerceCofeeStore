package DAO;

import Model.ItemPedido;
import Model.Pedido;
import Model.PedidoDetalhes;
import br.com.gymcontrol.Model.ItemCarrinho;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {
    private Connection connection; // Você precisa configurar a conexão com o banco de dados
    // Construtor que inicializa a conexão
    public PedidoDAO() {
        // Lógica para obter uma conexão com o banco de dados
        // Substitua os valores entre aspas com as informações do seu banco de dados
        try {
            Class.forName("org.h2.Driver");
            String url = "jdbc:h2:~/test";
            String user = "sa";
            String password = "sa";
            this.connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Trate a exceção conforme necessário
        }
    }
    public int salvarPedido(Pedido pedido) {
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
                ResultSet generatedKeys = preparedStatementPedido.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int pedidoId = generatedKeys.getInt(1);
                    pedido.setId(pedidoId);
                }

                return pedido.getId();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Lide com a exceção apropriadamente (log, redirecionamento de erro, etc.)
        }
        return -1;
    }

    public void atualizarItensPedido(Pedido pedido) {
        try {
            // Inserir informações na tabela "item_pedido"
            String queryItemPedido = "INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatementItemPedido = connection.prepareStatement(queryItemPedido)) {
                for (ItemCarrinho item : pedido.getItensPedido()) {
                    preparedStatementItemPedido.setInt(1, pedido.getId());
                    preparedStatementItemPedido.setInt(2, item.getProduto().getProdutoID());
                    preparedStatementItemPedido.setInt(3, item.getQuantidade());
                    preparedStatementItemPedido.setDouble(4, item.getProduto().getPrecoProduto());
                    preparedStatementItemPedido.setDouble(5, item.getSubtotal());

                    preparedStatementItemPedido.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Lide com a exceção apropriadamente (log, redirecionamento de erro, etc.)
        }
    }

    public static List<Pedido> listarPedidos() {
        String SQL = "SELECT * FROM Pedido ORDER BY data_pedido DESC";
        List<Pedido> pedidos = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String status = resultSet.getString("status");
                BigDecimal valorTotal = resultSet.getBigDecimal("valor_total");
                Timestamp dataPedido = resultSet.getTimestamp("data_pedido");

                // Crie um objeto Pedido com os dados recuperados
                Pedido pedido = new Pedido(id, status, valorTotal, dataPedido);

                // Adicione o pedido à lista
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pedidos;
    }

    public static void atualizarStatus(int idPedido, String novoStatus) {
        String SQL = "UPDATE pedido SET status = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, novoStatus);
            preparedStatement.setInt(2, idPedido);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar status do produto: " + e.getMessage());
        }
    }

    public PedidoDetalhes obterDetalhesPedido(int pedidoId) {
        PedidoDetalhes detalhes = new PedidoDetalhes();

        String SQL = "SELECT pedido.id AS pedido_id, pedido.cliente_id, pedido.status, pedido.valor_total, " +
                "pedido.data_pedido, pedido.endereco_entrega_id, pedido.forma_pagamento, " +
                "endereco_entrega.id AS endereco_id, endereco_entrega.cep, endereco_entrega.logradouro, " +
                "endereco_entrega.numero, endereco_entrega.complemento, endereco_entrega.cidade, " +
                "endereco_entrega.estado, item_pedido.id AS item_id, item_pedido.produto_id, " +
                "item_pedido.quantidade, item_pedido.preco_unitario, item_pedido.subtotal " +
                "FROM pedido " +
                "JOIN endereco_entrega ON pedido.endereco_entrega_id = endereco_entrega.id " +
                "JOIN item_pedido ON pedido.id = item_pedido.pedido_id " +
                "WHERE pedido.id = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setInt(1, pedidoId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                detalhes.setPedidoId(resultSet.getInt("pedido_id"));
                detalhes.setClienteId(resultSet.getInt("cliente_id"));
                detalhes.setStatus(resultSet.getString("status"));
                detalhes.setValorTotal(resultSet.getBigDecimal("valor_total"));
                detalhes.setDataPedido(resultSet.getTimestamp("data_pedido").toLocalDateTime());
                detalhes.setEnderecoEntregaId(resultSet.getInt("endereco_entrega_id"));
                detalhes.setFormaPagamento(resultSet.getString("forma_pagamento"));
                detalhes.setEnderecoId(resultSet.getInt("endereco_id"));
                detalhes.setCep(resultSet.getString("cep"));
                detalhes.setLogradouro(resultSet.getString("logradouro"));
                detalhes.setNumero(resultSet.getInt("numero"));
                detalhes.setComplemento(resultSet.getString("complemento"));
                detalhes.setCidade(resultSet.getString("cidade"));
                detalhes.setEstado(resultSet.getString("estado"));
                detalhes.setItemId(resultSet.getInt("item_id"));
                detalhes.setProdutoId(resultSet.getInt("produto_id"));
                detalhes.setQuantidade(resultSet.getInt("quantidade"));
                detalhes.setPrecoUnitario(resultSet.getBigDecimal("preco_unitario"));
                detalhes.setSubtotal(resultSet.getBigDecimal("subtotal"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Trate a exceção conforme necessário
        }

        return detalhes;
    }
}
