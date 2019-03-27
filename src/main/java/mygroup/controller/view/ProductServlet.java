package mygroup.controller.view;

import mygroup.connection.ConnectionUtils;
import mygroup.model.daoimpl.ProductDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            try (Connection connection = ConnectionUtils.getConnection()) {
                String productID = request.getParameter("id");
                ProductDaoImpl productDao = new ProductDaoImpl(connection);
                request.setAttribute("product", productDao.get(productID));
                request.getRequestDispatcher("/WEB-INF/views/main/product.jsp")
                        .forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}