package mygroup.model.dao;

import mygroup.model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO extends DAO<User>{

    @Override
    List<User> getAll() throws SQLException;

    @Override
    User get(String id) throws SQLException;

    @Override
    void update(User user) throws SQLException;

    @Override
    void delete(String id) throws SQLException;

    User getByLogin(String login) throws SQLException;

}
