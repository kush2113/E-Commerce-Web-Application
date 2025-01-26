<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment01javaee_project.Entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        #category_section {
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

        .d-flex {
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
                        <a class="nav-link active"  href="adduser">User</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addProduct">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addCategory">Category</a>
                    </li>
<%--                    <li class="nav-item"><a class="nav-link" href="#">Settings</a>--%>
<%--                    </li>--%>
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


<section id="category_section" class="mt-5">
    <div class="container mt-5">
        <h2 class="text-center mb-3">Category Management</h2>
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12">
                <form class="form mb-3" id="categoryForm" action="addCategory"  method="post" enctype="multipart/form-data">
                    <div class="row mb-2">
                        <div class="col-md-6">
                            <input type="text" name="categoryName" class="form-control" placeholder="Enter category name" required>
                        </div>
                        <div class="col-md-6">
                            <input class="form-control" type="file" id="formFile" name="categoryImage">
                        </div>
                    </div>
                    <div class="d-flex">
                        <button type="submit" class="btn btn-success btn-sm">Add Category</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="table-responsive mt-3">
            <table class="table table-sm table-bordered table-striped">
                <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Category Image</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="categoryTableBody">
                <%-- Loop through category list and display in table --%>
                <%
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    if (categories != null) {
                        for (Category category : categories) {
                %>
                <tr>
                    <td><%= category.getCategoryId()%></td>
                    <td><%= category.getCategoryName()%></td>
                    <td><img src="<%= request.getContextPath() %>/uploads/<%= category.getCategoryImage() %>" alt="Category Image" width="50"></td>
                    <td>
                        <button class="btn btn-primary btn-edit" data-bs-toggle="modal"
                                data-bs-target="#editCategoryModal" data-id="<%= category.getCategoryId() %>"
                                data-name="<%= category.getCategoryName() %>">
                            <i class="bi bi-pencil"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-delete" data-bs-toggle="modal"
                                data-bs-target="#deleteCategoryModal" data-id="<%= category.getCategoryId() %>">
                            <i class="bi bi-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-center">No categories available.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Edit Category Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="editCategoryForm" method="post" action="updateCategory" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="editCategoryId" name="categoryId">
                    <div class="mb-3">
                        <label for="editCategoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="editCategoryName" name="categoryName" required>
                    </div>
                    <div class="mb-3">
                        <label for="editCategoryImage" class="form-label">Category Image</label>
                        <input class="form-control" type="file" id="editCategoryImage" name="categoryImage">
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

<!-- Delete Category Modal -->
<div class="modal fade" id="deleteCategoryModal" tabindex="-1" aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="deleteCategoryForm" method="post" action="deleteCategory">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteCategoryModalLabel">Delete Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="deleteCategoryId" name="categoryId">
                    <p>Are you sure you want to delete this category?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    // Populate edit modal with selected category data
    const editCategoryModal = document.getElementById('editCategoryModal');
    editCategoryModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const categoryId = button.getAttribute('data-id');
        const categoryName = button.getAttribute('data-name');

        document.getElementById('editCategoryId').value = categoryId;
        document.getElementById('editCategoryName').value = categoryName;
    });

    // Populate delete modal with selected category ID
    const deleteCategoryModal = document.getElementById('deleteCategoryModal');
    deleteCategoryModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const categoryId = button.getAttribute('data-id');

        document.getElementById('deleteCategoryId').value = categoryId;
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
