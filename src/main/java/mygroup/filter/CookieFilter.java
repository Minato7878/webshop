package mygroup.filter;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.UserDaoImpl;
import mygroup.model.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebFilter(filterName = "cookieFilter", urlPatterns = {"/*"})
public class CookieFilter implements Filter {

    public CookieFilter() {
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        User userInSession = MyUtils.getLoggedUser(session);

        if (userInSession != null) {
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
            chain.doFilter(request, response);
            return;
        }

        Connection conn = MyUtils.getStoredConnection(request);
        String checked = (String) session.getAttribute("COOKIE_CHECKED");

        if (checked == null && conn != null) {
            String login = MyUtils.getUserNameInCookie(req);
            try {
                Connection connection = ConnectionUtils.getConnection();
                UserDaoImpl userDAO = new UserDaoImpl(connection);
                User user = userDAO.getByLogin(login);
                MyUtils.storeLoggedUser(session, user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
        }

        chain.doFilter(request, response);
    }

}