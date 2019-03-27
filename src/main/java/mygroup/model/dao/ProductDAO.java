package mygroup.model.dao;

import mygroup.model.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDAO extends DAO<Product> {
    @Override
    List<Product> getAll() throws SQLException;

    @Override
    Product get(String id) throws SQLException;

    @Override
    void update(Product product) throws SQLException;

    @Override
    void delete(String id) throws SQLException;

    Product getByName(String name) throws SQLException;

    List<Product> getByCategory(String categoryName) throws SQLException;
}
