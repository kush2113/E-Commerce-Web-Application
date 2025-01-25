<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authentication Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<%--    <link rel="stylesheet" href="assets/Style/login.css">--%>

    <style>
        /* General Styles for both login and sign-up */
        .auth-section {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            /*background-color: #f7f7f7;*/
            position: relative;
        }
        .form-container {
            /*background: white;*/
            padding: 2rem;
            /*border-radius: 10px;*/
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 0 1rem;
            border-radius: 0.75rem;
            background-color: rgba(17, 24, 39, 0.5);
            color: rgba(243, 244, 246, 1);
            backdrop-filter: blur(0px);

        }
        .form-container p.title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
            text-align: center;
        }
        .form-container .input-group {
            margin-bottom: 1.5rem;
        }
        .form-container .input-group label {
            display: block;
            margin-bottom: 0.5rem;
        }
        .form-container .input-group input {
            width: 100%;
            padding: 0.75rem;
            /*border: 1px solid #ced4da;*/
            border-radius: 0.25rem;
        }
        .form-container .forgot {
            text-align: right;
            margin-top: 0.5rem;
        }
        .form-container .forgot a {
            font-size: 0.9rem;
            color: #007bff;
            text-decoration: none;
        }
        .form-container .sign {
            text-align: center;
            width: 100%;
            padding: 0.75rem;
            background-color: black;
            border: none;
            color: white;
            border-radius: 0.25rem;
            font-size: 1rem;
            cursor: pointer;
        }
        .form-container .sign:hover {
            background-color: #0056b3;
        }
        .social-icons {
            display: flex;
            justify-content: space-around;
            margin-top: 1.5rem;
        }
        .signup {
            text-align: center;
            margin-top: 1rem;
        }
        .bg-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
            /*filter: contrast(1) brightness(0.3);*/

            /*opacity: 0.3;*/
        }
        .toggle-link {
            cursor: pointer;
            color: #007bff;
            text-decoration: none;
        }

        /*.bg-image {*/
        /*    position: absolute;*/
        /*    top: 0;*/
        /*    left: 0;*/
        /*    width: 100vw;*/
        /*    height: 100vh;*/
        /*    object-fit: cover;*/
        /*    z-index: -1;*/
        /*    filter: contrast(1) brightness(0.3);*/
        /*}*/

    </style>
</head>
<body>
<main class="auth-section">
    <div class="form-container" id="login-container">
        <p class="title">Login</p>
        <form id="loginForm" class="form">
            <div class="input-group">
                <label for="login-username">Username</label>
                <input type="text" name="username" id="login-username" placeholder="Enter your username" />
            </div>
            <div class="input-group">
                <label for="login-password">Password</label>
                <input type="password" name="password" id="login-password" placeholder="Enter your password" />
                <div class="forgot">
                    <a rel="noopener noreferrer" href="#">Forgot Password ?</a>
                </div>
            </div>

            <a  type="submit"  class="sign" href="admin.jsp">Login</a>
        </form>
        <div class="social-icons">
            <button aria-label="Log in with Google" class="icon">
                <!-- Add SVG or image for Google here -->
            </button>
            <button aria-label="Log in with Twitter" class="icon">
                <!-- Add SVG or image for Twitter here -->
            </button>
            <button aria-label="Log in with GitHub" class="icon">
                <!-- Add SVG or image for GitHub here -->
            </button>
        </div>
        <p class="signup">
            Don't have an account?
            <a id="switchToSignUp" class="toggle-link">Sign up</a>
        </p>
    </div>

    <div class="form-container" id="signup-container" style="display: none;">
        <p class="title">Sign Up</p>
        <form id="signUpForm" class="form">
            <div class="input-group">
                <label for="signup-username">Username</label>
                <input type="text" name="username" id="signup-username" placeholder="Create a username" />
            </div>
            <div class="input-group">
                <label for="signup-password">Password</label>
                <input type="password" name="password" id="signup-password" placeholder="Create a password" />
            </div>
            <div class="input-group">
                <label for="signup-confirm-password">Confirm Password</label>
                <input type="password" name="confirm-password" id="signup-confirm-password" placeholder="Confirm your password" />
            </div>
            <button type="submit" class="sign">Sign Up</button>
        </form>
        <p class="signup">
            Already have an account?
            <a id="switchToLogin" class="toggle-link">Log in</a>
        </p>
    </div>

    <img class="bg-image" autoplay muted loop src="assets/images/c9518a20.jpg">
</main>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Switch between login and sign-up
    document.getElementById('switchToSignUp').addEventListener('click', function () {
        document.getElementById('login-container').style.display = 'none';
        document.getElementById('signup-container').style.display = 'block';
    });

    document.getElementById('switchToLogin').addEventListener('click', function () {
        document.getElementById('signup-container').style.display = 'none';
        document.getElementById('login-container').style.display = 'block';
    });

    // Handle login form submission
    document.getElementById('loginForm').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent form submission

        var username = document.getElementById('login-username').value;
        var password = document.getElementById('login-password').value;

        if (username === '' || password === '') {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please enter both username and password!',
            });
        } else {
            Swal.fire({
                icon: 'success',
                title: 'Login successful!',
                text: 'Welcome, ' + username + '!',
            });
        }
    });

    // Handle sign-up form submission
    document.getElementById('signUpForm').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent form submission

        var username = document.getElementById('signup-username').value;
        var password = document.getElementById('signup-password').value;
        var confirmPassword = document.getElementById('signup-confirm-password').value;

        if (username === '' || password === '' || confirmPassword === '') {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please fill all fields!',
            });
        } else if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Passwords do not match!',
                text: 'Please make sure your passwords match.',
            });
        } else {
            Swal.fire({
                icon: 'success',
                title: 'Sign-up successful!',
                text: 'Welcome, ' + username + '!',
            });
        }
    });
</script>
</body>
</html>
