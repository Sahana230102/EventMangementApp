<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.client"%>
<%@page import="model.registration"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event Status</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style>
body{
	background-size: cover;
    background-position: center;
    background-image:url("https://images.unsplash.com/photo-1471967183320-ee018f6e114a?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZXZlbnR8ZW58MHx8MHx8fDA%3D");
}
.jumbotron{
    background: transparent;
    backdrop-filter: blur(15px);
	padding:5px;
	margin:25px;
	border-radius:20px;
	border:8px solid #00008B;
}
.btn{
border-radius:20px}
.btn:hover{
border-radius:10px}
td{
color: white;}
th{
font-weight: 60000;
color: white;}
</style>
</head>
<body>
<%@include file="Header.jsp"%>

<center>
<script type="text/javascript">
<% if (request.getAttribute("status") != null) {%>
  alert("<%= request.getAttribute("status")%>");
<%}%></script>
<% if (session.getAttribute("id") != null) {%>
<div class="container ">
<div class="jumbotron">
<table class="table">
<thead>
<tr>
<br>
<th><h3>Name</h3></th>
<th><h3>Email</h3></th>
<th><h3>phone</h3></th>
<th><h3>subject</h3></th>
<th><h3>Message</h3></th>
</tr>
</thead>
<tbody id="table">
<% registration reg = new registration(session);
	ArrayList<client> mydata = reg.requested_call();
	Iterator<client> itr = mydata.iterator();
	while (itr.hasNext()) {
		client s = itr.next();
	%>
<tr>
<td><%=s.getName()%></td>
<td><%=s.getEmail()%></td>
<td><%=s.getPhone()%></td>
<td><%=s.getSubject()%></td>
<td><%=s.getMessage()%></td>						
</tr>
<%}%>
</tbody>
</table>
</div>
</div>
<%}%>
</center>

</body>
</html>