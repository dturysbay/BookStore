package book_store.servlets;

import book_store.db.Author;
import book_store.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-author")
public class AddAuthorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("author_first_name");
        String lastName = request.getParameter("author_last_name");
        String instagram = request.getParameter("author_instagram");

        Author author = new Author();
        author.setFirst_name(firstName);
        author.setLast_name(lastName);
        author.setInstagram(instagram);
        DBConnection.addAuthor(author);

        response.sendRedirect("/authors");
    }
}
