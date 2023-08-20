<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <form action="Login" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>

        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required><br><br>

        <button type="submit">Login</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Credenciais inválidas. Tente novamente.</p>
    <% } %>
</body>
</html>
