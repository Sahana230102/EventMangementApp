<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.user"%>
<%@page import="model.registration"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
         
         <style>
        td input{
            display:block;
        }
        body{
        font-family: Serif;
        background: url("edit1.jpg");
        background-size: cover;
        }
        
        
       .form-control{
       width:300px;
       paddiing;10px 10px;
       margin:8px 0;
       display:inline-block;
       border:1px solode red;
       border-radius:4px;
       box-sizing:border-box;
       background-color:white;
       color:black;
       font-size: .9em;
     }
     .form-group{
     font-size:20px;
     font-weigth:bold;
     font-color:black;
    }
      .btn{
           
           }
           .btn:hover{
          
           border:2px solid white;
           color:rgb(125, 249, 255);	
           box-shadow: 0 0 5px rgb(125, 249, 255),
    					0 0 25px rgb(125, 249, 255),
    					0 0 50px rgb(125, 249, 255),
    					0 0 100px rgb(125, 249, 255);
           }
        .edit{
        margin-top: 70px;
        }
    </style>
     </head>
    
    <body>
    <%@include file="Header.jsp"%>
    <% if (session.getAttribute("uname") != null) {
                registration reg = new registration(session);
                user s = reg.getInfo();%>
    <center>

        <font color="#A4DDED" size="5"><br>
        <h2 class="edit"> Edit Profile</h2>
        </font>
        
        <form action='register' method='POST'>
            <div class="container ">
                
                    <div class="form-group col-md-4">
                        <label label style="color:Azure;" >Name</label>
                        <input type="text" class="form-control"  name="name" value="<%=s.getName()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label label style="color:Azure;">Phone Number</label>
                        <input type="number" class="form-control"  name="pno" value="<%=s.getPhone()%>">
                    </div>
                    <div class="form-group col-md-4">
                        <label label style="color:Azure;">Email</label>
                        <input type="email" class="form-control"  name="email" value="<%=s.getEmail()%>">
                    </div>
                    <button style="color:white; border:1px solid white; border-radius:50px;" type="submit" class="btn"  name="submit" value="submit">Update</button>
               <div style="text-align: center;">
                </div>
            
        </form>
        <%}%> 
    </center>
<%-- <%@include file="footer.jsp"%> --%>
</body>
</html>