<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.event"%>
<%@page import="model.location"%>
<%@page import="model.registration"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book an Event</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    </head>
    <style>
        td input{
            display:block;
        }
        .jumbotron{
            background-color: white;
        }
        .errmsg{
            background: green;
            padding: 10px;
            width: 50%;
            color: white;
            font-weight: bold;
        }
        .error{   
            color:red;
        }

    </style>
    <script>
    $(function(){
        var dtToday = new Date();
     
        var month = dtToday.getMonth() + 1;
        var day = dtToday.getDate();
        var year = dtToday.getFullYear();
        if(month < 10)
            month = '0' + month.toString();
        if(day < 10)
         day = '0' + day.toString();
        var maxDate = year + '-' + month + '-' + day;
        $('#inputdate').attr('min', maxDate);
    });




        //            jQuery.validator.addMethod( name, method [, message ] )
//            
// value---> "current value of the validated element".
//elememt---> " element to be validated ".

        jQuery.validator.addMethod("checkemail", function (value, element) {
            return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
        });
        jQuery(document).ready(function ($) {
            $("#bookevent").validate({
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        checkemail: true
                    },
                    pno: {
                        required: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    address: {
                        required: true
                    },
                    edate: {
                        required: true,
                    }
                },
                messages: {
                    name: {
                        required: "Please enter the name."
                    },
                    email: {
                        required: "Please enter the email.",
                        email: "Please enter valid email id"
                    },
                    pno: {
                        required: "Please enter the number.",
                        minlength: "Please enter the  10 digit number .",
                        maxlength: "more than 10 digits."
                    },
                    address: {
                        required: "Please select party hall .",
                    },
                    edate: {
                        required: "Please select the date.",
                    }
                }
            });
        });
    </script>
    <body>
        <%@include file="Header.jsp"%>
    <center>
        <% if (request.getAttribute("status") != null) {%>
        <h1 class="errmsg"> <%= request.getAttribute("status")%></h1>
        <%}%>
        <br>
        <% if (session.getAttribute("uname") != null) {
                registration reg = new registration(session);
                event s = reg.getEventFormInfo(request.getParameter("event_id"));
                ArrayList<location> mydata = reg.getlocinfo();
				Iterator<location> itr = mydata.iterator();%>
        <font color="blue" size="5"><br>
        <h2> Book an Event</h2>
        </font>
        <form action='register' method='POST' id="bookevent">
            <div class="container ">
                <div class="jumbotron">
                    <div class="form-group col-md-4">
                        <label >Name</label>
                        <input type="text" class="form-control"  name="name" value="<%=session.getAttribute("uname")%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Phone Number</label>
                        <input type="number" class="form-control"  name="pno" value="<%=session.getAttribute("phone")%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Email</label>
                        <input type="email" class="form-control"  name="email" value="<%=session.getAttribute("email")%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label >Select Party_Hall</label>
                        <select id="qtn" name="address" class="form-control" >
                        <option value="">Select Party Hall</option>
                        <% while (itr.hasNext()) {
							location l = itr.next();
						%>
                        <option value="<%=l.getLoc_id()%>"><%=l.getPhname() %></option>
               			<%} %>
                      </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Event Name</label>
                        <input type="text" class="form-control"  name="ename" value="<%=s.getEvent_name()%>" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Event cost</label>
                        <input type="number" class="form-control"  name="ecost" value="<%=s.getEvent_cost()%>" readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label >Date of Event</label>
                        <input type="date" class="form-control"  name="edate" value="" id="inputdate">
                    </div>
                    <input type="hidden" name="event_id" value="<%=request.getParameter("event_id")%>"> 
                    <button type="submit" class="btn btn-primary" name="bookevent1">Book Now</button>
                </div>
            </div>
        </form>
        <%}%> 
    </center>

</body>
</html>
