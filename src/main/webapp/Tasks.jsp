<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<% String nameOfList = request.getParameter("nameOfList");
    String login = request.getParameter("login");
    List<String> listOfTaskNames = (List<String>) request.getAttribute("listOfTasksNames");%>


<nav id="main-nav">
    <ul>
        <h6><%=login%></h6>
        <li><a href="about.jsp">About App</a></li>
        <li><a href="contact.jsp">Contact</a></li>

        <li id="nickLogout">

            <form action="/LogOutServlet" method="post">

            <input type="submit" id="Logout" name="Logout" value="Log out">

        </form></li>

    </ul>
</nav>
<div class="container">

    <div id="nameOfLists">
        <h1>List: <%=nameOfList%>
            <h1/>
            <form id="backToListsForm" action="/HomeServlet" method="post">
                <input type="submit" name="Lists" value="Back to Lists">
            </form>
    </div>
    <div id="ListsContent">
            <form action="/AddTaskServlet" method="post">
                <input type="text" name="newTaskName">
                <input type="submit" name="Add" value="Add task">
                <input type="hidden" name="nameOfList" value="<%=nameOfList%>">
                <input type="hidden" name="login" value="<%=login%>">
            </form>
            <form action="/SaveTasksServlet" method="post">
                <input type="submit" name="Save" value="Save" onclick="saveToFile()">
                <input type="hidden" name="allTasks" id="allTasks">
                <input type="hidden" name="nameOfList" value="<%=nameOfList%>">
                <input type="hidden" name="login" value="<%=login%>">
                <script type="text/javascript">
                    function saveToFile() {
                        let n = <%=listOfTaskNames.size()%>;
                        let allTasks = "";
                        for (let i = 0; i < n; i++) {
                            let task = document.getElementById("textId" + i.toString()).value;
                            allTasks = allTasks + task + ";";
                        }
                        document.getElementById("allTasks").value = allTasks;
                    }
                </script>
            </form>
            <!-- TODO add method to read if task are done or not (states 'done' and 'todo') -->
                <%
        if (listOfTaskNames.size() > 0) {
            for (int i = 0; i < listOfTaskNames.size(); i++) {
    %>
            <form action="/DeleteTaskServlet" method="post">
                <input type="text" name="task" id="textId<%=i%>" value="<%=listOfTaskNames.get(i)%>">
                <input type="submit" name="Delete" value="Delete">
                <input type="hidden" name="rowNumber" value="<%=i%>">
                <input type="hidden" name="nameOfList" value="<%=nameOfList%>">
                <input type="hidden" name="login" value="<%=login%>">
            </form>
                <%
            }
        }
    %>
            </div>


            </div>

            <footer id="footer">
                <p>Copyright &copy; Eryk&Alex</p>
            </footer>
            </body>
            </html>