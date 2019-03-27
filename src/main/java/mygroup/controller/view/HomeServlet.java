package mygroup.controller.view;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.ProductDaoImpl;
import mygroup.model.dto.CartDTO;
import mygroup.model.entity.Product;
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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CartDTO cartDTO = MyUtils.getShoppingCart(session);
        if (cartDTO == null) {
            cartDTO = new CartDTO();
            MyUtils.storeShoppingCart(session,cartDTO);
        }

        try (Connection connection = ConnectionUtils.getConnection()) {
            ProductDaoImpl productDaoImpl = new ProductDaoImpl(connection);
            List<Product> bigCarousel = productDaoImpl.getByCategory("big_carousel");
            List<Product> smallCarousel1 = productDaoImpl.getByCategory("small_carousel_1");
            List<Product> smallCarousel2 = productDaoImpl.getByCategory("small_carousel_2");
            List<Product> xxx = productDaoImpl.getByCategory("xxx");
            request.setAttribute("big_carousel", bigCarousel);
            request.setAttribute("small_carousel_1", smallCarousel1);
            request.setAttribute("small_carousel_2", smallCarousel2);
            request.setAttribute("xxx", xxx);
        } catch (SQLException e) {
            e.printStackTrace();
        }

       request.getRequestDispatcher("/WEB-INF/views/main/home.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = MyUtils.getLoggedUser(session);


        if (loggedUser != null) {
            request.setAttribute("loggedUser", loggedUser);
            request.getRequestDispatcher("/WEB-INF/views/main/home.jsp")
                    .forward(request, response);
            return;
        }
        doGet(request, response);
    }

}