package dao;

import java.sql.SQLException;

public class DaoFactory {
    private static Snacks snacksSQLDao;
    private static Config config = new Config();

    public static Snacks getSnacksSQLDao() throws SQLException {
        if (snacksSQLDao == null) {
            snacksSQLDao = new SnackSQLDao(config);
        }
        return snacksSQLDao;
    }

}
