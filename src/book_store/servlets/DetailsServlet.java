package book_store.servlets;

import book_store.db.Author;
import book_store.db.Book;
import book_store.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = -1;

        try{
           id= Integer.parseInt(request.getParameter("book_id"));
        }catch (Exception e){

        }

        Book book = DBConnection.getBook(id);
        request.setAttribute("book",book);

        ArrayList<Author> authors = DBConnection.getAuthors();
        request.setAttribute("authors",authors);

        request.getRequestDispatcher("/details.jsp").forward(request,response);

    }
}
