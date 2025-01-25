package lk.ijse.assignment01javaee_project.controller.UserController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/updateUser" , name = "updateUser")
public class UpdateServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ssssssssssssssjjsj");// Get the user data from the request


        String userId = req.getParameter("user_id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String role = req.getParameter("role");

        // Check if the parameters are valid
        if (userId == null || name == null || email == null || role == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing user data");
            return;
        }

        // Database connection and updating the user
        try {
            System.out.println("asdsdass");
            // Initialize database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Create a prepared statement for updating the user
            String updateQuery = "UPDATE user SET name = ?, email = ?, role = ? WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setLong(4, Long.parseLong(userId));

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("User updated successfully!");
                resp.sendRedirect("adduser"); // Redirect to the user management page
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }

}
