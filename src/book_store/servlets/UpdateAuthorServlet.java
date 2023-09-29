package book_store.servlets;

import book_store.db.Author;
import book_store.db.Book;
import book_store.db.DBConnection;
import book_store.db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/update-author")
public class UpdateAuthorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null) {
            int id = Integer.parseInt(request.getParameter("author_id"));
            String first_name = request.getParameter("author_first_name");
            String last_name = request.getParameter("author_last_name");
            String instagram = request.getParameter("instagram");
            Author author = new Author();
            author.setId(id);
            author.setFirst_name(first_name);
            author.setLast_name(last_name);
            author.setInstagram(instagram);
            DBConnection.updateAuthor(author);

            response.sendRedirect("/authors");
        }else{
            response.sendRedirect("/login");
        }
    }
}
