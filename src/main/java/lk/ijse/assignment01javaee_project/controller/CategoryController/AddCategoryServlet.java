package lk.ijse.assignment01javaee_project.controller.CategoryController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.assignment01javaee_project.Entity.Category;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet(name = "AddCategoryServlet", value = "/addCategory")
public class AddCategoryServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Category> categories = new ArrayList<>();


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM category");

            while (resultSet.next()) {
                Category category = new Category();
                category.setCategoryId(resultSet.getInt("categoryID"));
                category.setCategoryName(resultSet.getString("categoryName"));
                category.setCategoryImage(resultSet.getString("categoryImage"));
                categories.add(category);
            }

            req.setAttribute("categories", categories);
            req.getRequestDispatcher("category.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException("Error in doGet", e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String categoryName = req.getParameter("categoryName");


        try {
            Part filePart = req.getPart("categoryImage"); // Get the uploaded file
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get file name

            if (fileName == null || fileName.trim().isEmpty()) {
                resp.getWriter().write("Category image is required.");
                return;
            }

            // Define upload directory
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create uploads directory if it doesn't exist
            }

            // Write the file to the server
            filePart.write(uploadPath + File.separator + fileName);



            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO category ( categoryName, categoryImage) VALUES ( ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

//            ps.setInt(1, categoryID);
            ps.setString(1, categoryName);
            ps.setString(2, fileName);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                resp.sendRedirect("category.jsp?massage=Category Saved Successfully");
            }else {
                resp.sendRedirect("category.jsp?massage=Category Not Saved");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?massage=Category Not Saved");
        }
    }
}
