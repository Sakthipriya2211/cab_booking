<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
if (session.getAttribute("name") == null) {
response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@page import="java.sql.*"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Home</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
/* Style for emergency button */
.nav-item-emergency {
      padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border: none;
            outline: none;
             background-color: #FF0000;
            color: white;
            }

/* Style for alert button */
.nav-item-alert {
     font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border: none;
            outline: none;
             background-color: #FFA500;
            color: white;
            }
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
<a class="navbar-brand" href="index.jsp">CabBooking-User</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
data-target="#navbarSupportedContent"
aria-controls="navbarSupportedContent" aria-expanded="false"
aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
<li class="nav-item"><a class="nav-link"

href="home.jsp">Home</a></li>

<li class="nav-item"><a class="nav-link"

href="bookcab.jsp">Details</a></li>
<li class="nav-item-emergency"><a class="nav-link"

href="emergency.jsp">Emergency</a></li>
<li class="nav-item-alert"><a class="nav-link"

href="SosServlet.java">Alert</a></li>
</ul>
</div>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav ml-auto">
<li class="nav-item"><a class="nav-link"

href="login.jsp">Logout</a></li>

</ul>

</div>
</div>
</nav>
<div align="right" style="margin-right: 50px;">
<h6>
Logged User:<%=session.getAttribute("name")%></h6>

</div>
<input type="hidden" id="name" value="<%= session.getAttribute("name") != null ? session.getAttribute("name").toString() : "" %>">

<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con =

DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "1234");

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from cabs;");
%>
<table border=1 align=center style="text-align: center" id="table">
<thead>
<tr>
<th>Id</th>
<th>Driver Name</th>
<th>Phone</th>
<th>Vehicle</th>
<th>Vehicle_Type</th>
<th>Seat</th>
<th>Vehicle Address</th>
<th>Fee(Per KM)</th>
<th>Click here to book</th>

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
<td><button class="btnSelect">Book Now</button></td>
</tr>
<%}%>
</tbody>
</table>
<br>
<input type="hidden" id="dummy" value="kavipriya">
<%
} catch (Exception e) {
out.print(e.getMessage());

%><br>
<%
}

%>
<!-- Jquery to fetch values-->
<script>
$(document).ready(function(){
// code to read selected table row cell data (values).
$("#table").on('click','.btnSelect',function(){
// get the current row
var currentRow=$(this).closest("tr");

var drivername=currentRow.find("td:eq(1)").text();
//need to get fully qualified names!!
var customername = document.getElementById("name").value;
var data=drivername+"\n"+customername;
$.post("booked_cab",{"drivername":drivername, "customername":customername},
function(data){

alert(data);
})
});
});
</script>
</body>
</html>