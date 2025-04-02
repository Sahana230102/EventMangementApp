<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <title>Reset Page</title>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width">
       <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
   </head>
   <body >
       <%@include file="Header2.jsp"%>
       <script type="text/javascript">
<% if (request.getAttribute("status") != null) {%>
  alert("<%= request.getAttribute("status")%>");
<%}%></script>
       <script>
           jQuery.validator.addMethod("checkemail", function(value, element) {
               return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
           }, "Please enter the email format as abc@gmail.com");

           jQuery(document).ready(function($) {
               $("#reset").validate({
                   rules: {
                       email: {
                           required: true,
                           checkemail: true
                       },
                       pw: {
                           required: true,
                           minlength: 6
                       },
                       cpw: {
                           required: true,
                           minlength: 6,
                           equalTo: "#pw"
                       },
                   },
                   messages: {
                       email: {
                           required: "Please enter the email.",
                       },
                       pw: {
                           required: "Please enter the password.",
                           minlength: "Please enter the password greater than or equal to 6.",
                       },
                   }
               });
           });



       </script>
       <style>
           .error{
               color:red;
           }
/*            .button{
               padding: 5px;
               width: 6%;
               background: cornflowerblue;
               color: white;
           }*/

           #msg
           {
               background: green;
               color:black;
               border: 1px solid green;
               width:24%;
               font-weight: bold;
               font-size: 25px;
               padding: 5px;
           }
/*            td input{
               display:block;
           }*/
           .btn{
           border:1px solid white;
           border-radius:20px;
           color:white;
           }
           .btn:hover{
           border:2px solid white;
           color:rgb(125, 249, 255);	
           box-shadow: 0 0 5px rgb(125, 249, 255),
    					0 0 25px rgb(125, 249, 255),
    					0 0 50px rgb(125, 249, 255),
    					0 0 100px rgb(125, 249, 255);
           }
           .reset{
     	   margin-top: 80px;
           text-align: center;
           }
           .move{
           padding-left: 20pc;
           }
           body{
           font-family: Serif;
           background: url("Reset_Image.jpg");
           background-size: cover;
           }
       </style>
	 <div class="move">
   <div class="container">
       <br>
	<center>
       <form method="POST" id="reset" action="register">
            <font color="#A4DDED" size="4">
           <h2 class="reset">Reset Password</h2>
           </font>
          
          
		
           <div class="container ">
           <center>
               <div class="form-group col-md-4">
                   <label style="color:Azure;" >Email address</label>
                   <input type="email" class="form-control" placeholder="Enter email"  name="email">
               </div>
               <div class="form-group col-md-4">
                   <label style="color:Azure;">Old Password</label>
                   <input type="password" class="form-control" id="pw" placeholder="Old  Password" name="opw">
               </div>
               <div class="form-group col-md-4">
                   <label style="color:Azure;">New Password</label>
                   <input type="password" class="form-control"  placeholder="Enter New Password" name="npw">
               </div>
               <br>
               <button  type="submit" class="btn"  name="reset">Submit</button></span>
               <div style="text-align: center;">
                  <!-- <a href="login.jsp">Login</a> -->
               </div>
               
           </div>
       </form>
       </center>
	</div>
   </div>

   <%-- <%@include file="footer.jsp"%> --%>
</body>
</html>
