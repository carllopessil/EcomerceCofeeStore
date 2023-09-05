package DAO;

import br.com.gymcontrol.Model.Produtos;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static java.lang.System.out;

public class ProdutosDAO {

    public static List<Produtos> listarProdutosPaginados(int offset, int produtosPorPagina) {
        String SQL = "SELECT * FROM Produtos ORDER BY produtoID DESC LIMIT ? OFFSET ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setInt(1, produtosPorPagina);
            preparedStatement.setInt(2, offset);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Produtos> produtos = new ArrayList<>();

            while (resultSet.next()) {

                int produtoID = resultSet.getInt("produtoID");
                String nomeProduto = resultSet.getString("nomeProduto");
                boolean statusProduto = resultSet.getBoolean("statusProduto");
                double avaliacao = resultSet.getDouble("avaliacao");
                String descricaoDetalhada = resultSet.getString("descricaoDetalhada");
                double precoProduto = resultSet.getDouble("precoProduto");
                int quantidadeEstoque = resultSet.getInt("qtdEstoque");


                Produtos produtosAdc = new Produtos(produtoID, nomeProduto, statusProduto, avaliacao, descricaoDetalhada, precoProduto, quantidadeEstoque);

                produtos.add(produtosAdc);

            }

            out.println("success in select * Produtos");

            connection.close();

            return produtos;

        } catch (SQLException e) {
            System.out.println("Erro ao buscar produtos paginados: " + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public static void inserirProduto(Produtos novoProduto) {
        String SQL = "INSERT INTO Produtos (NomeProduto, Status, Avaliacao, DescricaoDetalhada, PrecoProduto, QtdEstoque, ImagePATH) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, novoProduto.getNomeProduto());
            preparedStatement.setBoolean(2, novoProduto.isStatusProduto());
            preparedStatement.setDouble(3, novoProduto.getAvaliacao());
            preparedStatement.setString(4, novoProduto.getDescricaoDetalhada());
            preparedStatement.setDouble(5, novoProduto.getPrecoProduto());
            preparedStatement.setInt(6, novoProduto.getQtdEstoque());
            preparedStatement.setString(7, novoProduto.getImagePATH());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                System.out.println("Inserção de produto falhou, nenhum registro foi adicionado.");
            } else {
                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int novoProdutoID = generatedKeys.getInt(1);
                    novoProduto.setProdutoID(novoProdutoID);
                    System.out.println("Produto inserido com sucesso. Novo ID do produto: " + novoProdutoID);
                } else {
                    System.out.println("Inserção de produto falhou, nenhum ID foi retornado.");
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro ao inserir produto: " + e.getMessage());
        }
    }

    public static void updateStatusProduto(int produtoID, boolean novoStatus) {
        String SQL = "UPDATE Produtos SET statusProduto = ? WHERE ProdutoID = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setBoolean(1, novoStatus);
            preparedStatement.setInt(2, produtoID);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao atualizar status do produto: " + e.getMessage());
        }
    }

    public static int calcularPageCount(int produtosPorPagina) {
        String SQL = "SELECT COUNT(*) FROM Produtos";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int totalProdutos = resultSet.getInt(1);
            return (int) Math.ceil((double) totalProdutos / produtosPorPagina);

        } catch (SQLException e) {
            System.out.println("Erro ao calcular pageCount: " + e.getMessage());
            return 0; // Ou outro valor padrão, se ocorrer um erro
        }
    }
}
