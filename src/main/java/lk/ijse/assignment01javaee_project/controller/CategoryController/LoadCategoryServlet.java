package lk.ijse.assignment01javaee_project.controller.CategoryController;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.assignment01javaee_project.Entity.Category;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/loadCategories")
public class LoadCategoryServlet extends HttpServlet {


    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("calloadCatergory");

        ArrayList<Category> categories = new ArrayList<>();

        try  {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM category");

                while (resultSet.next()) {
                    categories.add(new Category(resultSet.getInt("categoryId"), resultSet.getString("categoryName")));
                }

    } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("product.jsp").forward(req,resp);
        }

}
