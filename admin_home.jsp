<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
if (session.getAttribute("name") == null) {
response.sendRedirect("adminlogin.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%@page import="java.sql.*"%>
<title>Admin Home</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
<a class="navbar-brand" href="login.jsp">CabBooking-Admin</a>
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
<input type="hidden" id="status" value=<%= request.getAttribute("status") %>>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con =

DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "1234");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from cabs;");
%>
<table border=1 align=center style="text-align: center;margin-top:40px" id="tables">
<thead>
<tr>
<th>Id</th>
<th>Driver Name</th>
<th>Phone</th>
<th>Vehicle</th>
<th>Vehicle_Type</th>
<th>Seat</th>
<th>Vehicle Address</th>
<th>Fee</th>

<th>Deletion</th>
</tr>
</thead>
<tbody>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><button class="btnSelect">Delete</button></td>
</tr>
<%}%>
</tbody>
</table>
<br>
<%
} catch (Exception e) {
out.print(e.getMessage());
%><br>
<%
}

%>

<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "1234");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select id, uname, emailid from drivers");
%>

<table border=1 align=center style="text-align: center;margin-top:40px" id="drivertables">
<thead>
<tr>
<th>Id</th>
<th>Driver Name</th>
<th>Email</th>
<th>Delete User</th>
</tr>
</thead>
<tbody>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>

<td><button class="driverBtn">Delete</button></td>
</tr>
<%}%>
</tbody>
</table>
<br>
<%
} catch (Exception e) {
out.print(e.getMessage());
%><br>
<%
}
%>
<script>
$(document).ready(function(){
// code to read selected table row cell data (values).
$("#tables").on('click','.btnSelect',function(){
// get the current row
var currentRow=$(this).closest("tr");

var id=currentRow.find("td:eq(0)").text();
//need to get fully qualified names!!
$.post("delete_vehicle",{"id":id}, function(data){
alert.data;
})
});
$("#drivertables").on('click','.driverBtn',function(){
// get the current row

var currentRow=$(this).closest("tr");
console.log(state);
var id=currentRow.find("td:eq(0)").text();
//need to get fully qualified names!!
$.post("delete_driver",{"id":id}, function(data){
alert.data;
})
});
});

$(document).ready(function(){
    // Function to handle emergency button click
    $(".nav-item-emergency").on('click', function(){
        alert('Emergency button pressed! Your booking will be prioritized.');
        
        // You can include additional logic here to prioritize the booking.
        // For example, make an AJAX call to the server to mark this booking as high priority.
        // You would replace this with your actual AJAX call and logic.
        // $.post("markEmergencyBooking", {"bookingId": yourBookingId}, function(data) {
        //    // Handle the response from the server if needed
        // });
    });

    // Function to handle alert button click and notify admin
    $(".nav-item-alert").on('click', function(){
        // Alert the user about the alert button press
        alert('Alert button pressed! Notifying admin.');

        // Use sweetalert to show a nicer alert
        swal("Alert", "Emergency alert triggered! Notifying admin.", "info");

        // Send an AJAX request to notify the admin
        $.post("notify_admin", {"message": "Emergency alert triggered!"}, function(data) {
            // Handle the response from the server if needed
            console.log("Admin notified: " + data);
        });
    });

    // Rest of your code...

    $("#table").on('click','.btnSelect',function(){
        // Rest of your code for the "Book Now" button click
        // ...
    });
});

</script>
</body>
</html>