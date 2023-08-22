package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UsuarioBackOfficeDAO {
    public static List<br.com.gymcontrol.Model.UsuarioBackOffice> listarUsuarios() {
        String SQL = "SELECT * FROM UsuarioBackOffice";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<br.com.gymcontrol.Model.UsuarioBackOffice> usuarioSistema = new ArrayList<>();

            while (resultSet.next()) {

                int userSistemID = resultSet.getInt("id");
                String userSistemNome = resultSet.getString("nome");
                String userSistemEmail = resultSet.getString("email");
                String userSistemSenha = resultSet.getString("senha");
                String userSistemGrupo = resultSet.getString("grupo");
                String userStatus = resultSet.getString("status");
                String userSistemCPF = resultSet.getString("CPF");


                br.com.gymcontrol.Model.UsuarioBackOffice userSistema = new br.com.gymcontrol.Model.UsuarioBackOffice(userSistemID, userSistemNome, userSistemEmail, userSistemSenha, userSistemGrupo, userStatus, userSistemCPF);

                usuarioSistema.add(userSistema);

            }

            System.out.println("success in select * UsuarioBackOffice");

            connection.close();

            return usuarioSistema;

        } catch (Exception e) {

            System.out.println("fail in database connection no select");

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
                String userStatus = resultSet.getString("status");
                String userSistemCPF = resultSet.getString("CPF");

                return new br.com.gymcontrol.Model.UsuarioBackOffice(userSistemID, userSistemNome, userSistemEmail, userSistemSenha, userSistemGrupo, userStatus, userSistemCPF);
            } else {
                return null;
            }

        } catch (Exception e) {
            System.out.println("Erro ao buscar usuário por email: " + e.getMessage());
            return null;
        }
    }

    public void updateUsuarioBackOffice(br.com.gymcontrol.Model.UsuarioBackOffice UsuarioBackOffice) {

        String SQL = "UPDATE UsuarioBackOffice SET nome = ?, grupo = ? WHERE id = ?";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, (UsuarioBackOffice.getNome()));
            preparedStatement.setString(2, UsuarioBackOffice.getGrupo());

            preparedStatement.setInt(3, UsuarioBackOffice.getID());
            preparedStatement.execute();

            System.out.println(UsuarioBackOffice.getNome() + "valor que estou pegando");
            System.out.println(UsuarioBackOffice.getGrupo());
            System.out.println(UsuarioBackOffice.getID());


            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());

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
            System.out.println("Erro ao atualizar status do usuário: " + e.getMessage());
        }
    }
}