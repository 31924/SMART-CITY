<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Smart City Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-image: url('./images/smartcityyy.jpg'); /* Path to your background image */
            background-size: cover; /* Cover the entire page */
            background-position: center; /* Center the image */
        }
        .container {
            max-width: 800px;
            margin: 100px auto; /* Keep the vertical centering */
            margin-left: 400px; /* Positive margin to shift the box to the right */
            background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent white background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        p {
            text-align: center;
            margin-bottom: 20px;
            color: #666;
        }
        .contact-info {
            text-align: center;
            margin-bottom: 20px;
        }
        .contact-info p {
            margin: 5px 0;
        }
        .contact-info p strong {
            color: #333;
        }
        footer {
            margin-top: 20px;
            text-align: center;
            color: #888;
            font-size: 0.8em;
        }
        .home-link {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px; /* Add space below the link */
        }
        .home-link a {
            color: #4CAF50;
            text-decoration: none;
        }
        .home-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Contact Us</h1>
        </header>
        <main>
            <p>If you have any questions or inquiries, please feel free to contact us using the information below:</p>
            
            <div class="contact-info">
                <p><strong>Email:</strong> admin@gmail.com</p>
                <p><strong>Phone:</strong> +91 8096259525</p>
                <p><strong>Address:</strong> 123 Main Street, Vijayawada, AP, 533101</p>
            </div>
        </main>
        <footer>
            <p>&copy; 2024 Smart City Management. All rights reserved.</p>
        </footer>
        
        <div class="home-link">
            <p><a href="${pageContext.request.contextPath}/index.jsp">Go back to Home</a></p>
        </div>
    </div>
</body>
</html>
