package book_store.servlets;

import book_store.db.DBConnection;
import book_store.db.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/news-details")
public class NewsDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        News news = DBConnection.getNewsById(id);
        request.setAttribute("news",news);
        request.getRequestDispatcher("/news-details.jsp").forward(request,response);
    }
}
