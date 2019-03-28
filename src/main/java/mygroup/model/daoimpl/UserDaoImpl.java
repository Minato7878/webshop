package mygroup.model.daoimpl;


import mygroup.model.dao.UserDAO;
import mygroup.model.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDAO {

    private Connection conn;

    public UserDaoImpl(Connection connection) {
        this.conn = connection;
    }

    @Override
    public List<User> getAll() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "Select id from users";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            User user = get(rs.getString("id"));
            users.add(user);
        }
        pstm.close();
        return users;
    }

    @Override
    public User get(String id) throws SQLException {
        String sql = "Select * from users" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            User user = new User();
            user.setId(String.valueOf(rs.getInt("id")));
            user.setLogin(rs.getString("login"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setDateOfBirth(rs.getDate("date_of_birth").toString());
            user.setRole(rs.getString("role"));
            pstm.close();
            return user;
        }
        return null;
    }

    @Override
    public User getByLogin(String login) throws SQLException {

        String sql = "Select id from users" //
                + " where login = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        
        if (rs.next()) {
            User user = get(rs.getString("id"));
            pstm.close();
            return user;
        }
        return null;
    }

    @Override
    public void update(User user) throws SQLException {
        String sql = "INSERT INTO users (login, email, password, first_name, last_name, date_of_birth, role)"//
                + " VALUES (?,?,?,?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, user.getLogin());
        pstm.setString(2, user.getEmail());
        pstm.setString(3, user.getPassword());
        pstm.setString(4, user.getFirstName());
        pstm.setString(5, user.getLastName());
        pstm.setString(6, user.getDateOfBirth());
        pstm.setString(6, user.getRole());
        pstm.execute();
        pstm.close();
    }

    @Override
    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM users" //
                + " where id = ?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        pstm.execute();
        pstm.close();
    }
}