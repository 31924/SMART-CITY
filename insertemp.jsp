<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="com.example.demo.model.Employee" %>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" %>

<%
    // Initialize variables for messages
    String message = "";
    boolean success = false;

    // Retrieve form parameters
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String role = request.getParameter("role");
    String email = request.getParameter("email");
    String password = request.getParameter("pwd");
    String location = request.getParameter("location");
    String contact = request.getParameter("contact");

    // Basic validation (you can add more as needed)
    if (name == null || gender == null || dob == null || role == null || email == null ||
        password == null || location == null || contact == null ||
        name.isEmpty() || gender.isEmpty() || dob.isEmpty() || role.isEmpty() ||
        email.isEmpty() || password.isEmpty() || location.isEmpty() || contact.isEmpty()) {
        message = "All fields are required.";
    } else {
        // Database connection parameters
        String DB_URL = "jdbc:mysql://localhost:3306/smartcity"; // Replace with your DB URL
        String DB_USER = "root"; // Replace with your DB username
        String DB_PASSWORD = "root"; // Replace with your DB password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL insert statement
            String sql = "INSERT INTO user_register (name, gender, dob, role, email, password, location, contact, active) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, gender);
            pstmt.setDate(3, java.sql.Date.valueOf(dob)); // Assuming dob is in 'yyyy-MM-dd' format
            pstmt.setString(4, role);
            pstmt.setString(5, email);
            pstmt.setString(6, password); // Remember to hash passwords in production
            pstmt.setString(7, location);
            pstmt.setString(8, contact);
            pstmt.setBoolean(9, true); // Assuming new users are active by default

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                success = true;
                // Redirect to emphome.jsp on successful registration
                response.sendRedirect("emphome.jsp");
                return; // Stop further processing
            } else {
                message = "Registration failed. Please try again.";
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            // Handle unique constraints (e.g., duplicate email or contact)
            if (e.getMessage().contains("Duplicate entry")) {
                if (e.getMessage().contains("email")) {
                    message = "This email is already registered.";
                } else if (e.getMessage().contains("contact")) {
                    message = "This contact number is already registered.";
                } else {
                    message = "Duplicate entry found.";
                }
            } else {
                message = "Database error: " + e.getMessage();
            }
        } catch (Exception e) {
            // Handle other exceptions
            message = "An error occurred: " + e.getMessage();
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }

    // Set the message in the request scope
    request.setAttribute("message", message);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Result</title>
    <%@ include file="navbar.jsp" %>
    <style>
        body {
            background-color: #1A2226;
            color: #ECF0F5;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 100px;
        }
        .message-box {
            display: inline-block;
            padding: 20px;
            border: 2px solid #0DB8DE;
            border-radius: 10px;
            background-color: #0e0e0ee9;
        }
        .success {
            color: #27EF9F;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .error {
            color: #FF6B6B;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0DB8DE;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .home-link:hover {
            background-color: #27EF9F;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <% if (!success) { %>
            <div class="error"><%= message %></div>
            <a href="empreg.jsp" class="home-link">Back to Registration</a>
        <% } %>
    </div>
</body>
</html>
