package lk.ijse.assignment01javaee_project.controller.ProductController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet(name = "UpdateProductServlet", value = "/updateProduct")
public class UpdateProductServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ServletException, IOException {
        String productId = req.getParameter("productId");
        String productName = req.getParameter("productName");
        int categoryID = Integer.parseInt(req.getParameter("categoryId"));
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));

        // Handle file upload (product image)
        Part filePart = req.getPart("productImage");
        String fileName = (filePart != null && !filePart.getSubmittedFileName().trim().isEmpty())
                ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString()
                : null;

        // JDBC code to update the product in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql;
                PreparedStatement ps;

                if (productId != null && !productId.trim().isEmpty()) {
                    // Update product details
                    if (fileName != null) {
                        // Update including image
                        sql = "UPDATE product SET productName=?, categoryID=?, productDescription=?, qtyOnHand=?, unitPrice=?, image=? WHERE productID=?";
                        ps = con.prepareStatement(sql);
                        ps.setString(6, fileName);
                        ps.setInt(7, Integer.parseInt(productId)); // Correctly set productId when image is provided
                    } else {
                        // Update without changing the image
                        sql = "UPDATE product SET productName=?, categoryID=?, productDescription=?, qtyOnHand=?, unitPrice=? WHERE productID=?";
                        ps = con.prepareStatement(sql);
                        ps.setInt(6, Integer.parseInt(productId)); // Correctly set productId when no image is provided
                    }
                    ps.setString(1, productName);
                    ps.setInt(2, categoryID);
                    ps.setString(3, description);
                    ps.setInt(4, quantity);
                    ps.setDouble(5, unitPrice);
                } else {
                    // If no productId (i.e., new product), insert a new one
                    sql = "INSERT INTO product (productName, categoryID, productDescription, qtyOnHand, unitPrice, image) VALUES (?, ?, ?, ?, ?, ?)";
                    ps = con.prepareStatement(sql);
                    ps.setString(6, fileName); // Image file
                    ps.setString(1, productName);
                    ps.setInt(2, categoryID);
                    ps.setString(3, description);
                    ps.setInt(4, quantity);
                    ps.setDouble(5, unitPrice);
                }

                // If file exists, write it to the server's upload directory
                if (fileName != null) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    filePart.write(uploadPath + File.separator + fileName);
                }

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    resp.sendRedirect("product.jsp?message=Product Updated Successfully");
                } else {
                    resp.sendRedirect("product.jsp?message=Product Not Updated");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product.jsp?message=Product Not Updated");
        }
    }

}
