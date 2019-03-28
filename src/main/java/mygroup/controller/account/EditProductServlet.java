package mygroup.controller.account;

import mygroup.connection.ConnectionUtils;
import mygroup.connection.MyUtils;
import mygroup.model.daoimpl.CategoryDaoImpl;
import mygroup.model.daoimpl.ProductDaoImpl;
import mygroup.model.entity.Category;
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
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/edit_product"})
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User loggedUser = MyUtils.getLoggedUser(session);

        if (loggedUser == null || !loggedUser.getRole().equals("admin")) {
            response.sendRedirect("/home");
        } else {
            try (Connection conn = ConnectionUtils.getConnection()) {
                CategoryDaoImpl categoryDao = new CategoryDaoImpl(conn);
                ProductDaoImpl productDao = new ProductDaoImpl(conn);
                String productId = request.getParameter("productId");

                List<Category> categories = categoryDao.getAllByProductId(productId);
                List<String> categoryNameList = categories
                        .stream()
                        .map(Category::getName)
                        .collect(Collectors.toList());
                request.setAttribute("category_list", categoryNameList);
                request.setAttribute("product", productDao.get(productId));
                request.getRequestDispatcher("/WEB-INF/views/account/edit_product.jsp")
                        .forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String img = request.getParameter("product_image");
        String name = request.getParameter("product_name");
        double price = Double.parseDouble(request.getParameter("product_price"));
        String quantity = request.getParameter("product_quantity");
        List<String> categories = Arrays.asList(request.getParameterValues("product_categories"));
        String newCategory = request.getParameter("product_newCategory");
        String description = request.getParameter("product_about");
        String productId = request.getParameter("productId");
        Product product = new Product(name, description, quantity, price, img);


        try (Connection conn = ConnectionUtils.getConnection()) {
            CategoryDaoImpl categoryDao = new CategoryDaoImpl(conn);
            ProductDaoImpl productDao = new ProductDaoImpl(conn);
            productDao.delete(productId);
            productDao.update(product);

            for (Category category : categoryDao.getAll()) {
                if (category.getProductId().equals("productId")) {
                    categoryDao.delete(category.getName());
                }
            }

            if (newCategory != null) {
                Category category1 = new Category(newCategory, productId);
                categoryDao.update(category1);
            }

            for (String obj : categories) {
                Category category2 = new Category(obj, productId);
                categoryDao.update(category2);
            }

            response.sendRedirect("/management");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}