package mygroup.controller.view;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.dao.OrderDAO;
import mygroup.model.daoimpl.ProductDaoImpl;
import mygroup.model.dto.CartDTO;
import mygroup.model.entity.Order;
import mygroup.model.entity.Product;

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

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CartDTO cartDTO = MyUtils.getShoppingCart(session);

        try (Connection connection = ConnectionUtils.getConnection()) {
            ProductDaoImpl productDao = new ProductDaoImpl(connection);
            String productID = request.getParameter("id");
            List<Order> orderList = cartDTO.getCart();
            boolean orderIsNew = true;
            if (!orderList.isEmpty()) {
                for (Order order : orderList) {
                    if (order.getProduct().getId().equals(productID)) {
                        int newQty = order.getQuantity() + 1;
                        order.setQuantity(newQty);
                        cartDTO.setTotalPrice(cartDTO.getTotalPrice() + order.getProduct().getPrice());
                        orderIsNew = false;
                    }
                }
            }
            if (orderList.isEmpty() || orderIsNew) {
                Order newOrder = new Order(1, productDao.get(productID));
                cartDTO.addOrder(newOrder);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getHeader("Referer"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }
}