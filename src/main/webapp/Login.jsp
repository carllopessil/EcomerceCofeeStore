<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/Login.css">
<%--    <link rel="stylesheet" type="text/css" href="css/Bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <title>Login</title>
</head>

<body>
<div id="container">
    <div id="logo">
        <h1><i> BREWMASTERS CAFÉ.</i></h1>
    </div>
    <section class="stark-login">
        <form action="Login" method="post">
            <div id="fade-box">
                <input type="text" name="email" id="email" placeholder="Username" required>
                <div class="password-container">
                    <input type="password" id="senha" name="senha" placeholder="Password" required>
                    <label for="showPassword" id="showPasswordLabel">
                        <input type="checkbox" id="showPassword">
                        <span class="show-password-icon"><i class="far fa-eye"></i></span>
                    </label>
                </div>
                <button type="submit">Login</button>
            </div>
        </form>
        <div id="circle1">
            <div id="inner-cirlce1">
                <h1> </h1>
            </div>
        </div>
        <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </section>




<footer>
    <p1>&copy; 2023 BREWMASTERS CAFÉ. Todos os direitos reservados.</p1>
</footer>

<% if (request.getParameter("error") != null) { %>
<p style="color: red;">Credenciais inválidas. Tente novamente.</p>
<% } %>

</div>
<script>
    const pwd = document.getElementById("senha");
    const showPasswordCheckbox = document.getElementById("showPassword");
    showPasswordCheckbox.addEventListener("change", function () {
        pwd.type = showPasswordCheckbox.checked ? "text" : "password";
    });
</script>
</body>
</html>
