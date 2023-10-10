package DAO;

import br.com.gymcontrol.Model.Cliente;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class ClienteDAO {
    public static boolean isEmailCadastrado(String email) {
        String SQL = "SELECT COUNT(*) FROM CLIENTE WHERE email = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            return count > 0;

        } catch (Exception e) {
            System.out.println("Erro ao verificar e-mail cadastrado: " + e.getMessage());
            return false;
        }
    }

    public boolean CadastrarCliente(Cliente CadastrarCliente) {
        String SQL = "INSERT INTO Cliente (nomeCompleto, email, cpf, senha, cepFaturamento, logradouroFaturamento, numeroFaturamento, complementoFaturamento, bairroFaturamento, cidadeFaturamento, ufFaturamento) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

            String hashedSenha = BCrypt.hashpw(CadastrarCliente.getSenha(), BCrypt.gensalt());
            preparedStatement.setString(1, CadastrarCliente.getNomeCompleto());
            preparedStatement.setString(2, CadastrarCliente.getEmail());
            preparedStatement.setString(3, CadastrarCliente.getCpf());
            preparedStatement.setString(4, hashedSenha);
            preparedStatement.setString(5, CadastrarCliente.getCepFaturamento());
            preparedStatement.setString(6, CadastrarCliente.getLogradouroFaturamento());
            preparedStatement.setInt(7, CadastrarCliente.getNumeroFaturamento());
            preparedStatement.setString(8, CadastrarCliente.getComplementoFaturamento());
            preparedStatement.setString(9, CadastrarCliente.getBairroFaturamento());
            preparedStatement.setString(10, CadastrarCliente.getCidadeFaturamento());
            preparedStatement.setString(11, CadastrarCliente.getUfFaturamento());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Falha ao cadastrar o cliente, nenhum registro foi alterado.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idCliente = generatedKeys.getInt(1);
                    CadastrarCliente.setId(idCliente);
                } else {
                    throw new SQLException("Falha ao obter o ID do cliente, nenhum ID foi gerado.");
                }
            }

            return true; // Indica que o cadastro foi bem-sucedido

        } catch (Exception e) {
            System.out.println("Erro ao cadastrar o usuário: " + e.getMessage());
            return false;
        }
    }
    public static boolean validarCPF(String cpf) {
// Remova caracteres não numéricos do CPF
        cpf = cpf.replaceAll("[^0-9]", "");

        // Verifique se o CPF tem 11 dígitos
        if (cpf.length() != 11) {
            return false;
        }

        // Verifique se todos os dígitos são iguais (CPF inválido)
        boolean todosDigitosIguais = true;
        for (int i = 1; i < 11; i++) {
            if (cpf.charAt(i) != cpf.charAt(0)) {
                todosDigitosIguais = false;
                break;
            }
        }
        if (todosDigitosIguais) {
            return false;
        }

        // Cálculo dos dígitos verificadores
        int soma = 0;
        for (int i = 0; i < 9; i++) {
            soma += (10 - i) * (cpf.charAt(i) - '0');
        }
        int primeiroDigitoVerificador = 11 - (soma % 11);
        if (primeiroDigitoVerificador >= 10) {
            primeiroDigitoVerificador = 0;
        }

        soma = 0;
        for (int i = 0; i < 10; i++) {
            soma += (11 - i) * (cpf.charAt(i) - '0');
        }
        int segundoDigitoVerificador = 11 - (soma % 11);
        if (segundoDigitoVerificador >= 10) {
            segundoDigitoVerificador = 0;
        }

        // Verifique se os dígitos verificadores calculados correspondem aos dígitos do CPF
        return primeiroDigitoVerificador == (cpf.charAt(9) - '0')
                && segundoDigitoVerificador == (cpf.charAt(10) - '0');
    }

    public static boolean cpfExistente(String cpf) {
        String SQL = "SELECT COUNT(*) FROM Cliente WHERE CPF = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, cpf);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            return count > 0;

        } catch (Exception e) {
            System.out.println("Erro ao verificar e-o cpf cadastrado: " + e.getMessage());
            return false;
        }
    }


}
