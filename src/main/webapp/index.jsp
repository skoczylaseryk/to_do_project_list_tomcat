<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>To do list project</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav id="main-nav">
    <ul>
        <li><a href="about.jsp">About App</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</nav>
<div class="container">
    <h2>Input login and password</h2>
    <%if (request.getAttribute("wrongCredentials") == "true") { %>
    <h5 id="incLogOrPass">Incorrect login or password</h5>
    <%
    } else if (request.getAttribute("logout") == null) {
    } else {
    %>
    <h5 id="incLogOrPass">You have been logged out</h5>
    <%}%>
    <% if (request.getAttribute("isLogin") == "noLogin") {%>
    <h5 id="incLogOrPass">Please, log in</h5>
    <%}%>

    <form action="/HomeServlet" method="post">
        <input type="text" id="login" name="login" placeholder="Login"><br>
        <input type="password" id="password" name="password" placeholder="Password"><br>
        <input type="submit" name="login" value="log in">
    </form>
    <h2>Sign up</h2>
    <form action="signup.jsp">
        <input type="submit" name="signUp" value="sign up"><br>
    </form>
    </div>
    <footer id="footer">
        <p>Copyright &copy; Eryk&Alex</p>

    </footer>
    </body>
    </html>