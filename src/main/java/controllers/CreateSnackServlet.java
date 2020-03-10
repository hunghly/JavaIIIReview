package controllers;

import dao.DaoFactory;
import models.Snack;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/snack/create")
public class CreateSnackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/snack/createSnack.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        try {
            if (DaoFactory.getSnacksSQLDao().insertSnack(new Snack(name, price)) != 0) {
                request.getSession().setAttribute("snackCreated", true);
            };
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/snack/create");
    }
}
