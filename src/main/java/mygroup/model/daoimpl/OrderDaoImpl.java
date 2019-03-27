package mygroup.model.daoimpl;

import mygroup.model.dao.OrderDAO;
import mygroup.model.entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDAO {
    private Connection conn;

    public OrderDaoImpl(Connection connection) {
        this.conn = connection;
    }

    @Override
    public List<Order> getAll() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "Select id from orders";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Order order = get(rs.getString("id"));
            orders.add(order);
        }
        pstm.close();
        return orders;
    }


    @Override
    public List<Order> getByUserId(String userId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "Select id from orders" //
                + " where user_id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userId);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            Order order = get(rs.getString("id"));
            orders.add(order);
        }
        return orders;
    }

    @Override
    public Order get(String id) throws SQLException {
        String sql = "Select * from orders" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        ProductDaoImpl productDao = new ProductDaoImpl(conn);

        if (rs.next()) {
            Order order = new Order();
            order.setId(rs.getString("id"));
            order.setQuantity(rs.getInt("quantity"));
            String productId = String.valueOf(rs.getInt("product_id"));
            order.setProduct(productDao.get(productId));
            pstm.close();
            return order;
        }
        return null;
    }

    @Override
    public void update(Order order) throws SQLException {
        String sql = "INSERT INTO orders (quantity, product_id, user_id)"//
                + " VALUES (?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, order.getQuantity());
        pstm.setString(2, order.getProduct().getId());
        pstm.setString(3, order.getUserId());
        pstm.execute();
        pstm.close();
    }

    @Override
    public void updateQty(String id, int quantity) throws SQLException {
        String sql = "UPDATE orders SET quantity = ? WHERE id = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, quantity);
        pstm.setString(2, id);
        pstm.execute();
        pstm.close();
    }

    @Override
    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM orders" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        pstm.execute();
        pstm.close();
    }
}
