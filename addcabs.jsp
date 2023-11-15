<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add cab details</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style1.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
<a class="navbar-brand" href="admin_home.jsp">CabBooking-Admin</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
data-target="#navbarSupportedContent"
aria-controls="navbarSupportedContent" aria-expanded="false"
aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
<li class="nav-item">
<a class="nav-link" href="admin_home.jsp">Home</a></li>

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
<%@page import="java.sql.*"%>

<div align="center" class="container">
<form action="addcabs" method="post">
<div class="row">
<div class="col-25">
<label for="drivername" style="padding-right: 33px">Driver Name:</label>
</div>
<div class="col-75">
<input type="text" id="drivername" name="drivername" required><br></div>
</div>
<div class="row">
<div class="col-25">
<label for="phone" style="padding-right: 78px;">Phone: </label></div>
<div class="col-75">
<input type="text" id="phone" name="phone" required><br></div>
</div>
<div class="row">
<div class="col-25">
<label for="vehicle" style="padding-right: 73px;">vehicle:</label></div>
<div class="col-75">
<input type="text" id="vehicle" name="vehicle" required><br></div>
</div>
<div class="row">
<div class="col-25">
<label for="vehicletype" style="padding-right: 38px">Vehicle type:</label></div>
<div class="col-75">
<input type="text" id="vehicletype" name="vehicletype" required><br></div>
</div>
<div class="row">

<div class="col-25">
<label for="seat" style="padding-right: 92px;">Seat:</label></div>
<div class="col-75">
<input type="text" id="seat" name="seat" required><br></div>
</div>
<div class="row">
<div class="col-25">
<label for="address">Vehicle Address:</label></div>
<div class="col-75">
<input type="text" id="address" name="address" required><br></div>
</div>
<div class="row">
<div class="col-25">
<label for="fee" style="padding-right: 100px">Fee:</label></div>
<div class="col-75">
<input type="text" id="fee" name="fee" required></div>
</div>
<button type="submit" value="add">Add</button>
</form>

</div>

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