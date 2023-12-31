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
import java.util.ArrayList;

@WebServlet(value = "/add-book-page")
public class AddBookPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            ArrayList<Author> authors = DBConnection.getAuthors();
            request.setAttribute("authors",authors);

            request.getRequestDispatcher("/addBookPage.jsp").forward(request,response);
        }else{
            response.sendRedirect("/login");
        }


    }
}
