package lk.ijse.assignment01javaee_project.controller.ProductController;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.assignment01javaee_project.Entity.Category;
import lk.ijse.assignment01javaee_project.Entity.Product;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig
@WebServlet(name = "AddProductServlet", value = "/addProduct")
public class AddProductServlet extends HttpServlet {

    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productName = req.getParameter("productName");
        int categoryID = Integer.parseInt(req.getParameter("productCategory"));
        String description = req.getParameter("description");
        String qty = req.getParameter("quantity");
        String unitPrice = req.getParameter("unitPrice");

        System.out.println(productName + " " + categoryID + " " + description + " " + qty + " " + unitPrice);

        System.out.println("doPost method run");

        try {

            // Handle file upload
            Part filePart = req.getPart("productImage"); // Get the uploaded file
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get file name

            if (fileName == null || fileName.trim().isEmpty()) {
                resp.getWriter().write("Product image is required.");
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
            String sql = "INSERT INTO product ( productName, categoryID, productDescription,qtyOnHand,unitPrice,image) VALUES ( ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, productName);
            ps.setInt(2, categoryID);
            ps.setString(3, description);
            ps.setString(4, qty);
            ps.setString(5, unitPrice);
            ps.setString(6, fileName);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                resp.sendRedirect("index.jsp?massage=Product Saved Successfully");
            }else {
                resp.sendRedirect("product.jsp?massage=Product Not Saved");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("product.jsp?massage=Product Not Saved");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM product");

            while (resultSet.next()) {
                Product product = new Product();
                product.setP_id(resultSet.getInt("productID"));
                product.setP_name(resultSet.getString("productName"));
                product.setC_id(resultSet.getInt("categoryID"));
                product.setDiscription(resultSet.getString("productDescription"));
                product.setQty(resultSet.getInt("qtyOnHand"));
                product.setPrice(resultSet.getBigDecimal("unitPrice"));
                product.setImage(resultSet.getString("image"));
                products.add(product);
            }
            req.setAttribute("products", products);
            req.getRequestDispatcher("product.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException("Error in doGet", e);
        }
    }
}
