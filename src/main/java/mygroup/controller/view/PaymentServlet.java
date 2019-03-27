package mygroup.controller.view;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.OrderDaoImpl;
import mygroup.model.dto.CartDTO;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = MyUtils.getLoggedUser(session);
        CartDTO cartDTO = MyUtils.getShoppingCart(session);

        if (!cartDTO.getCart().isEmpty()) {
            List<Order> cartList = cartDTO.getCart();
            if (loggedUser != null) {
                try (Connection connection = ConnectionUtils.getConnection()) {
                    OrderDaoImpl orderDao = new OrderDaoImpl(connection);
                    List<Order> orderList = orderDao.getByUserId(loggedUser.getId());

                    boolean orderIsNew = true;

                    if (!orderList.isEmpty()) {
                        for (Order cartOrder1 : cartList) {
                            for (Order order : orderList) {
                                try {
                                    if (order.getProduct().getId().equals(cartOrder1.getProduct().getId())) {
                                        System.out.println("old = " + order.getProduct().getName());
                                        orderDao.updateQty(order.getId(), cartOrder1.getQuantity() + order.getQuantity());
                                        orderIsNew = false;
                                        break;
                                    } else {
                                        orderIsNew = true;
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            if (orderIsNew) {
                                System.out.println("new = " + cartOrder1.getProduct().getName());
                                cartOrder1.setUserId(loggedUser.getId());
                                orderDao.update(cartOrder1);
                            }
                        }
                    } else {
                        cartList.forEach(cartOrder -> {
                            try {
                                cartOrder.setUserId(loggedUser.getId());
                                orderDao.update(cartOrder);
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        });
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }

                CartDTO newCart = new CartDTO();
                MyUtils.storeShoppingCart(session, newCart);
            } else {
                System.out.println("Pls login");
            }
        } else {
            System.out.println("Sry no items");
        }

        response.sendRedirect("/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

}
