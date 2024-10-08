<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <style>
    .navbar {
      background: linear-gradient(45deg, #516395, #614385 );
    }

    .list-group-item {
      border: 0px;
      background: transparent; /* Set the background of list items to transparent */
      color: aliceblue;
    }

    /* Animated background */
    body {
      background-image: url(/static/newyork.jpg);
      background-repeat: no-repeat;
       background-size: cover;
    }
	
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">RC</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="adminhome.jsp"><i class="fas fa-home"></i> Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="employeenavbar.jsp"><i class="fas fas fa-users"></i>Employee</a>
          </li>
         <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="adminhotel.jsp"><i class="fas fa-hotel"></i>Hotels</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="viewallmess.jsp"><i class="fas fa-hotel"></i>Messages</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="viewallhotels.jsp"><i class="fas fa-hotel"></i>Hotels</a>
          </li>
        
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/"><i class="fas fa-user"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


</body>
</html>
