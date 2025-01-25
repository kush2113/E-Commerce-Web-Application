<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/18/2025
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assets/Style/register.css">

</head>
<body>

<%-- Display error message if there is any --%>
    <% if (request.getParameter("error") != null) { %>
    <p style="color: red;">Error: <%= request.getParameter("error") %></p>
    <% } %>

<main class="reg-section">
<form class="form">
    <p class="title">Register </p>
    <p class="message">Signup now and get full access to our app. </p>
    <div class="flex">
        <label>
            <input class="input" type="text" placeholder="" required="">
            <span>Name</span>
        </label>
    </div>

    <label>
        <input class="input" type="email" placeholder="" required="">
        <span>Email</span>
    </label>

    <label>
        <input class="input" type="password" placeholder="" required="">
        <span>Password</span>
    </label>
    <label>
        <input class="input" type="password" placeholder="" required="">
        <span>Confirm password</span>
    </label>
    <button class="submit">Submit</button>
    <p class="signin">Already have an acount ? <a href="#">Signin</a> </p>

    <img class="reg-image" autoplay muted loop src="assets/images/img_13.png">
</form>

</main>
</body>
</html>
