<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/20/2025
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="assets/Style/customer.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
        }
        /* Sidebar styles */
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding: 1rem;
            position: fixed;
            width: 250px;
            top: 0;
            left: 0;
            overflow-y: auto;
        }
        .sidebar .nav-link {
            color: white;
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }
        .sidebar .nav-link:hover {
            background-color: #495057;
            border-radius: 4px;
        }
        /* Content styles */
        .content {
            align-items: center;
            padding: 2rem;
        }
        .topbar {
            position: fixed;
            top: 0;
            left: 250px;
            width: calc(100% - 250px);
            background-color: #f8f9fa;
            padding: 1rem;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .topbar .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .topbar .nav-link {
            margin-left: auto;
        }


        /* Dashboard Cards */
        .dashboard-card {
            border-radius: 15px;
            padding: 2rem;
            background-color: white;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .content {
            margin-top: 129px;
        }

        /* Section Titles */
        .sec {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }

        /* User Table */
        .table-responsive {
            margin-top: 2rem;
        }




    </style>
</head>
<body>

<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Admin Panel</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active"  href="adduser">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addProduct">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addCategory">Category</a>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">Settings</a>--%>
<%--                </li>--%>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</header>

<div class="content">
    <!-- Dashboard Cards Section -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="dashboard-card text-center">
                <h4>Total Users</h4>
                <p>150</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="dashboard-card text-center">
                <h4>Total Products</h4>
                <p>300</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="dashboard-card text-center">
                <h4>Total Sales</h4>
                <p>$20,000</p>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
