package dao;

import com.mysql.cj.jdbc.Driver;
import models.Snack;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SnackSQLDao implements Snacks {
    Connection connection;

    public SnackSQLDao (Config config) throws SQLException {
        DriverManager.registerDriver(new Driver());
        this.connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
        );
    }

    @Override
    public List<Snack> getAllSnacks() throws SQLException {
        List<Snack> snackList = new ArrayList<>();
        String sqlQuery = "SELECT * FROM snacks";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(sqlQuery);
        int id;
        String name;
        double price;
        while (rs.next()) {
            id = rs.getInt("id");
            name = rs.getString("name");
            price = rs.getDouble("price");
            snackList.add(new Snack(id, name, price));
        }
        return snackList;
    }

    @Override
    public int insertSnack(Snack snack) throws SQLException {
        // TODO - INSERT SNACK TO SQL DATABASE
        String sqlQuery = "INSERT INTO snacks (name, price) VALUES (?, ?)";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, snack.getName());
        stmt.setDouble(2, snack.getPrice());
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (!rs.next()) {
           return 0;
        }
        return rs.getInt(1);
    }

    @Override
    public boolean deleteSnack(String name) throws SQLException {
        String sqlQuery = "DELETE FROM snacks WHERE name = ?";
        PreparedStatement stmt = connection.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, name);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (!rs.next()) {
            return false;
        }
        return true;
    }
}
