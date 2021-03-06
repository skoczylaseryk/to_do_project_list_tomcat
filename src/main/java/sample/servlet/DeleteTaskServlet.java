package sample.servlet;

import sample.list.ListManager;
import sample.list.ListOfTasks;
import sample.list.impl.ListManagerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    private ListManager lm = ListManagerImpl.getInstance();
    private ListOfTasks listOfTasks;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String nameOfList = request.getParameter("nameOfList");
        int rowNumber = Integer.parseInt(request.getParameter("rowNumber"));


        listOfTasks = lm.findList(nameOfList, login);

        String taskName = lm.findTaskByRowNumber(listOfTasks, rowNumber);
        lm.removeTaskFromListByName(listOfTasks, taskName);

        List<String> listOfTasksNames = lm.getTasks(listOfTasks);

        request.setAttribute("listOfTasksNames", listOfTasksNames);
        request.setAttribute("nameOfList", nameOfList);
        request.getRequestDispatcher("Tasks.jsp").forward(request, response);
    }
}
