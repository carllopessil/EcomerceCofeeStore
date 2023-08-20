<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<!DOCTYPE html>
<html>
<head>
    <title>Backoffice - Principal</title>
</head>
<body>
    <h1>Bem-vindo ao Backoffice</h1>

    <a href="ListaProdutos.jsp">Lista de Produtos</a><br>
    <% if (((UsuarioBackOffice)session.getAttribute("usuario")).getGrupo().equals("Admin Group")) { %>
        <a href="ListaUsuarios.jsp">Lista de Usuários</a><br>
    <% } %>

    <br><br>
    <a href="Logout">Sair</a>
</body>
</html>
