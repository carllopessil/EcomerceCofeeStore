<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Usuário</title>
</head>
<body>
    <h1>Cadastrar Usuário</h1>
    <form action="CadastroUsuario.jsp" method="post">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="senha">Senha:</label>
        <input type="password" name="senha" required><br>

        <label for="grupo">Grupo:</label>
        <input type="text" name="grupo"><br>

        <label for="status">Status:</label>
        <input type="checkbox" name="status" checked><br>

        <label for="cpf">CPF:</label>
        <input type="text" name="cpf" required><br>

        <input type="submit" value="Cadastrar">
    </form>

    <%-- Processar o formulário --%>
    <%
        if (request.getMethod().equals("POST")) {
            try {
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                String grupo = request.getParameter("grupo");
                boolean status = request.getParameter("status") != null;
                String cpf = request.getParameter("cpf");

                // Conectar ao banco de dados (você deve implementar essa parte)

                // Executar a inserção do usuário
                String insertQuery = "INSERT INTO UsuarioBackOffice (Nome, Email, Senha, Grupo, Status, CPF) " +
                                    "VALUES (?, ?, ?, ?, ?, ?)";
                // Prepare a query e insira os valores

                // Fechar a conexão com o banco de dados

                out.println("<p>Usuário cadastrado com sucesso!</p>");
            } catch (Exception e) {
                out.println("<p>Ocorreu um erro ao cadastrar o usuário.</p>");
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
