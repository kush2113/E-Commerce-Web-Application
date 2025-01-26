<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.assignment01javaee_project.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/24/2025
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7f6;
        }
        .table-wrapper {
            margin: 126px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .table td, .table th {
            text-align: center;
        }
        .modal-content {
            border-radius: 10px;
        }


        #user_section {
            margin-top: 54px;
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
                        <a class="nav-link"  href="addCategory">Category</a>
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


<!-- User Management Table -->
<div class="container table-wrapper">
    <div class="d-flex justify-content-between mb-3">
        <h2>User Management</h2>
        <button  type="button" class="btn btn-primary"   data-bs-toggle="modal"  data-bs-target="#addUserModal" >
            Add User
        </button>
    </div>


    <table class="table table-bordered table-striped" >
        <thead class="table-dark" >

        <tr>
            <th>User ID</th>
            <th>Name</th>
            <th>Email</th>
<%--            <th>Password</th>--%>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody id="userTableBody" >

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users !=null && !users.isEmpty()){
                for (User user : users){
        %>

        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
<%--            <td><%= user.getPassword() %></td>--%>
            <td><%= user.getRole() %></td>
            <td>
                <button id="edit-btn" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editUserModal"
                        data-id="<%= user.getId() %>"
                        data-username="<%= user.getName() %>"
                        data-email="<%= user.getEmail() %>"
<%--                        data-password="<%= user.getPassword() %>"--%>
                        data-role="<%= user.getRole() %>">
                    <i class="bi bi-pencil"></i> Edit
                </button>
                <button id="delete-btn" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteUserModal"
                        data-id="<%= user.getId() %>">
                    <i class="bi bi-trash"></i> Delete
                </button>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center">No users found</td>
        </tr>
        <%
            }
        %>

        </tbody>
    </table>
</div>

<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addUserForm" action="adduser" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input name="name" type="text" class="form-control" id="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input name="password" type="password" class="form-control" id="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary" href="adduser" >Save User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editUserForm" action="updateUser" method="post">
                    <input type="hidden" name="_method" value="PUT"> <!-- Emulate PUT method -->
                    <div class="mb-3">
                        <label for="editUserId" class="form-label">User ID</label>
                        <input name="user_id" type="text" class="form-control" id="editUserId" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editUsername" class="form-label">Username</label>
                        <input name="name" type="text" class="form-control" id="editUsername" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEmail" class="form-label">Email</label>
                        <input name="email" type="email" class="form-control" id="editEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="editRole" class="form-label">Role</label>
                        <select class="form-select" id="editRole" name="role" required>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Update User</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this user?</p>
                <form id="deleteUserForm" action="deleteUser" method="post">
                    <input type="hidden" name="user_id" id="deleteUserId">
                    <button type="submit" class="btn btn-danger">Delete</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="assets/JQ/jquery-3.7.1.min.js"></script>
<script>
    // Fill Edit User Modal with current user details
    const editButtons = document.querySelectorAll('#edit-btn');
    editButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const userId = this.dataset.id;
            const username = this.dataset.username;
            const email = this.dataset.email;
            const role = this.dataset.role;

            document.getElementById('editUserId').value = userId;
            document.getElementById('editUsername').value = username;
            document.getElementById('editEmail').value = email;
            document.getElementById('editRole').value = role;
        });
    });
    const deleteButtons = document.querySelectorAll('#delete-btn');
    deleteButtons.forEach(btn => {
        btn.addEventListener('click', function() {
            const userId = this.dataset.id;
            document.getElementById('deleteUserId').value = userId;
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
