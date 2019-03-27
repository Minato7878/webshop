package mygroup.controller.account;

import mygroup.connection.ConnectionUtils;
import mygroup.model.daoimpl.ProductDaoImpl;
import mygroup.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/management")
public class ManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection connection = ConnectionUtils.getConnection()) {
            ProductDaoImpl productDaoImpl = new ProductDaoImpl(connection);
            List<Product> productList = productDaoImpl.getAll();
            request.setAttribute("product_list", productList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/views/account/management.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}