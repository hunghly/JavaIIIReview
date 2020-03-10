package dao;

import models.Snack;

import java.sql.SQLException;
import java.util.List;

public interface Snacks {

    List<Snack> getAllSnacks() throws SQLException;

    int insertSnack(Snack snack) throws SQLException;

    boolean deleteSnack(String name) throws SQLException;

}
