package DAO;

import br.com.gymcontrol.Model.Endereco;

import java.sql.*;
import java.util.List;

public class EnderecoDAO {

    public int pegaIdEndereçoPadrão(int idCliente) {
        int idPadrão = -1;
        String SQL = "SELECT id FROM Endereco WHERE idCliente = ?;";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setInt(1, idCliente);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                idPadrão = resultSet.getInt("id");
            } else {
                System.out.println("Nenhum resultado encontrado para o cliente com ID: " + idCliente);
            }

            return idPadrão;
        } catch (Exception e) {
            System.out.println("Erro ao pegar o endereço principal : " + e.getMessage());
        }

        return idPadrão;
    }


    public void inserirEnderecoInicial(String cepFaturamento, String logradouroFaturamento, int numeroFaturamento, String complementoFaturamento, String bairroFaturamento, String cidadeFaturamento, String ufFaturamento, int idCliente) {
        String SQL = "INSERT INTO Endereco (cep, logradouro, numero, complemento, bairro, cidade, uf, enderecoAtivo, idCliente) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        System.out.println("essa é a id do cliente" + idCliente);

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {
            preparedStatement.setString(1, cepFaturamento);
            preparedStatement.setString(2, logradouroFaturamento);
            preparedStatement.setInt(3, numeroFaturamento);
            preparedStatement.setString(4, complementoFaturamento);
            preparedStatement.setString(5, bairroFaturamento);
            preparedStatement.setString(6, cidadeFaturamento);
            preparedStatement.setString(7, ufFaturamento);
            preparedStatement.setBoolean(8, true);
            preparedStatement.setInt(9, idCliente);
            preparedStatement.executeUpdate();  // Usar executeUpdate em vez de executeBatch
            System.out.println("sucesso cadastrando o endereço inicial/principal");
        } catch (Exception e) {
            System.out.println("Erro ao cadastrar o endereço inicial principal: " + e.getMessage());
        }
    }

    public void atualizarIdEnderecoPadrao(int clienteId, int novoIdEnderecoPadrao) {
        String updateQuery = "UPDATE Cliente SET idEnderecoPadrao = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa")){
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, novoIdEnderecoPadrao);
            preparedStatement.setInt(2, clienteId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Lide com exceções apropriadamente
        }
    }
    public boolean inserirEnderecos(List<Endereco> enderecos) {
        String SQL = "INSERT INTO Endereco (cep, logradouro, numero, complemento, bairro, cidade, uf, enderecoAtivo, idCliente) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            for (Endereco endereco : enderecos) {
                preparedStatement.setString(1, endereco.getCep());
                preparedStatement.setString(2, endereco.getLogradouro());
                preparedStatement.setInt(3, endereco.getNumero());
                preparedStatement.setString(4, endereco.getComplemento());
                preparedStatement.setString(5, endereco.getBairro());
                preparedStatement.setString(6, endereco.getCidade());
                preparedStatement.setString(7, endereco.getUf());
                preparedStatement.setBoolean(8, true);
                preparedStatement.setInt(9, endereco.getIdCliente());
                preparedStatement.addBatch();
            }

            preparedStatement.executeBatch();

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao cadastrar os endereços: " + e.getMessage());
            return false;
        }
    }
}