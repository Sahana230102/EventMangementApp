<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <title>Forgot Page</title>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width">
       <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
   </head>
   <body >
       <%@include file="Header2.jsp"%>
       <script>
           jQuery.validator.addMethod("checkemail", function(value, element) {
               return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
           }, "Please enter the email format as abc@gmail.com");

           jQuery(document).ready(function($) {
               $("#forgot").validate({
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
           .move{
           padding-right: 25pc;
           }
           .forgot{
           margin-top:80px;
           }
           body{
           font-family: Serif;
           background: url("forgot_image.jpg");
           background-size: cover;
           }
       </style>

   <center>

      <script type="text/javascript">
<% if (request.getAttribute("status") != null) {%>
  alert("<%= request.getAttribute("status")%>");
<%}%></script>
       <br>
       <div class="move">

       <form method="POST" id="forgot" action="register">
           <font color="#A4DDED" size="4">
           <h2 class="forgot">Forgot Password</h2>
           </font>
           
           <div class="container ">
               <div class="form-group col-md-4">
                   <label style="color:Azure;" >Email address</label>
                   <input type="email" class="form-control" placeholder="Enter email"  name="email">
               </div>
               <div class="form-group col-md-4">
               
               <label style="color:Azure;" name="question">Question</label><br>
               <select name="question" class="form-control">
               <option value="first_pet">First pet name</option>
               <option value="first_school">First school name</option>
  			   <option value="fav_dish">Favorite dish</option>
  				<option value="destination">Favorite destination</option>
               </select>
               </div>
               <div class="form-group col-md-4">
                   <label style="color:Azure;">Answer</label>
                   <input type="text" class="form-control" placeholder="Enter Answer" name="answer">
               </div>
               <div class="form-group col-md-4">
                   <label style="color:Azure;">Password</label>
                   <input type="password" class="form-control" id="pw" placeholder="Enter new Password" name="pw">
               </div>
               <div class="form-group col-md-4">
                   <label style="color:Azure;">Confirm Password</label>
                   <input type="password" class="form-control"  placeholder="Re Enter new Password" name="cpw">
               </div>
               
               <br>
               <button  type="submit" class="btn"  name="forgotPass">Submit</button></span>
               <div style="text-align: center;">
                  <!-- <a href="login.jsp">Login</a> -->
               </div>
           </div>
       </form>
	</div>
   </center>

   <%-- <%@include file="footer.jsp"%> --%>
</body>
</html>
