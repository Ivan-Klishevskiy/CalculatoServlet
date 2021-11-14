package by.tms.storage.jdbc.repository;

import by.tms.storage.jdbc.jdbc_connection.JdbcConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JdbcOperationRepository {

    private static final String NAME_TABLE = "operations";

    private static final String ID = "id_user";

    private static final String FIRST = "first";

    private static final String SECOND = "second";

    private static final String SIGN = "sign";

    private static final String RESULT = "third";


    private static final String INSERT = "INSERT INTO " + NAME_TABLE + " (" + ID + ", " + FIRST + ", " + SECOND + ", " + SIGN + ", " + RESULT + ") VALUES (?, ?, ?, ?, ?)";

    private static final String SELECT = "SELECT " + FIRST + ", " + SECOND + ", " + SIGN + ", " + RESULT + " FROM " + NAME_TABLE + " WHERE " + ID + "=?";


    public boolean saveOperation(long id, double first, double second, String sign, double result) {
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(INSERT)) {
            preparedStatement.setInt(1, (int) id);
            preparedStatement.setString(2, String.valueOf(first));
            preparedStatement.setString(3, String.valueOf(second));
            preparedStatement.setString(4, sign);
            preparedStatement.setString(5, String.valueOf(result));
            return preparedStatement.executeUpdate() == 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public List<String> findOperationsById(int id) {
        List<String> list = new ArrayList<>();
        try (Connection con = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(SELECT)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            ;
            while (resultSet.next()) {
                String first = resultSet.getString(1);
                String second = resultSet.getString(2);
                String sign = resultSet.getString(3);
                String third = resultSet.getString(4);
                String str = String.format("%s %s %s = %s", first, sign, second, third);
                list.add(str);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }
}
