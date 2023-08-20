package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        String SQL = "SELECT * FROM UsuarioBackOffice WHERE Email = ?";

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

}
