
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add driver details</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style1.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">

<a class="navbar-brand" href="index.jsp">CabBooking-Admin</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
data-target="#navbarSupportedContent"
aria-controls="navbarSupportedContent" aria-expanded="false"
aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
<li class="nav-item"><a class="nav-link"

href="admin_home.jsp">Home</a></li>

<li class="nav-item"><a class="nav-link" href="addcabs.jsp">Add

Cabs<span class="badge badge-danger">${cart_list.size()}</span> </a></li>
<li class="nav-item"><a class="nav-link" href="adddrivers.jsp">Add Drivers</a></li>
<li class="nav-item"><a class="nav-link" href="bookedcabs.jsp">Booked Cabs</a></li>

</ul>
</div>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav ml-auto">
<li class="nav-item"><a class="nav-link"

href="adminlogin.jsp">Logout</a></li>

</ul>
</div>
</div>
</nav>
<form action="add_drivers" method="post">
<div class="row" style="display:flex; flex-direction: row; justify-content: center; align-items:
center">

<div class="col-25">

<label for="name" style="padding-right: 80px">Name:</label>
</div>
<div class="col-75">
<input type="text" style="padding:1px 2px 4px;width:20% ; border-color: black"

id="driver" name="name" required><br></div>

</div>
<div class="row" style="display:flex; flex-direction: row; justify-content: center;

align-items: center">
<div class="col-25">

<label for="email" style="padding-right: 80px" >E-mail:</label></div>
<div class="col-75">
<input type="email" id="email" name="email" required></div>
</div>
<div class="row" style="display:flex; flex-direction: row; justify-content: center;

align-items: center">
<div class="col-25">

<label for="password" style="padding-right: 60px">Password:</label></div>
<div class="col-75">
<input type="password" id="password" name="password" required></div>
</div>
<div class="row" style="display:flex; flex-direction: row; justify-content: center;

align-items: center">
<div class="col-25">

<label for="phone" style="padding-right: 80px">Phone:</label></div>
<div class="col-75">
<input type="text"style="padding:1px 2px 4px ;width:20% ; border-color: black"

id="phone" name="phone" required><br></div>

</div>

<button type="submit" style="margin-left:210px"

value="add_drivers">Add</button>
</form>
<script>
var state = document.getElementById("status").value;
if (state == "success"){
swal("Success", "Process Complete", "success");
state = "";
}
else if(state == "failed"){
swal("Failed", "Something went wrong", "error");
state = ""
}

</script>
</body>
</html>