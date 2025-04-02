<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
    
        ul {
            list-style-type: none;
            /*width:100%;*/
            margin: 0;
            padding: 10px;
            overflow: hidden;
            background-color: #125459;
        }

        li {
            float: right;
        }
        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #111;
            color: white;
        }
        .uname{
            margin-top: 0px;
            color: white;
            margin-right: 10px;
        }
        .name{
        	float: left;
        	display: block;
            color: white;
            text-align: center;
            font-size:25px;
            padding: 8px 6px ; 
        }
    </style>
    <body style="margin: 0;">
        <ul>
            <% if (session.getAttribute("uname") != null) {%>
			<li class="name">Event Management</li>
            <li class="uname"><a href="Edit.jsp"><i class="fa fa-user-circle" aria-hidden="true" style="margin-right: 5px;"></i><%=session.getAttribute("uname")%></a></li>
            <li><a href="register?logout=yes">Logout</a></li>
            <!-- <li><a href="Edit.jsp">Edit</a></li> -->
                <% if (session.getAttribute("id").equals("10")) {%>
                <li><a href="schedule.jsp">Schedule call</a></li>
            <li><a href="adminevehis.jsp">Event History</a></li>
            <li><a href="requestedevents.jsp">Requested Events</a></li>
            <li><a href="adddelloc.jsp">Add/Delete Location</a></li>
            <li><a href="adddeleteevent.jsp">Add/Delete Event</a></li>
            
			            
            <%} else {%>
            <li><a href="EventHistory.jsp">Event History</a></li>
                <%}%>
                <%} else {%>
            <li><a href="registration.jsp">Register</a></li>
            <li><a href="login.jsp">Login</a></li>
                <%}%>
            <li><a class="active" href="index.jsp">Home</a></li>
            <!-- <li style="float:left"><img src="images/maillogo.jpg"></li> -->
        </ul>
    </body>
</html>
