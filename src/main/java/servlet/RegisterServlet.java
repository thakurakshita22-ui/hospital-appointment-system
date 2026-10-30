package servlet;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name     = request.getParameter("name");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String phone    = request.getParameter("phone");

        String error = null;
        if (name == null || name.isBlank() || email == null || email.isBlank()
                || password == null || password.length() < 4) {
            error = "Please fill all fields (password must be at least 4 characters).";
        }

        try {
            UserDAO dao = new UserDAO();
            if (error == null && dao.emailExists(email.trim())) {
                error = "This email is already registered.";
            }
            if (error == null) {
                dao.register(new User(name.trim(), email.trim(), password, phone));
                // sendRedirect: browser makes a NEW request, URL changes
                response.sendRedirect("login.jsp?msg=registered");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            error = "Database error. Please try again.";
        }

        // RequestDispatcher forward: SAME request, URL stays /register
        request.setAttribute("error", error);
        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        rd.forward(request, response);
    }
}
