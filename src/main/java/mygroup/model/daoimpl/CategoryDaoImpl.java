package mygroup.model.daoimpl;

import mygroup.model.dao.CategoryDAO;
import mygroup.model.entity.Category;
import mygroup.model.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDAO {

    private Connection conn;

    public CategoryDaoImpl(Connection connection) {
        this.conn = connection;
    }

    @Override
    public List<Category> getAllByName(String name) throws SQLException {
        String sql = "Select * from categories" //
                + " where category_name = ?";

        List<Category> categories = new ArrayList<>();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Category category = new Category();
            category.setName(rs.getString("category_name"));
            category.setProductId(String.valueOf(rs.getInt("product_id")));
            categories.add(category);
        }
        pstm.close();
        return categories;
    }

    @Override
    public List<Category> getAllByProductId(String productId) throws SQLException {
        List<Category> categories = new ArrayList<>();
        String sql = "Select distinct * from categories" //
                + " where product_id = ? group by category_name";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, productId);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Category category = get(rs.getString("category_name"));
            categories.add(category);
        }
        pstm.close();
        return categories;
    }

    @Override
    public List<Category> getAll() throws SQLException {
        String sql = "Select DISTINCT * from categories GROUP BY category_name";

        List<Category> categories = new ArrayList<>();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Category category;
            category = get(rs.getString("category_name"));
            categories.add(category);
        }
        pstm.close();
        return categories;
    }

    @Override
    public Category get(String name) throws SQLException {
        String sql = "Select * from categories" //
                + " where category_name = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Category category = new Category();
            category.setName(rs.getString("category_name"));
            category.setProductId(String.valueOf(rs.getInt("product_id")));
            pstm.close();
            return category;
        }
        return null;
    }

    @Override
    public void update(Category category) throws SQLException {
        String sql = "INSERT INTO categories (category_name, product_id)"//
                + " VALUES (?,?);";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, category.getName());
        pstm.setString(2, category.getProductId());
        pstm.execute();
        pstm.close();
    }

    @Override
    public void delete(String name) throws SQLException {
        String sql = "DELETE FROM categories" //
                + " where category_name = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        pstm.execute();
        pstm.close();
    }

    @Override
    public void deleteFromProduct(String productId) throws SQLException {
        String sql = "DELETE FROM categories" //
                + " where product_id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, productId);
        pstm.execute();
        pstm.close();
    }
}
