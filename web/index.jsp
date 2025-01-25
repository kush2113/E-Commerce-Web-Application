<%@ page import="lk.ijse.assignment01javaee_project.Entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>


    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/Style/home.css">
    <style>

        /* Make navbar background black */
        .navbar {
            background: black  !important; /* Ensures navbar has a black background */
            box-shadow: none; /* Optional: Removes any shadow */
        }

        .navbar-brand {
            color: white !important; /* Change navbar brand color to white for visibility */
        }

        .navbar-nav .nav-link {
            color: white !important; /* Ensure the text of the navbar links is white */
        }

        .container-fluid {
            /*color: black;*/
        }



        footer {
            background-color: #2a2a2a; /* Dark background */
            color: #ffffff;            /* White text */
        }

        footer h5 {
            color: #ffffff;
            margin-bottom: 20px;
        }

        footer a {
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        footer .form-control {
            max-width: 250px;
        }

        footer .btn {
            min-width: 120px;
        }

        footer .list-inline-item {
            margin-right: 15px;
        }


        footer .row {
            background-color: transparent; /* Ensure transparency for rows */
            margin-top: 30px; /* Adjust the top margin */
            margin-bottom: 30px; /* Adjust the bottom margin */
        }

        footer .col-md-3 {
            margin-bottom: 20px; /* Add some spacing between columns */
        }

        footer .container1 {
            padding: 40px 20px; /* Adjust overall padding */
        }


        .bg-dark {
            display: flex;
            /* margin-left: 0px; */
            --bs-bg-opacity: 1;
            /*background-color: dimgrey;*/
            align-items: center;
            flex-direction: column
        }

        .ttt {
            height: 92px;
            width: 147px;
        }

    </style>
</head>


<body>

<main class="home-section">

<nav class="navbar navbar-expand-lg  bg-body-tertiary fixed-top " data-bs-theme="dark">
    <div class="container-fluid">
        <img class="ttt" src="assets/images/Screenshot%202025-01-26%20053711.png">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="">
                                <img src="assets/images/img_8.png" alt="Racing Drones" style="width: 30px; height: 30px; margin-right: 10px;"> Racing Drones
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="assets/images/img_9.png">
                                <img src="drone2.jpg" alt="Camera Drones" style="width: 30px; height: 30px; margin-right: 10px;"> Camera Drones
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <img src="drone3.jpg" alt="Mini Drones" style="width: 30px; height: 30px; margin-right: 10px;"> Mini Drones
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="#">
                                <img src="drone4.jpg" alt="Professional Drones" style="width: 30px; height: 30px; margin-right: 10px;"> Professional Drones
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">About</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">Contact</a>
                </li>
            </ul>
            <form class="d-flex" role="search" style="margin-right: 20px;">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" style="margin-right: 13px"  id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" stroke-width="0" fill="currentColor" stroke="currentColor" class="icon">
                        <path d="M12 2.5a5.5 5.5 0 0 1 3.096 10.047 9.005 9.005 0 0 1 5.9 8.181.75.75 0 1 1-1.499.044 7.5 7.5 0 0 0-14.993 0 .75.75 0 0 1-1.5-.045 9.005 9.005 0 0 1 5.9-8.18A5.5 5.5 0 0 1 12 2.5ZM8 8a4 4 0 1 0 8 0 4 4 0 0 0-8 0Z"></path>
                    </svg>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                    <li><a class="dropdown-item" href="register.jsp">Register</a></li>
                </ul>
            </div>
            <div class="dropdown d-flex align-items-center">
                <!-- Cart Icon with Count -->
                <div class="position-relative" style="margin-right: 15px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon">
                        <path style="
                            background: white" d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                    </svg>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill " style="font-size: 12px; padding: 5px 8px;">
                        26 <!-- Dynamically generated count can go here -->
                    </span>
                </div>
            </div>
        </div>
    </div>
</nav>

<video class="bg-video" autoplay muted loop>
    <source src="assets/images/f9d82514.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

    <div class="home-center-text">
        <div class="home-center-text-01">
            Dual-Camera Drone for Travel Photography
        </div>
        <div class="home-center-text-02">
            DJI Air 3S
        </div>
        <div class="home-center-text-03">
            Chase the View
        </div>
        <div>
            <button class="shop-now" >
                <span data-aos="fade-up" >Buy now</span>
            </button>
        </div>
        <div>
            <button class="shop-now" onclick="window.location.href='assets/images/720.mp4'">
                <span data-aos="fade-up">Watch Video</span>
            </button>
        </div>

    </div>

</main>

<br>
<br>
<br>

<main class="section02">
    <p class="pare">
        A dual-camera drone designed for travel photography, DJI Air 3S integrates a suite of advanced technologies. Featuring a 1-inch-CMOS primary camera and a 70mm medium tele camera, each with up to 14 stops of dynamic range, [1] Air 3S captures landscapes, portraits, and more in stunning detail. Both cameras support the new Free panorama feature, which allows flexible shooting-range selections. Additional new highlights include nightscape obstacle sensing [2] and next-gen Smart RTH for enhanced safety during nighttime photography. In each and every way, DJI Air 3S is designed to maximize every aerial moment.
    </p>
</main>

<main class="container py-5">
    <div class="row">
        <!-- Left column -->
        <div class="col-md-6">
            <div class="row mb-3">
                <!-- Top Left -->
                <div class="col-md-12">
                    <div class="image-container">
                        <img src="assets/images/img_1.png" alt="Primary Camera">
                        <div class="image-overlay1">
                            <h3>1" CMOS Primary Camera</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Bottom Left -->
                <div class="col-md-12">
                    <div class="image-container">
                        <img src="assets/images/img_2.png" alt="Nightscape Sensing">
                        <div class="image-overlay1">
                            <h4 class="text-small">Nightscape Omnidirectional Obstacle Sensing</h4>
                            <p>[2]</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right column - Divided into three sections -->
        <div class="col-md-6 d-flex flex-column">
            <div class="image-container flex-grow-1">
                <video id="image" autoplay muted loop>
                    <source src="assets/images/587e19d4.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
                <div class="image-overlay">
                    <h4>Dual Camera</h4>
                    <p class="text-large">4K/60fps HDR Video &<br>14 Stops of Dynamic Range</p>
                    <p>[1]</p>
                </div>
            </div>
        </div>
    </div>
</main>

<%
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Ijse@123";
    List<Product> products = new ArrayList<>();

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM product");

        // Retrieve products from the database
        while (rs.next()) {
            Product product = new Product();
            product.setP_id(rs.getInt("productID"));
            product.setP_name(rs.getString("productName"));
            product.setC_id(rs.getInt("categoryID"));
            product.setDiscription(rs.getString("productDescription"));
            product.setQty(rs.getInt("qtyOnHand"));
            product.setPrice(rs.getBigDecimal("unitPrice"));
            product.setImage(rs.getString("image"));
            products.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("products", products);
%>

<!-- Buy Section (Displaying Products) -->
<main class="buy-section">
    <div class="drone-container">
        <% for (Product product : (List<Product>) request.getAttribute("products")) { %>
        <div class="drone-item">
            <img src="uploads/<%= product.getImage() %>" alt="<%= product.getP_name() %>">
            <h4 class="tag"><%= product.getDiscription() %></h4>
            <h3><%= product.getP_name() %></h3>
            <a class="btn-buy" style="background: red" href="buyNow.jsp" >Buy Now</a>
            <a class="btn-buy"
                    href="addCart.jsp?productID=<%= product.getP_id() %>&productName=<%= product.getP_name() %>&productDescription=<%= product.getDiscription() %>&unitPrice=<%= product.getPrice() %>&image=<%= product.getImage() %>">
                Add to cart
            </a>        </div>
        <% } %>
    </div>
</main>


<%--<main class="services" id="my-service-page">--%>
<%--    <section class="services-section" >--%>
<%--        <!--          <div>-->--%>
<%--        <div data-aos="zoom-in" class="services-box">--%>
<%--        </div>--%>

<%--        <div data-aos="zoom-in" class="services-box">--%>
<%--        </div>--%>

<%--        <div data-aos="zoom-in" class="services-box">--%>
<%--        </div>--%>
<%--        <!--          </div>-->--%>
<%--    </section>--%>
<%--</main>--%>




<!-- Footer Section -->
<footer class="bg-dark text-light py-4">
    <div class="container1">
        <div class="row" >
            <!-- Product Categories -->
            <div class="col-md-3">
                <h5>Product Categories</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Consumer</a></li>
                    <li><a href="#" class="text-light">Professional</a></li>
                    <li><a href="#" class="text-light">Enterprise</a></li>
                    <li><a href="#" class="text-light">Components</a></li>
                </ul>
            </div>

            <!-- Service Plans -->
            <div class="col-md-3">
                <h5>Service Plans</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">DJI Care Refresh</a></li>
                    <li><a href="#" class="text-light">DJI Care Pro</a></li>
                    <li><a href="#" class="text-light">DJI Care Enterprise</a></li>
                    <li><a href="#" class="text-light">DJI Maintenance Program</a></li>
                </ul>
            </div>

            <!-- Where to Buy -->
            <div class="col-md-3">
                <h5>Where to Buy</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">DJI Online Store</a></li>
                    <li><a href="#" class="text-light">Retail Stores</a></li>
                    <li><a href="#" class="text-light">Pro Retailers</a></li>
                    <li><a href="#" class="text-light">Delivery Drone Dealer</a></li>
                </ul>
            </div>

            <!-- Support -->
            <div class="col-md-3">
                <h5>Support</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Product Support</a></li>
                    <li><a href="#" class="text-light">Help Center</a></li>
                    <li><a href="#" class="text-light">Download Center</a></li>
                    <li><a href="#" class="text-light">Security and Privacy</a></li>
                </ul>
            </div>
        </div>

        <!-- Subscribe Section -->
        <div class="row mt-4" >
            <div class="col-md-6">
                <h5>Subscribe</h5>
                <p>Get the latest news from KS DRONES</p>
                <form class="d-flex">
                    <input type="email" class="form-control me-2" placeholder="Your email address">
                    <button type="submit" class="btn btn-outline-light">Subscribe</button>
                </form>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="row mt-4">
            <div class="col-md-12 text-center">
                <p>&copy; 2025 KS DRONES. All Rights Reserved.</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#" class="text-light">Privacy Policy</a></li>
                    <li class="list-inline-item"><a href="#" class="text-light">Terms of Use</a></li>
                    <li class="list-inline-item"><a href="#" class="text-light">Contact Us</a></li>
                    <li class="list-inline-item"><a href="#" class="text-light">Careers</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>







<%--<main class="buy-section">--%>
<%--<div class="drone-container">--%>
<%--    <div class="drone-item">--%>
<%--        <img src="assets/images/img_8.png" alt="DJI Mavic 3 Pro">--%>
<%--        <h4 class="tag">Flagship</h4>--%>
<%--        <h3>DJI Mavic 3 Pro</h3>--%>
<%--        <button class="btn-buy">Where to Buy</button>--%>
<%--        <a href="#">Learn More</a>--%>
<%--    </div>--%>
<%--    <div class="drone-item">--%>
<%--        <img src="assets/images/img_10.png" alt="DJI Air 3S">--%>
<%--        <h4 class="tag">Advanced</h4>--%>
<%--        <h3>DJI Air 3S</h3>--%>
<%--        <button class="btn-buy">Where to Buy</button>--%>
<%--        <a href="#">Learn More</a>--%>
<%--    </div>--%>
<%--    <div class="drone-item">--%>
<%--        <img src="assets/images/img_11.png" alt="DJI Mini 4 Pro">--%>
<%--        <h4 class="tag">Entry</h4>--%>
<%--        <h3>DJI Mini 4 Pro</h3>--%>
<%--        <button class="btn-buy">Where to Buy</button>--%>
<%--        <a href="#">Learn More</a>--%>
<%--    </div>--%>
<%--    <div class="drone-item">--%>
<%--        <img src="assets/images/img_12.png" alt="DJI Flip">--%>
<%--        <h4 class="tag">New</h4>--%>
<%--        <h3>DJI Flip</h3>--%>
<%--        <button class="btn-buy">Where to Buy</button>--%>
<%--        <a href="#">Learn More</a>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</main>--%>