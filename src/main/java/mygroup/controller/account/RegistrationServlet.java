package mygroup.controller.account;

import mygroup.connection.ConnectionUtils;
import mygroup.model.daoimpl.UserDaoImpl;
import mygroup.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/signup")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/account/signup.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String first_name = request.getParameter("fname");
        String last_name = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date = request.getParameter("date");

        try {
            Connection connection = ConnectionUtils.getConnection();
            User user = new User(login, email, password, first_name, last_name, date);
            UserDaoImpl userDAO = new UserDaoImpl(connection);
            userDAO.update(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/home");
    }
}