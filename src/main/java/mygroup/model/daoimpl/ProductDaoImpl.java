package mygroup.model.daoimpl;

import mygroup.model.dao.ProductDAO;
import mygroup.model.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDAO {
    private Connection conn;

    public ProductDaoImpl(Connection connection) {
        this.conn = connection;
    }

    @Override
    public List<Product> getAll() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "Select id from products";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Product product = get(rs.getString("id"));
            products.add(product);
        }
        pstm.close();
        return products;
    }

    @Override
    public Product get(String id) throws SQLException {

        String sql = "Select * from products" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Product product = new Product();
            product.setId(rs.getString("id"));
            product.setName(rs.getString("product_name"));
            product.setDescription(rs.getString("product_desc"));
            product.setPrice(rs.getDouble("product_price"));
            product.setImgUrl(rs.getString("img"));
            pstm.close();
            return product;
        }
        return null;
    }

    @Override
    public Product getByName(String name) throws SQLException {

        String sql = "Select * from products" //
                + " where product_name = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, name);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Product product = get(rs.getString("id"));
            pstm.close();
            return product;
        }
        return null;
    }

    @Override
    public List<Product> getByCategory(String categoryName) throws SQLException {
        String sql = "Select product_id from categories" //
                + " where category_name = ?";

        List<Product> productList = new ArrayList<>();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, categoryName);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Product product = get(rs.getString("product_id"));
            productList.add(product);
        }
        pstm.close();
        return productList;
    }

    @Override
    public void update(Product product) throws SQLException {
        String sql = "INSERT INTO products (product_name, product_desc, product_price,img)"//
                + " VALUES (?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, product.getName());
        pstm.setString(2, product.getDescription());
        pstm.setDouble(3, product.getPrice());
        pstm.setString(4, product.getImgUrl());
        pstm.execute();
        pstm.close();
    }

    @Override
    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM products" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        pstm.execute();
        pstm.close();
    }
}
