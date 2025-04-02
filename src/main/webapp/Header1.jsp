<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- #009970 -->
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>header</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
    
   *{
    font-family:'Times New Roman', Times, serif;
   }
    .navbar-brand {
    font-weight: 500;
    color: white;
    font-size: 24px;
    overflow: hidden;
    transition: 0.35s color;
}

.navbar {
    margin-top:5px ;
    height: 50px;
    padding: 2px;
}
.navbar.scrolled{
background-color:grey;
    border-radius:20px;
    height: 60px;
    padding: 2px;
}

.login-button {
    color: white;
    font-size: 20px;
    font-weight:500px;
    padding: 8px 20px;
    text-decoration: none;
    border-radius: 50px;
    transition: 0.3s background-color; 
}

.navbar-toggler {
    border: none;
    font-size: 1.5rem;

}

.navbar-toggler:focus,
.btn-close:focus {
    box-shadow: none;
    outline: none;
}

.nav-link {
    color: white;
    font-family:'Times New Roman', Times, serif;
    font-weight: 200;
    position: relative;
    font-size: 20px;
}
.nav-item{
    border-radius: 20px;
    margin: 2px;
}
.nav-link:hover,
.nav-brand:hover,
.nav-link.active {
    color: white;
}


@media(min-width:991px) {
    .nav-link::before {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2.5px;
        background-color: aquamarine;
        visibility: hidden;
        transition: 0.35s ease-in-out;
    }

    .nav-link:hover::before  {
        width: 100%;
        visibility: visible;
    }
}

</style>
    
</head>

<body>
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <!-- NAVBAR -->
    <nav class="navbar navbar-expand-md fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand me-auto" href="register.jsp">Events Hub</a>
            
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="#about">About Us</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="#services">Services</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="#BookaCall">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="registration.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="login.jsp">login</a>
                        </li>
                    </ul>
                </div>
            </div>
            <button class="navbar-toggler pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
            aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        </div>
    </nav>

    <!-- body sec -->
    <!--  <section class="hero_section">
        <div class=" container d-flex align-items-center justify-content-center fs-1 text-white flex-column">
            <h1>welocome all</h1>
        </div>

     </section>
 -->
 <script type="text/javascript">
 window.onscroll = function() {
     var navbar = document.querySelector('.navbar');
     if (window.scrollY > 660) {
       navbar.classList.add('scrolled');
     } else {
       navbar.classList.remove('scrolled');
     }
   };

 </script>

</body>

</html>
