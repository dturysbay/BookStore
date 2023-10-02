package book_store.servlets;

import book_store.db.DBConnection;
import book_store.db.News;
import book_store.db.User;
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
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {
            Long id = Long.parseLong(request.getParameter("id"));
            News news = DBConnection.getNewsById(id);
            request.setAttribute("news", news);
            request.getRequestDispatcher("/news-details.jsp").forward(request, response);
        }else{
            response.sendRedirect("/login");
        }
    }
}
