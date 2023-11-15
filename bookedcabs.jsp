<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booked cabs</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%@page import="java.sql.*" %>
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
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "1234");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM booked_cab");
%>
<table border=1 align=center style="text-align: center;margin-top:40px" id="table1">
<thead>
<tr>
<th>Id</th>
<th>DriverName</th>
<th>CustomerName</th>
<th>CustomerPhone</th>
<th>CustomerAddress</th>
</tr>
</thead>
<tbody>
<%
while (rs.next()) {
    boolean isEmergencyBooking = false;  // Assume all bookings are regular
    String category = rs.getString("category");
    if (category != null && category.equals("medical")) {
        isEmergencyBooking = true;
    }
%>
<tr class="<%= isEmergencyBooking ? "emergency-booking" : "" %>">
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(4)%></td>
    <td><%=rs.getString(5)%></td>
</tr>
<%}%>
</tbody>
</table>

<!-- Example usage in bookingConfirmation.jsp -->
<style>
    .emergency-booking {
        background-color: red;
        color: white;
    }
</style>

</body>
</html>
