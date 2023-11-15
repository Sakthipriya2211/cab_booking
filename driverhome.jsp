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
<%@page import="java.sql.*" %>

<title>Driver home</title>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
<a class="navbar-brand" href="index.jsp">CabBooking-Driver</a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
data-target="#navbarSupportedContent"
aria-controls="navbarSupportedContent" aria-expanded="false"
aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
<li class="nav-item"><a class="nav-link"

href="driverhome.jsp">Home</a></li>
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
ResultSet rs = st.executeQuery("select * from booked_cab;");
%>
<table border=1 align=center style="text-align: center;margin-top:40px" id="table1">
<thead>
<tr>
<th>Id</th>
<th>CustomerName</th>
<th>CustomerPhone</th>
<th>CustomerAddress</th>
<th>DriverName</th>
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

<%}%>
</tbody>
</table>
<br>

</body>
</html>