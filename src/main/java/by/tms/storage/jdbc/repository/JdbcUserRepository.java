package by.tms.storage.jdbc.repository;

import by.tms.entity.User;
import by.tms.storage.jdbc.jdbc_connection.JdbcConnection;

import java.sql.*;

public class JdbcUserRepository {
    private long tempId;

    private static final String NAME = "name";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String NAME_TABLE = "users";

    private static final String INSERT = "INSERT INTO "+NAME_TABLE+" ("+NAME+", "+USERNAME+", "+PASSWORD+") VALUES (?, ?, ?)";

    private static final String DELETE = "DELETE FROM "+NAME_TABLE+" WHERE "+USERNAME+"=? AND "+PASSWORD+"=?";

    private static final String SELECT_BY_USER = "SELECT * FROM "+NAME_TABLE+" WHERE "+USERNAME+"=?";

    private static final String UPDATE = "UPDATE "+NAME_TABLE+" SET "+NAME+"=?, "+PASSWORD+"=? WHERE "+USERNAME+"=?";


    public boolean saveUser(User user) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            int result = preparedStatement.executeUpdate();
            try (ResultSet resultSet = preparedStatement.getGeneratedKeys()) {
                while (resultSet.next()) {
                    user.setId(resultSet.getInt(1));
                }
            }
            return result != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public User findByUsername(String username) {
        User user = null;
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(SELECT_BY_USER)) {
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            user = new User();
            while (resultSet.next()) {
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setUsername(resultSet.getString(3));
                user.setPassword(resultSet.getString(4));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if(user!=null){
            this.tempId= user.getId();
        }
        return user;
    }

    public boolean deleteUser(String username, String password) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(DELETE)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            return preparedStatement.executeUpdate() != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(String username, String newName, String newPassword){
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(UPDATE)) {
            preparedStatement.setString(1, newName);
            preparedStatement.setString(2, newPassword);
            preparedStatement.setString(3, username);
            return preparedStatement.executeUpdate()!=0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public long getTempId() {
        return tempId;
    }
}

