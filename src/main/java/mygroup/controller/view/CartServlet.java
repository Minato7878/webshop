package mygroup.controller.view;

import mygroup.connection.MyUtils;
import mygroup.model.dto.CartDTO;
import mygroup.model.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CartDTO cartDTO = MyUtils.getShoppingCart(session);

        String removeId = request.getParameter("remove");

        if (removeId != null) {
            for (Order order : cartDTO.getCart()) {
                if (order.getProduct().getId().equals(removeId)) {
                    cartDTO.setTotalPrice(cartDTO.getTotalPrice() - order.getProduct().getPrice()*order.getQuantity());
                    cartDTO.setItemsCount(cartDTO.getItemsCount()-1);
                    cartDTO.getCart().remove(order);
                    if (cartDTO.getCart().isEmpty()) break;
                }
            }
        }

        List<Order> orderList = cartDTO.getCart();
        List<String> productIdList = orderList
                .stream()
                .map(obj -> obj.getProduct().getId())
                .collect(Collectors.toList());
        request.setAttribute("product_id_list", productIdList);
        request.getRequestDispatcher("/WEB-INF/views/main/shoppingCart.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartDTO cartDTO = MyUtils.getShoppingCart(session);

        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");

        double totalPrice = 0;

        for (Order order : cartDTO.getCart()) {
            if (order.getProduct().getId().equals(productId)) {
                order.setQuantity(Integer.parseInt(quantity));
            }
            totalPrice += order.getProduct().getPrice()*order.getQuantity();
        }
        cartDTO.setTotalPrice(totalPrice);
    }
}

