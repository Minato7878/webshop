package mygroup.controller.account;

import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.UserDaoImpl;
import mygroup.model.entity.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String rememberMeStr = request.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);

        User user = null;
        boolean hasError = false;
        String errorString = null;

        if (login == null || password == null || login.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Required username and password!" + login + "\t" + password;
        } else {
            Connection conn = MyUtils.getStoredConnection(request);
            try {
                UserDaoImpl userDAO = new UserDaoImpl(conn);
                user = userDAO.getByLogin(login);
                System.out.println(user);
                if (user == null ) {
                    hasError = true;
                    errorString = "User Name or password invalid";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                hasError = true;
                errorString = e.getMessage();
            }
        }
        if (hasError) {
            user = new User();
            user.setLogin(login);
            user.setPassword(password);

            System.out.println("Error");

            request.setAttribute("errorString", errorString);
            request.setAttribute("user", user);


            request.getRequestDispatcher("/WEB-INF/views/main/home.jsp")
                    .forward(request, response);

        } else {
            HttpSession session = request.getSession();
            MyUtils.storeLoggedUser(session, user);

            if (remember) {
                MyUtils.storeUserCookie(response, user);
            } else {
                MyUtils.deleteUserCookie(response);
            }

            response.sendRedirect(request.getHeader("Referer"));
        }
    }

}