<!DOCTYPE html>
<html>
<head>
<%--        <link rel="stylesheet" type="text/css" href="./Styles.css/style.css">--%>
    <link rel="stylesheet" type="text/css" href="css/Login.css">

    <title>Login</title>
</head>
<body>
<div id="logo">
    <h1><i> Ecomerce Cofee Store</i></h1>
</div>

<div id="logo">
    <h1><i> Ecomerce Cofee Store</i></h1>
</div>
<section class="stark-login">

<form action="Login" method="post">
    <div id="fade-box">

<%--    <label for="email">Email:</label>--%><br><br>
    <input type="text" id="email" name="email" required><br>

<%--    <label for="senha">Senha:</label>--%><br><br>

    <input type="password" id="senha" name="senha" required><br><br>

    <button type="submit">Login</button>
    </div>
</form>



<%--    <form action="" method="">--%>
<%--        <div id="fade-box">--%>
<%--            <input type="text" name="username" id="username" placeholder="Username" required>--%>
<%--            <input type="password" placeholder="Password" required>--%>

<%--            <button>Log In</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--    <div class="hexagons">--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <br>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <br>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>

<%--        <br>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <br>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--        <span>&#x2B22;</span>--%>
<%--    </div>--%>
<%--</section>--%>

<div id="circle1">
    <div id="inner-cirlce1">
        <h1> Ecomercer</h1>
    </div>
</div>

<ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>


<% if (request.getParameter("error") != null) { %>
<p style="color: red;">Credenciais inválidas. Tente novamente.</p>
<% } %>
</body>
</html>
