package lk.ijse.assignment01javaee_project.controller.ProductController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteProductServlet", value = "/deleteProduct")
public class DeleteProductServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        String productId = req.getParameter("productId");

        // JDBC code to delete the product from the database
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM product WHERE productID = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(productId));
                int rows = ps.executeUpdate();
                if (rows > 0) {
                    resp.sendRedirect("product.jsp?message=Product Deleted Successfully");
                } else {
                    resp.sendRedirect("product.jsp?message=Product Not Found");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product.jsp?message=Error Deleting Product");
        }
    }
}
