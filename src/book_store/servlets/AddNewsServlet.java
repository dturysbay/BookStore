package book_store.servlets;

import book_store.db.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-news")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            News news = new News();
            news.setTitle(title);
            news.setContent(content);
            news.setUser(currentUser);
            DBConnection.addNews(news);

            response.sendRedirect("/add-news");
        }else{
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser!=null){
            request.getRequestDispatcher("addnews.jsp").forward(request,response);
        }else{
            response.sendRedirect("/login");
        }
    }
}
