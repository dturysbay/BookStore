package book_store.servlets;

import book_store.db.DBConnection;
import book_store.db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/delete-author")
public class DeleteAuthorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {
            int id = Integer.parseInt(request.getParameter("author_id"));
            DBConnection.deleteAuthor(id);
            response.sendRedirect("/authors");
        }
    }
}
