package mygroup.model.dao;

import mygroup.model.entity.Order;

import java.sql.SQLException;
import java.util.List;

public interface OrderDAO extends DAO<Order> {
    @Override
    List<Order> getAll() throws SQLException;

    @Override
    Order get(String id) throws SQLException;

    @Override
    void update(Order order) throws SQLException;

    @Override
    void delete(String id) throws SQLException;

    List<Order> getByUserId(String userId) throws SQLException;

    void updateQty(String id, int quantity) throws SQLException;
}
