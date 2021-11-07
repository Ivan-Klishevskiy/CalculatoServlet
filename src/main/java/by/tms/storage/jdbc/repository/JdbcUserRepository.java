package by.tms.storage.jdbc.repository;

import by.tms.entity.User;
import by.tms.storage.jdbc.jdbc_connection.JdbcConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class JdbcUserRepository {
    private long tempId;

    private static final String NAME = "name";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";
    private static final String NAME_TABLE = "users";
    private static final String ROLE = "role";
    private static final String ID = "id";

    private static final String INSERT = "INSERT INTO " + NAME_TABLE + " (" + NAME + ", " + USERNAME + ", " + PASSWORD + ", " + "ROLE" + ") VALUES (?, ?, ?,?)";

    private static final String DELETE = "DELETE FROM " + NAME_TABLE + " WHERE " + USERNAME + "=? AND " + PASSWORD + "=?";

    private static final String SELECT_BY_USER = "SELECT * FROM " + NAME_TABLE + " WHERE " + USERNAME + "=?";

    private static final String UPDATE = "UPDATE " + NAME_TABLE + " SET " + NAME + "=?, " + PASSWORD + "=? WHERE " + USERNAME + "=?";

    private static final String FIND_ALL = "SELECT * FROM " + NAME_TABLE;

    private static final String UPDATE_BY_ID = "UPDATE " + NAME_TABLE + " SET " + ROLE + "=?  WHERE " + ID + "=?";;

    private static final String DELETE_BY_ADMIN = "DELETE FROM " + NAME_TABLE + " WHERE " + USERNAME + "=?";


    public List<User> findAllUsers() {
        List<User> list = new CopyOnWriteArrayList<>();

        try (Connection con = JdbcConnection.getConnection();
             Statement statement = con.createStatement()) {
            ResultSet resultSet = statement.executeQuery(FIND_ALL);

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString(2));
                user.setUsername(resultSet.getString(3));
                user.setPassword(resultSet.getString(4));
                user.setRole(resultSet.getString(5));
                list.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public boolean saveUser(User user) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getRole());
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
                user.setRole(resultSet.getString(5));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (user != null) {
            this.tempId = user.getId();
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


    public boolean deleteUserByAdmin(String username) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(DELETE_BY_ADMIN)) {
            preparedStatement.setString(1, username);
            return preparedStatement.executeUpdate() != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(String username, String newName, String newPassword) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(UPDATE)) {
            preparedStatement.setString(1, newName);
            preparedStatement.setString(2, newPassword);
            preparedStatement.setString(3, username);
            return preparedStatement.executeUpdate() != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public boolean setAdminUser (int id) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(UPDATE_BY_ID)) {
            preparedStatement.setString(1, "admin");
            preparedStatement.setInt(2, id);
            return preparedStatement.executeUpdate() != 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public long getTempId() {
        return tempId;
    }
}

