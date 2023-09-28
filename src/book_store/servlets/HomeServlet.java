package book_store.servlets;

import book_store.db.Author;
import book_store.db.Book;
import book_store.db.DBConnection;
import book_store.db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet("/home.html")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Book> books = DBConnection.getBooks();
        request.setAttribute("books",books);

        ArrayList<Author> authors = DBConnection.getAuthors();
        request.setAttribute("authors",authors);

        request.getRequestDispatcher("/books.jsp").forward(request,response);
    }
}
