<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<html>
<head>


</head>
<body>

<%@ include file="navbar.jsp" %>
<style>

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
    margin-top: 15px;
    font-weight: bold;
    color: #ECF0F5;
}

.login-form {
    margin-top: 25px;
    text-align: left;
}

input[type=email] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #ECF0F5;
}

input[type=password] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    padding-left: 0px;
    margin-bottom: 20px;
    color: #ECF0F5;
}

.form-group {
    margin-bottom: 40px;
    outline: 0px;
}

.form-control:focus {
    border-color: inherit;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom: 2px solid #0DB8DE;
    outline: 0;
    background-color: #1A2226;
    color: #ECF0F5;
}

input:focus {
    outline: none;
    box-shadow: 0 0 0;
}

label {
    margin-bottom: 0px;
}

.form-control-label {
    font-size: 10px;
    color: #6C6C6C;
    font-weight: bold;
    letter-spacing: 1px;
}

.btn-outline-primary {
    border-color: #0DB8DE;
    color: #0DB8DE;
    border-radius: 0px;
    font-weight: bold;
    letter-spacing: 1px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.btn-outline-primary:hover {
    background-color: #0DB8DE;
    right: 0px;
}

.login-btm {
    float: left;
}

.login-button {
    padding-right: 0px;
    text-align: right;
    margin-bottom: 25px;
}

.login-email {
    text-align: left;
    padding-left: 0px;
    color: #A2A4A4;
}

.loginbttm {
    padding: 0px;
}
</style>
<br>

<br>
      <c:if test="${not empty ack}">
              <script >
                alert("${ack}");
              </script>
            </c:if>

 <div class="container ">
    <div class="row">
        <div class="col-lg-3 col-md-2"></div>
        <div class="col-lg-6 col-md-8 login-box p-5">
            <div class="col-lg-12 login-key">
                <i class="fa fa-user" aria-hidden="true"></i>
            </div>
            <div class="col-lg-12 text-light">
                User Login
            </div>
            <div class="col-lg-12 login-form text-light">
                <div class="col-lg-12 login-form">
                    <form method="post" action="emphome.jsp">
                        <div class="form-group">
                            <label class="form-control-label">Email ID</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">PASSWORD</label>
                            <input type="password" class="form-control" name="pwd" required>
                        </div>
                         <!-- CAPTCHA field -->
<div class="form-group">
    <div id="captchaQuestion" style="background: white; padding: 10px; text-align: center; font-size: 20px; color: black;">
        <strong id="captchaText"></strong>
    </div>
</div>
<div class="form-group">
    <label class="form-control-label" style="color: #6C6C6C; font-weight: bold; letter-spacing: 1px;">CAPTCHA</label>
    <input type="text" id="captchaInput" class="form-control" style="border-color: inherit; outline: 0; background-color: #1A2226; color: #ECF0F5;" required>
</div>
                         

                        <div class="col-lg-12 loginbttm">
                            <div class="col-lg-6 login-btm login-text">
                                <p class="text-danger">${message}</p>
                            </div>
                            <div class="col-lg-6 login-btm login-button">
                                <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                              
                            </div>
                            <div class="col-lg-6 ">
                                <p>
                New Registration ? <a href="empreg.jsp">Click Here</a>
                </p>
           
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-md-2"></div>
        </div>
    </div>
  </div>
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
        document.getElementById('captchaQuestion').textContent = captchaCode;
        document.getElementById('captchaQuestion').setAttribute('data-answer', captchaCode);

        // Form submission handler
        document.querySelector('form').addEventListener('submit', function (event) {
            const userAnswer = document.getElementById('captchaInput').value;
            const correctAnswer = document.getElementById('captchaQuestion').getAttribute('data-answer');
            if (userAnswer !== correctAnswer) {
                event.preventDefault(); // Prevent form submission
                alert('CAPTCHA is incorrect. Please try again.');
                document.getElementById('captchaInput').value = ''; // Clear input field
                const newCaptchaCode = generateAlphanumericCaptcha();
                document.getElementById('captchaQuestion').textContent = newCaptchaCode; // Generate a new CAPTCHA code
                document.getElementById('captchaQuestion').setAttribute('data-answer', newCaptchaCode);
            }
        });
    </script>


</body>
</html>