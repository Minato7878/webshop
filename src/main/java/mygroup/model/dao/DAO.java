package mygroup.model.dao;

import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {
    List<T> getAll() throws SQLException;

    T get(String id) throws SQLException;

    void update(T t) throws SQLException;

    void delete(String id) throws SQLException;
}
