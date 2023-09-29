package book_store.servlets;

import book_store.db.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-book")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            String name = request.getParameter("book_name");
            int authorId = Integer.parseInt(request.getParameter("book_author"));
            String genre = request.getParameter("book_genre");
            String price = request.getParameter("book_price");
            String description = request.getParameter("book_description");
            Double bookPrice = Double.parseDouble(price);

            Author author = DBConnection.getAuthor(authorId);
            if(author != null){
                Book book = new Book();
                book.setName(name);
                book.setGenre(genre);
                book.setPrice(bookPrice);
                book.setDescription(description);
                book.setAuthor(author);
                DBConnection.addBook(book);
            }

            response.sendRedirect("/");
        }else{
            response.sendRedirect("/login");
        }

    }
}
