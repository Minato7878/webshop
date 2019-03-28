package mygroup.model.dao;

import mygroup.model.entity.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDAO extends DAO<Category> {

    List<Category> getAllByName(String name) throws SQLException;

    List<Category> getAllByProductId(String productId) throws SQLException;

    @Override
    void update(Category category) throws SQLException;

    @Override
    void delete(String name) throws SQLException;

    void deleteFromProduct(String productId) throws SQLException;
}
