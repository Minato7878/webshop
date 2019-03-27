package mygroup.controller.account;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.OrderDaoImpl;
import mygroup.model.entity.Order;
import mygroup.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/orders_history")
public class OrdersHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = MyUtils.getLoggedUser(session);

        try (Connection connection = ConnectionUtils.getConnection()) {
            OrderDaoImpl orderDao = new OrderDaoImpl(connection);
            List<Order> orderList = orderDao.getByUserId(loggedUser.getId());
            double totalPrice = orderList
                    .stream()
                    .mapToDouble(order -> order.getProduct().getPrice() * order.getQuantity())
                    .sum();
            request.setAttribute("order_list", orderList);
            request.setAttribute("totalPrice", totalPrice);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/views/account/orders_history.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}