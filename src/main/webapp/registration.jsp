<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>Registration Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <title>Register Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <script>
                //jQuery.validator.addMethod( name, method [, message ] )         
                // value---> "current value of the validated element".
                //elememt---> " element to be validated ".
                jQuery.validator.addMethod("checkemail", function (value, element) {
                    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
                });
                jQuery(document).ready(function ($) {
                    $("#register").validate({
                        //ignore: [],
                        rules: {
                            name: {
                                required: true
                            },
                            email: {
                                required: true,
                                checkemail: true
                            },
                            phone: {
                                required: true,
                                minlength: 10,
                                maxlength: 10
                            },
                            pw: {
                                required: true,
                                minlength: 6
                            },
                            cp: {
                                required: true,
                                minlength: 6,
                                equalTo: "#pw"
                            },
                            question{
                            	required:true,
                            },
                            answer{
                            	required:true,
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
                            phone: {
                                required: "Please enter the number.",
                                minlength: "Please enter the  10 digit number .",
                                maxlength: "more than 10 digits."
                            },
                            pw: {
                                required: "Please enter the password.",
                                minlength: "Please enter the password greater than or equal to  6.",
                            },
                            cp: {
                                required: "Please reenter the password.",
                                minlength: "Please enter the password greater than or equal to 6.",
                                equalTo: "mismatch password"
                            }
                            question{
                            	required:"Select one question",
                            },
                            answer{
                            	required:"Answer the question",
                            }
                        }
                    });
                });
            </script>
    <style>   
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

*{
    margin-top: 0;
    padding:0;
    box-sizing: border-box;
    font-family:'Times New Roman', Times, serif;
}
section{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width: 100%;
    background-image:url(https://images.unsplash.com/photo-1653821355226-6def361cc7ab?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGV2ZW50JTIwbWFuYWdlbWVudHxlbnwwfHwwfHx8MA%3D%3D) ;
    background-size: cover;
    background-position: center;
}
p{
color:white;}
.login-box{
    scroll-behavior: smooth;
    color: white;
    position: relative;
    width: 400px;
/*    height: ;
 */    border: 1px solid rgba(255, 255, 255, .5);
    background: transparent;
    border-radius: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    backdrop-filter: blur(15px);
    margin: 5px;
    padding: 20px;
}
.h2{
    font-size: 2em;
    color: #fff;
    text-align: center;
}
.input-box{
    width: 200px;
    margin: 20px;
    position: relative;
    border-bottom: 1px solid #fff;
}
.input-box label{
    position: absolute;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    font-size: 1em;
    color: #fff;
    pointer-events: none;
}
.input-box input{
    width: 100%;
    height: 40px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    color: #fff;
    padding: 0 35px 0 5px;
}
.input-box input:focus~label,
.input-box input:valid~label{
    top: -5px;

}
.input-box .icon{
    position: absolute;
    right: 8px;
    color: #fff;
    font-size: 1.2em;
    line-height: 57px;

}
.remember-forgot{
    font-size: .9em;
    color: #ffffff;
    display: block;
    justify-content: space-between;
}

.remember-forgot a{
    color: #ffffff;
    text-decoration: none;
}
.remember-forgot a:hover{
    text-decoration: underline;
    color: blue;
}
select{
    color: white;
    border: none;
    background: transparent;
    backdrop-filter: blur(15px);
}

.button{
    width: 80%;
    height: 30px ;
    background: #fff;
    border: 1px;
    border-radius: 50px;
    font-size: 1em;
    margin: 20px;
    color: #3c0ee0;
    font-weight: 500;
}
.button:hover{
    border: 1px solid blue;
}
.register-link{
    font-size: .9em;
    color: blue;
    text-align: center;
    }
.register-link p a{
    color: white;
    text-decoration: none;
    font-weight: 600;

}
.register-link p a:hover{
    text-decoration: underline;
}

option{
    color: black;
}
@media(max-widh:360px){
    .login-box{
        width: 100%;
        height: 100vh;
        border: none;
        border-radius: 0;
    }
}
#msg {
    color: red;
    width: 24%;
    font-weight: bold;
    font-size: 25px;
    padding: 5px;
                }
</style>
</head>

<body class="body">
<script type="text/javascript">
<% if (request.getAttribute("status") != null) {%>
  alert("<%= request.getAttribute("status")%>");
<%}%></script>
   <%@include file="Header2.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <section >
        <div class="login-box">
            <form action="register" method="POST" id="register">
                <h2 class="h2">REGISTRATION</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-circle-outline"></ion-icon>
                    </span>
                    <input type="text" id="name" name="name" required>
                    <label>Name</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-open-outline"></ion-icon>
                    </span>
                    <input type="email" name="email" required>
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-open-outline"></ion-icon>
                    </span>
                    <input type="number" name="phone" required>
                    <label>Phone no</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" name="pw" id="pw" required>
                    <label>Password</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" name="cp" required>
                    <label>Confirm Password</label>
                </div>
                <div class="input-box">
                    <select id="qtn" name="question" class="col-lg-10" >
                        <option value="first_pet">First pet name</option>
               			<option value="first_school">First school name</option>
  			   			<option value="fav_dish">Favorite dish</option>
  						<option value="destination">Favorite destination</option>
                      </select>
                </div>
                <div class="input-box">
                    <input type="text" name="answer" required value="">
                    <label>Answer</label>
                </div>
                <button class="button" name="register" type="submit">Register</button>
                <div class="register-link">
                    <p>Already have an account?
                        <a href="login.jsp">Login</a>
                    </p>
                </div>
            </form>
        </div>
    </section>
    <%-- <%@include file="footer.jsp" %> --%>
</body>

</html>
