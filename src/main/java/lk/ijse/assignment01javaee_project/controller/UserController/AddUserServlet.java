package lk.ijse.assignment01javaee_project.controller.UserController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment01javaee_project.Entity.User;
import lk.ijse.assignment01javaee_project.controller.HelloServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddUserServlet", value = "/adduser")
public class AddUserServlet extends HelloServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("waesdrtyhui");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");

        System.out.println(name + " "  + " " + email + " " + role + " " + password);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO user (name, email, role, password) VALUES ( ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, role);
            ps.setString(4, password);

            int effectedRows = ps.executeUpdate();
            if (effectedRows > 0) {
                response.sendRedirect("user.jsp?massage=Customer Saved Successfully");
            }else {
                response.sendRedirect("user.jsp?massage=Customer Not Saved");
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("user.jsp?massage=Customer Not Saved");
        }
    }
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("ssssssss");
        List<User> users = new ArrayList<>();

        try {
            System.out.println("try");
//            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            Statement statement = connection.createStatement();


            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * FROM user");

            while (resultSet.next()) {
                System.out.println("sdfghjk");
                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
//                user.setPassword(resultSet.getString("password"));
                users.add(user);

            }
            request.setAttribute("users", users);
            request.getRequestDispatcher("user.jsp").forward(request, response);

        } catch (SQLException | ServletException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching users from the database");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }



}
