package servlet;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = new UserDAO().login(email, password);

            if (user != null) {
                HttpSession session = request.getSession();   // creates session if none exists
                session.setAttribute("user", user);
                session.setMaxInactiveInterval(30 * 60);      // 30 minutes

                if ("admin".equals(user.getRole())) {
                    response.sendRedirect("adminDashboard.jsp");
                } else {
                    response.sendRedirect("patientDashboard.jsp");
                }
                return;
            }
            request.setAttribute("error", "Invalid email or password.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again.");
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
