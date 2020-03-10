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
import java.util.List;

@WebServlet("/snack/delete")
public class DeleteSnackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO - ACCESS THE DATABASE TO GET ALL THE SNACKS AND PASS THE LIST TO THE REQUEST
        try {
            List<Snack> snackList = DaoFactory.getSnacksSQLDao().getAllSnacks();
            request.setAttribute("snackList", snackList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/snack/deleteSnack.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String snackName = request.getParameter("snacks");
        try {
            if (DaoFactory.getSnacksSQLDao().deleteSnack(snackName)) {
                request.getSession().setAttribute("snackDeleted", true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/snack/delete");
    }
}