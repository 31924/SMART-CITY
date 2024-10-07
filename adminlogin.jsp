<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin Login</title>
    <style>
        /* Updated CSS for visibility */
        .login-box {
            border-radius: 30px;
            margin-top: 75px;
            height: auto;
            background: #0e0e0ee9;
            text-align: center;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
        }
        .login-key {
            height: 100px;
            font-size: 80px;
            line-height: 100px;
            background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .login-title {
            margin-top: 15px;
            text-align: center;
            font-size: 30px;
            letter-spacing: 2px;
            font-weight: bold;
            color: #ECF0F5;
        }
        .login-form {
            margin-top: 25px;
            text-align: left;
        }
        .form-control-label {
            color: #ECF0F5;
            font-weight: bold;
        }
        input[type=text], input[type=password] {
            background-color: #1A2226;
            border: none;
            border-bottom: 2px solid #0DB8DE;
            font-weight: bold;
            color: #ECF0F5;
            margin-bottom: 20px;
            width: 100%;
        }
        .btn-outline-primary {
            border-color: #0DB8DE;
            color: #0DB8DE;
            font-weight: bold;
        }
        .btn-outline-primary:hover {
            background-color: #0DB8DE;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-lg-6 col-md-8 login-box p-5">
            <div class="col-lg-12 login-key">
                <i class="fa fa-key" aria-hidden="true"></i>
            </div>
            <div class="col-lg-12 login-title">
                ADMIN LOGIN
            </div>

            <div class="col-lg-12 login-form">
                <form id="loginForm" method="post" action="adminhome.jsp">
                    <div class="form-group">
                        <label class="form-control-label">USERNAME</label>
                        <input type="text" id="uname" name="uname" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">PASSWORD</label>
                        <input type="password" id="pwd" name="pwd" class="form-control" required>
                    </div>

                    <!-- CAPTCHA field -->
                    <div class="form-group">
                        <div id="captchaQuestion" style="background: white; padding: 10px; text-align: center; font-size: 20px; color: black;">
                            <strong id="captchaText"></strong>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">CAPTCHA</label>
                        <input type="text" id="captchaInput" class="form-control" required>
                    </div>

                    <div class="col-lg-12 loginbttm">
                        <div class="col-lg-6 login-btm login-text">
                            <div id="errorMessage" class="error-message"></div>
                        </div>
                        <div class="col-lg-6 login-btm login-button">
                            <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript CAPTCHA and form validation -->
<script>
    // Generate a random alphanumeric CAPTCHA code
    function generateAlphanumericCaptcha() {
        const alphanumeric = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let captchaCode = '';
        for (let i = 0; i < 6; i++) { // Generate a 6-character code
            const randomIndex = Math.floor(Math.random() * alphanumeric.length);
            captchaCode += alphanumeric[randomIndex];
        }
        return captchaCode;
    }

    // Initialize CAPTCHA
    const captchaCode = generateAlphanumericCaptcha();
    document.getElementById('captchaText').textContent = captchaCode;
    document.getElementById('captchaQuestion').setAttribute('data-answer', captchaCode);

    // Form submission handler
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form from submitting normally

        const username = document.getElementById('uname').value;
        const password = document.getElementById('pwd').value;
        const userCaptchaAnswer = document.getElementById('captchaInput').value;
        const correctCaptchaAnswer = document.getElementById('captchaQuestion').getAttribute('data-answer');

        const errorMessageElement = document.getElementById('errorMessage');

        // Clear any previous error messages
        errorMessageElement.innerHTML = '';

        // Check username and password
        if (username !== 'admin' || password !== 'admin') {
            errorMessageElement.innerHTML = 'Login failed. Try again.';
            return;
        }

        // Check CAPTCHA
        if (userCaptchaAnswer !== correctCaptchaAnswer) {
            errorMessageElement.innerHTML = 'CAPTCHA is incorrect. Please try again.';
            document.getElementById('captchaInput').value = ''; // Clear input field
            // Generate a new CAPTCHA code
            const newCaptchaCode = generateAlphanumericCaptcha();
            document.getElementById('captchaText').textContent = newCaptchaCode;
            document.getElementById('captchaQuestion').setAttribute('data-answer', newCaptchaCode);
            return;
        }

        // If both conditions are met, redirect to adminhome.jsp
        window.location.href = 'adminhome.jsp';
    });
</script>

</body>
</html>
