package servlet;

import java.io.IOException;
import java.sql.Connection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.DBConnection;

// Open http://localhost:8080/HospitalAppointment/testdb to check the DB connection
@WebServlet("/testdb")
public class TestDBServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/plain");
        try (Connection con = DBConnection.getConnection()) {
            resp.getWriter().println("Connected to database successfully!");
        } catch (Exception e) {
            resp.getWriter().println("Connection failed: " + e.getMessage());
        }
    }
}
