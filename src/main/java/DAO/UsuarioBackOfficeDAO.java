package DAO;

import br.com.gymcontrol.Model.UsuarioBackOffice;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static java.lang.System.out;

public class UsuarioBackOfficeDAO {
    public static List<br.com.gymcontrol.Model.UsuarioBackOffice> listarUsuarios() {
        String SQL = "SELECT * FROM UsuarioBackOffice";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<br.com.gymcontrol.Model.UsuarioBackOffice> usuarioSistema = new ArrayList<>();

            while (resultSet.next()) {

                int userSistemID = resultSet.getInt("id");
                String userSistemNome = resultSet.getString("nome");
                String userSistemEmail = resultSet.getString("email");
                String userSistemSenha = resultSet.getString("senha");
                String userSistemGrupo = resultSet.getString("grupo");
                boolean userStatus = resultSet.getBoolean("status");
                String userSistemCPF = resultSet.getString("CPF");


                br.com.gymcontrol.Model.UsuarioBackOffice userSistema = new br.com.gymcontrol.Model.UsuarioBackOffice(userSistemID, userSistemNome, userSistemEmail, userSistemSenha, userSistemGrupo, userStatus, userSistemCPF);

                usuarioSistema.add(userSistema);

            }

            out.println("success in select * UsuarioBackOffice");

            connection.close();

            return usuarioSistema;

        } catch (Exception e) {

            out.println("fail in database connection no select");

            return Collections.emptyList();

        }


    }

    public static br.com.gymcontrol.Model.UsuarioBackOffice buscarUsuarioPorEmail(String email) {
        String SQL = "SELECT * FROM UsuarioBackOffice WHERE email = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int userSistemID = resultSet.getInt("id");
                String userSistemNome = resultSet.getString("nome");
                String userSistemEmail = resultSet.getString("email");
                String userSistemSenha = resultSet.getString("senha");
                String userSistemGrupo = resultSet.getString("grupo");
                boolean userStatus = resultSet.getBoolean("status");
                String userSistemCPF = resultSet.getString("CPF");

                return new br.com.gymcontrol.Model.UsuarioBackOffice(userSistemID, userSistemNome, userSistemEmail, userSistemSenha, userSistemGrupo, userStatus, userSistemCPF);
            } else {
                return null;
            }

        } catch (Exception e) {
            out.println("Erro ao buscar usuário por email: " + e.getMessage());
            return null;
        }
    }

    public void updateUsuarioBackOffice(br.com.gymcontrol.Model.UsuarioBackOffice UsuarioBackOffice) {

        String SQL = "UPDATE UsuarioBackOffice SET nome = ?, grupo = ? WHERE id = ?";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, (UsuarioBackOffice.getNome()));
            preparedStatement.setString(2, UsuarioBackOffice.getGrupo());

            preparedStatement.setInt(3, UsuarioBackOffice.getID());
            preparedStatement.execute();

            out.println(UsuarioBackOffice.getNome() + "valor que estou pegando");
            out.println(UsuarioBackOffice.getGrupo());
            out.println(UsuarioBackOffice.getID());


            connection.close();

        } catch (Exception e) {

            out.println("fail in database connection");
            out.println("Error: " + e.getMessage());

        }

    }


    public static void updateUsuarioStatus(int userID, boolean novoStatus) {
        String SQL = "UPDATE UsuarioBackOffice SET status = ? WHERE id = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setBoolean(1, novoStatus);
            preparedStatement.setInt(2, userID);
            preparedStatement.executeUpdate();

            connection.close();
        } catch (Exception e) {
            out.println("Erro ao atualizar status do usuário: " + e.getMessage());


        }
    }


    public static boolean isEmailCadastrado(String email) {
        String SQL = "SELECT COUNT(*) FROM UsuarioBackOffice WHERE email = ?";

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



    public boolean CadastrarUsuarioBackOffice(UsuarioBackOffice CadastrarUsuario) {
        String SQL = "INSERT INTO USUARIOBACKOFFICE (Nome, Email, Senha, Grupo, Status, CPF) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            String email = CadastrarUsuario.getEmail();

            if (isEmailCadastrado(email)) {
                return false; // Indica que o e-mail já está cadastrado
            }

            boolean status = true;

            try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
                 PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

                preparedStatement.setString(1, CadastrarUsuario.getNome());
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, CadastrarUsuario.getSenha());
                preparedStatement.setString(4, CadastrarUsuario.getGrupo());
                preparedStatement.setBoolean(5, status);
                preparedStatement.setString(6, CadastrarUsuario.getCPF());

                preparedStatement.execute();

                return true; // Indica que o cadastro foi bem-sucedido

            } catch (Exception e) {
                System.out.println("Erro ao cadastrar o usuário: " + e.getMessage());
                return false;
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar e-mail cadastrado: " + e.getMessage());
            return false;
        }
    }
}