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

@WebServlet(name = "deleteUser", value = "/deleteUser")
public class DeleteServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("user_id");

        if (userId != null && !userId.isEmpty()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                String sql = "DELETE FROM user WHERE user_id = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setLong(1, Integer.parseInt(userId));

                int effectedRows = ps.executeUpdate();
                if (effectedRows > 0) {
                    response.sendRedirect("adduser?message=User Deleted Successfully");
                } else {
                    response.sendRedirect("adduser?message=User Deletion Failed");
                }
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("adduser?message=User Deletion Failed");
            }
        } else {
            response.sendRedirect("user.jsp?message=Invalid User ID");
        }
    }
}
