<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <style>
    body {
      background-image: url(/static/newyork.jpg);
      background-repeat: no-repeat;
      background-size: cover;
    }

    .navbar {
      background-color: #333;
      padding: 10px;
    }

    .back-button {
      background-color: #333;
      color: white;
      border: none;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      border: 2px double;
      padding: 8px;
      text-align: center;
      background-color: transparent;
      color: aliceblue;
    }

    th {
      background-color: #333;
    }
  </style>
</head>
<body>

<div class="navbar">
  <button class="back-button" onclick="goBack()">Back</button>
</div>

<h3 class="text-center text-light pt-3">View All Bookings</h3>

<div class="container p-4 text-light">
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>ADHAAR</th>
        <th>AGE</th>
        <th>PEOPLE</th>
        <th>DATE OF BIRTH</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${emphoteldaata}" var="emp">
        <tr>
          <td><c:out value="${emp.id}" /></td>
          <td><c:out value="${emp.name}" /></td>
          <td><c:out value="${emp.adhaar}" /></td>
          <td><c:out value="${emp.age}" /></td>
          <td><c:out value="${emp.noofpeople}" /></td>
          <td><c:out value="${emp.dateofbirth}" /></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<script>
  function goBack() {
    window.history.back();
  }
</script>

</body>
</html>