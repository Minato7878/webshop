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

@WebServlet("/category")
public class CategoryViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection connection = ConnectionUtils.getConnection()){
            ProductDaoImpl productDaoImpl = new ProductDaoImpl(connection);
            String category = request.getParameter("category");
            request.setAttribute("product_list", productDaoImpl.getByCategory(category));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/views/main/categoryView.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {}
}

