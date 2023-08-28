<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8"%>
<head>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            overflow: hidden;
        }

        h2 {
            text-align: center;
            color: #fff;
            padding: 20px;
        }

        a {
            display: block;
            width: 200px;
            margin: 0 auto;
            text-align: center;
            padding: 10px;
            background-color: #ff0032;
            color: #270606;
            text-decoration: none;
            border-radius: 41px;
            margin-bottom: -54px;
            z-index: 1;
            font-size: 1.8em;
            font-family: monospace;
            font-weight: 700;
        }
        }

        a:hover {
            background-color: #0056b3;
        }
        #counter {
            font-size: 36px;
            margin-top: 50px;
        }

        #buttons {
            margin-top: 20px;
        }

        button {
            font-size: 16px;
            padding: 10px 20px;
            margin: 0 10px;
            cursor: pointer;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
        }

        #video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgb(0 0 0 / 73%); /* Cor preta com opacidade de 0.5 */
        }

        h1 {
            font-size: 36px;
            color: #fff;
            z-index: 1;
            display: block;
            font-size: 7em;
            margin-block-start: 0.67em;
            margin-block-end: 5.67em;
            margin-inline-start: 98px;
            margin-inline-end: 27px;
            font-weight: 600;
            font-family: cursive;
        }


        #countdown {
            font-size: 24px;
            color: #007bff;
    </style>
</head>
<body>

<h1>Site em Construção</h1>
<div id="countdown"></div>

<br><hr>
<a href="Login.jsp">Acesso Develop Contrutor</a>
<%--<a href="ListaDeUsuario.jsp">Link para a página principal</a>--%>


<video autoplay muted loop id="video-background">
    <source src="img/videoIndex/fundoIdex.mp4" type="video/mp4">
    Seu navegador não suporta vídeos em HTML5.
</video>
<div id="overlay"></div>
<h1>Site em Construção</h1>

<script>
    const counterElement = document.getElementById("counter");
    const incrementButton = document.getElementById("increment");
    const decrementButton = document.getElementById("decrement");

    let count = 0;

    function updateCounter() {
        counterElement.textContent = count;
    }

    incrementButton.addEventListener("click", function() {
        count++;
        updateCounter();
    });

    decrementButton.addEventListener("click", function() {
        if (count > 0) {
            count--;
            updateCounter();
        }
    });

    updateCounter();
    function updateCountdown() {
        const currentDate = new Date();
        const targetDate = new Date("2023-08-28");
        const difference = targetDate - currentDate;

        if (difference <= 0) {
            document.getElementById("countdown").textContent = "Site lançado!";
            return;
        }

        const days = Math.floor(difference / (1000 * 60 * 60 * 24));

        document.getElementById("countdown").textContent = `Tempo restante: ${days} dias`;
    }

    setInterval(updateCountdown, 1000);
    updateCountdown();
</script>
</body>
</html>



