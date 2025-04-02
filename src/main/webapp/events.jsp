<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.event"%>
<%@page import="model.registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
        <title>JSP Page</title>
        <style>
            .container1{
                margin-top: 100px;
                width: 100%;
                padding-left: 100px;
            }
            .container{
                max-width: 1300px;
                margin:auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            /*              body{
                            font-family: 'Poppins', sans-serif;
                            background-color: white;
                        }*/
            /*             .header{
                            background: radial-gradient(#fff,#ffd2d2);
                            background-color: whitesmoke;
                        }*/
            .col-md-7{
                /*                color:#555;*/

            }
            .row{
                display: flex;
                align-items:center;
                flex-wrap: wrap;
                justify-content:space-around;
            }
            .price{
                color:#FE980F;
                font-size:26px;
                font-weight:bold;
                padding-top: 20px;
            }
            /*            .cart{
                            background: #FE980F;
                            color:#FFFFFF;
                            font-size: 15px;
                            margin-left:20px;
                        }*/
            .but{
                display: inline-block;
                background: #ff523b;
                color: #fff;
                padding: 8px 30px;
                margin: 30px 0;
                border-radius: 30px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
    <%@include file="Header.jsp"%>
        <div class="header">

            <div class="container">
                
                <%
                    registration r = new registration(session);
                    ArrayList<event> al = r.get_eventinfo(request.getParameter("event_category"));
                    Iterator<event> it = al.iterator();
                    while (it.hasNext()) {
                        event s = it.next();%>
                    <div class="container1">
                        <div class="row"> 
                            <div class="col-md-5">
                                <img  src="<%=s.getEvent_img()%>"  class="d-block w-100">
                            </div>
                            <div class="col-md-7">
                                <h2><%=s.getEvent_name()%></h2>
                                <p class="price" >&#8377 <%=s.getEvent_cost()%></p>
                                <p><%=s.getEvent_details()%></p>

                                <% if (session.getAttribute("uname") != null) {%>
                                 <a href="eventbooking.jsp?event_id=<%=s.getEvent_id()%>" class="but">Book Now</a>
                                <% } else {
                                    session.setAttribute("logoutredirect", "events.jsp?event_category=" + request.getParameter("event_category"));
                                %>
                                <a href="login.jsp" class="but">Book Now</a>
                                <% } %>

                            </div>

                        </div>
                    </div>
                <% }%>



            </div>
        </div>
        <br><br><br>
    </body>
</html>
