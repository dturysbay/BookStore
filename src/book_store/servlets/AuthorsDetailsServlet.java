package book_store.servlets;

import book_store.db.Author;
import book_store.db.DBConnection;
import book_store.db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/author-details")
public class AuthorsDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {

            int id = -1;
            try {
                id = Integer.parseInt(request.getParameter("author_id"));
            } catch (Exception e) {
                e.printStackTrace();
            }

            Author author = DBConnection.getAuthor(id);
            request.setAttribute("author", author);

            request.getRequestDispatcher("/author-details.jsp").forward(request, response);
        }else{
            response.sendRedirect("/login");
        }
    }
}
