package by.tms.storage.jdbc.jdbc_connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnection {

    public static Connection getConnection(){
        Connection conn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/calculator",
                    "root",
                    "2662600"
            );
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return conn;
    }

}
