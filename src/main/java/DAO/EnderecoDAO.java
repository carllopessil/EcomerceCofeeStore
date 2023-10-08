package DAO;

import br.com.gymcontrol.Model.Endereco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

public class EnderecoDAO {
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