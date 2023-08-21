<%@ page import="br.com.gymcontrol.Model.UsuarioBackOffice" %>
<!DOCTYPE html>
<html>
<head>
    <title>Backoffice - Principal</title>
<link rel="stylesheet" href="css/EstiloPrincipal.css">
</head>
<bod BACKGROUND="download(3).jpeg">
    <h1>Bem-vindo ao Backoffice</h1>

    <a href="ListaProdutos.jsp">Lista de Produtos</a><br>
    <% if (((UsuarioBackOffice)session.getAttribute("usuario")).getGrupo().equals("Admin Group")) { %>
<li><form action="/ListarUsuarioBackOffice" method="get"><button class="btn-primary"
 type="submit">Buscar usuarios dos sistemas</button></form></li>    </ul>
     <% } %>

    <br><br>
    <a href="Logout">Sair</a>
</body>
</html>
