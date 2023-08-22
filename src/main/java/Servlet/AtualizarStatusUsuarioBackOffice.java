package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


import java.sql.*;


    @WebServlet("/AtualizarStatusUsuarioBackOffice")
    public class AtualizarStatusUsuarioBackOffice extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int idUsuarioBackOffice = Integer.parseInt(request.getParameter("Id"));
            System.out.println(idUsuarioBackOffice + " esse é o valor do ID");

            // Lógica para acessar o banco de dados e trocar o valor
            try {
                Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
                PreparedStatement statement = connection.prepareStatement("UPDATE UsuarioBackOffice SET status = NOT status WHERE ID = ?");
                statement.setInt(1, idUsuarioBackOffice);

                statement.executeUpdate();

                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            response.sendRedirect("ListarUsuario.jsp"); // Redireciona de volta para a página JSP
        }
    }


