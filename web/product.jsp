<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment01javaee_project.Entity.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        #product_section {
            padding: 58px;
            background-color: white;
            border-radius: 8px;
            flex-wrap: wrap;
        }

        h2 {
            font-weight: bold;
            color: #343a40;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 14px;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .mb-3 {
            padding: 10px;
        }

        .d-flex{
            display: flex;
            flex-direction: row-reverse;
        }

        .btn {
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: bold;
            margin-right: 15px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0069d9;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: black;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .table {
            margin-top: 20px;
        }

        .table thead {
            background-color: #343a40;
            color: white;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            padding: 12px;
            font-size: 14px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:hover {
            background-color: #e9ecef;
        }

        .table td .btn {
            font-size: 12px;
            padding: 6px 12px;
        }

        .btn-edit {
            background-color: #ffc107;
            border: none;
        }

        .btn-delete {
            background-color: #dc3545;
            border: none;
        }

        .btn-edit:hover {
            background-color: #e0a800;
        }

        .btn-delete:hover {
            background-color: #c82333;
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
                        <a class="nav-link active"  href="user.jsp">User</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="product.jsp">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Reports</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Settings</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>




<%-- Product Section --%>
<section id="product_section">
    <div class="container mt-3" style="background-color: #f8f9fa">
        <h2 class="text-center mb-3">Product Management</h2>
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <form class="form mb-3" id="productForm" action="addProduct" method="post" enctype="multipart/form-data">
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <input type="text" name="productName" class="form-control" placeholder="Enter product name" required>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <input type="number" name="unitPrice" class="form-control" placeholder="Enter unit price" required>
                        </div>
                        <div class="col-md-6">
                            <input type="text" name="description" class="form-control" placeholder="Enter product description" required>
                        </div>
                    </div>
                    <div class="row mb-2">
                        <div class="col-md-4">
                            <input type="number" name="categoryId" class="form-control" placeholder="Category ID" required>
                        </div>
                        <div class="col-md-4">
                            <input type="number" name="quantity" class="form-control" placeholder="Quantity on hand" required>
                        </div>
                        <div class="mb-3">
                            <input class="form-control" type="file" id="formFile" name="productImage">
                        </div>
                    </div>
                    <div class="d-flex">
                        <button type="submit" class="btn btn-success btn-sm" >Add Product</button>

                    </div>
                </form>
            </div>
        </div>



        <div class="table-responsive mt-3">
            <a href="addProduct">load</a>

            <table class="table table-sm table-bordered table-striped">
                <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category ID</th>
                    <th>Description</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="productTableBody">
                <%-- Loop through product list and display in table --%>
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (Product product : products) {
                %>
                <tr>
                    <td><%= product.getP_id() %></td>
                    <td><%= product.getP_name() %></td>
                    <td><%= product.getC_id() %></td>
                    <td><%= product.getDiscription() %></td>
                    <td><%= product.getQty() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><img src="<%= request.getContextPath() %>/uploads/<%= product.getImage() %>" alt="Product Image" width="50"></td>
                    <td>
                        <button class="btn btn-primary btn-edit" data-bs-toggle="modal"
                                data-bs-target="#editProductModal" data-id="<%= product.getP_id() %>"
                                data-name="<%= product.getP_name() %>" data-category="<%= product.getC_id() %>"
                                data-description="<%= product.getDiscription() %>" data-quantity="<%= product.getQty() %>"
                                data-price="<%= product.getPrice() %>">
                            <i class="bi bi-pencil"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-delete" data-bs-toggle="modal"
                                data-bs-target="#deleteProductModal" data-id="<%= product.getP_id() %>">
                            <i class="bi bi-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7" class="text-center">No products available.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editProductForm" method="post" action="updateProduct" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="editProductId" name="productId">
                    <div class="mb-3">
                        <label for="editProductName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="editProductName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCategoryId" class="form-label">Category ID</label>
                        <input type="number" class="form-control" id="editCategoryId" name="categoryId" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDescription" class="form-label">Description</label>
                        <input type="text" class="form-control" id="editDescription" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="editUnitPrice" class="form-label">Unit Price</label>
                        <input type="number" class="form-control" id="editUnitPrice" name="unitPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="editQuantity" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductImage" class="form-label">Product Image</label>
                        <input class="form-control" type="file" id="editProductImage" name="productImage">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Delete Product Modal -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="deleteProductForm" method="post" action="deleteProduct">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteProductModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this product?</p>
                    <input type="hidden" id="deleteProductId" name="productId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script>
    // Populate the edit modal with data from the table row
    var editButtons = document.querySelectorAll('.btn-edit');
    editButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = this.getAttribute('data-id');
            var productName = this.getAttribute('data-name');
            var categoryId = this.getAttribute('data-category');
            var description = this.getAttribute('data-description');
            var quantity = this.getAttribute('data-quantity');
            var price = this.getAttribute('data-price');

            document.getElementById('editProductId').value = productId;
            document.getElementById('editProductName').value = productName;
            document.getElementById('editCategoryId').value = categoryId;
            document.getElementById('editDescription').value = description;
            document.getElementById('editUnitPrice').value = price;
            document.getElementById('editQuantity').value = quantity;
        });
    });


    // Populate the delete modal with the product ID
    var deleteButtons = document.querySelectorAll('.btn-delete');
    deleteButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = this.getAttribute('data-id');
            document.getElementById('deleteProductId').value = productId;
        });
    });

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
