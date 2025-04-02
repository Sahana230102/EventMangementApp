<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    
    
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

*{
    margin: 0;
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
    background:url('https://i.pinimg.com/originals/e3/66/77/e366771cde0013080e1862653a35b8a8.jpg') no-repeat;
    background-size: cover;
    background-position: center;
}



.login-box{
	color:white;
    position: relative;
    width: 400px;
    margin-top:60px;
    height: 400px;
    border: 2px solid rgba(255, 255, 255, .5);
    background: transparent;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    backdrop-filter: blur(15px);
}
.h1 {
    font-size: 2em;
    color: #fff;
    text-align: center;
}

.input-box{
    width: 310px;
    position: relative;
    margin: 30px 0;
    border-bottom: 2px solid #fff;
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
    height: 50px;
    backdrop-filter: blur(15px);
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

.remeber-forgot{
    margin: -15px 0 15px;
    font-size: .9em;
    color: #ffffff;
    display: flex;
    justify-content: space-between;
}

.remeber-forgot label input{
    margin-right: 3px;
}
.remeber-forgot a{
    color: #ffffff;
    text-decoration: none;
}
.remeber-forgot a:hover{
    text-decoration: underline;
}

.button{
    width: 100%;
    height: 40px ;
    background: #fff;
    border: none;
    outline: none;
    border-radius: 40px;
    font-size: 1em;
    color: #3c0ee0;
    font-weight: 500;
}
.button:hover{
border:1px solid #3c0ee0;
}
.register-link{
    font-size: .9em;
    color: #3c0ee0;
    text-align: center;
    margin: 25px 0 10px;
}
.register-link p a{
    color: #fff;
    text-decoration: none;
    font-weight: 600;

}
.register-link p a:hover{
    text-decoration: underline;
}

@media(max-widh:360px){
    .login-box{
        width: 100%;
        height: 100vh;
        border: none;
        border-radius: 0;
    }
    

}
p{
color: white;
}

    </style>
    
        <title>login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

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
            <form action="register" method="POST" >
                <h1 class="h1">LOGIN</h1>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-open-outline"></ion-icon>
                    </span>
                    <input type="email" name="email" required>
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                    <input type="password" name="pass" required>
                    <label>Password</label>
                </div>
                <div class="remeber-forgot">
                    <a href="forgot.jsp">Forgot Password</a>
                    <a href="reset.jsp">Reset Password</a>
                </div>
                    <input type="hidden" name="loc" value="<%=session.getAttribute("logoutredirect")%>"> 
                <% if (session.getAttribute("logoutredirect") != null) {%>
                <button class="button" type="submit" name="but">LOGIN</button>
                 <% } else {%>
                <button class="button" type="submit" name="login">LOGIN</button>
                <% } %>
                <div class="register-link">
                    <p>Don't have a account?
                        <a href="registration.jsp">Register</a>
                    </p>
                </div>
            </form>
        </div>
    </section>
    
</body>

</html>
