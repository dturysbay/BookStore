package book_store.servlets;

import book_store.db.DBConnection;
import book_store.db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User)request.getSession().getAttribute("currentUser");
        if(currentUser == null) {
            String fullName = request.getParameter("full_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            User user = new User();
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPassword(password);

            DBConnection.registerUser(user);
            response.sendRedirect("/login");
        }else{
            response.sendRedirect("/profile");
        }
    }
}
