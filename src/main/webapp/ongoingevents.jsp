<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.event"%>
<%@page import="model.registration"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event Status</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style>
.jumbotron{
background-color: white;
}
</style>
</head>
<body>
<%@include file="Header.jsp"%>

<center>
<% if (session.getAttribute("id") != null) {%>
<div class="container ">
<div class="jumbotron">
<table class="table">
<thead>
<tr style="background-color: lightblue;">
<br>
<th>Event Id</th>
<th>Event Name</th>
<th>Date</th>
</tr>
</thead>
<tbody id="table">
<% registration reg = new registration(session);
	ArrayList<event> mydata = reg.getongoingevent();
	Iterator<event> itr = mydata.iterator();
	while (itr.hasNext()) {
		event s = itr.next();
	%>
<tr>
<td><%=s.getEvent_id()%></td>
<td><%=s.getEvent_name()%></td>
<td><%=s.getDate()%></td>
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