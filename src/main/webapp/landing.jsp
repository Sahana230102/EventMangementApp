<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.registration"%>
<%@page import="model.event"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management</title>

    <link rel="stylesheet" href="thome.css">

    <!-- Bootstrap Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Bootstrap Link -->


    <!-- Font Awesome Cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- Font Awesome Cdn -->


    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <!-- Google Fonts -->
    <style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
    list-style: none;
    scroll-behavior: smooth;
    font-family: 'Lato', sans-serif;
}


/* Home Section Start */
.home{
    width: 100%;
    height: 90vh;
    background-image: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.2)), url(https://png.pngtree.com/background/20220720/original/pngtree-blue-dream-starry-sky-theme-is-arranged-at-the-wedding-site-picture-image_1684520.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}
.home .content{
    text-align: center;
    padding-top: 200px;
}
.home .content h5{
    color: white;
    font-size: 38px;
    font-weight: 550;
    text-shadow: 0px 1px 1px black;
}
.home .content h1{
    color: white;
    font-size: 70px;
    font-weight: 550;
    text-shadow: 0px 1px 1px black;
    margin-top: 5px;
}
.changecontent::after{
    content: ' ';
    color: #ffa500;
    text-shadow: 0px 1px 1px black;
    animation: changetext 10s infinite linear;
}
@keyframes changetext{
    0%{content: "Wedding";}
    10%{content: "party";}
    20%{content: "night out";}
    30%{content: "clubing";}
    40%{content: "India wedding";}
    50%{content: "Birthday celebration";}
    60%{content: "First cry";}
    70%{content: "Sportevent";}
    80%{content: "school decrotation";}
    90%{content: "DJ NIGHTS";}
    100%{content: "Dinner party";}
} 
.home .content p{
    color: white;
    font-size: 15px;
    font-weight: 600;
    text-shadow: 0px 1px 1px black;
    margin-bottom: 30px;
    margin-top: 5px;
}
.home .content a{
    padding: 10px;
    background: white;
    color: black;
    letter-spacing: 2px;
    font-weight: 550;
    border-radius: 5px;
    text-decoration: none;
    transition: 0.5s;
}
.home .content a:hover{
    background: rgb(5, 104, 203);
    color: white;
    border-radius: 50px;
}
@media (max-width:850px){
    .home{
        background-position: 50%;
    }
}
@media (max-width:450px){
    .home .content h5{
        font-size: 25px;
    }
    .home .content h1{
        font-size: 38px;
    }
    .home .content p{
        font-size: 13px;
    }
}
/* Home Section End */

/* Section Book Start */
.book{
    background: #f9f9f9;
    padding: 50px;
}
.main-text h1{
    text-align: center;
    text-shadow: 0px 1px 1px black;
    font-weight: 600;
}
.main-text h1 span{
    color: #0cb4d5;
}
.book .card{
    border-radius: 10px;
    box-shadow: 0px 5px 5px -6px black;
}
.book .row{
    margin-top: 30px;
}
.book form input{
    padding: 10px;
    color: black;
    border: none;
    outline: none;
    font-size: 15px;
    border-radius: 10px;
    box-shadow: 0px 5px 5px -6px black;
}
.book form textarea{
    border: none;
    border-radius: 10px;
    resize: none;
    box-shadow: 0px 5px 5px -6px black;
    height: 200px;
}
.book .submit{
    width: 160px;
    font-size: 16px;
    font-weight: 550;
    background: #ffa500;
    color: white;
    margin-top: 10px;
    transition: 0.5s;
}
.book .submit:hover{
    width: 170px;
}
@media (max-width:765px){
    .book{
        padding: 0;
    }
    .main-text h1{
        padding: 20px;
    }
}
/* Section Book End */





/* Section Packages Start */
.main-txt h1{
    text-align: center;
    margin-top: 30px;
    font-weight: 600;
    text-shadow: 0px 1px 1px black;
}
.main-txt h1 span{
    color: #ffa500;
}
.packages .card{
    border-radius: 5px;
    border: none;
    box-shadow: rgba(0,0,0,0.1) 0px 4px 12px;
}
.packages .card img{
    border-radius: 5px;
}
.packages .card .card-body{
    background: transparent;
}
.packages .card .card-body h3{
    font-size: 25px;
    font-weight: 600;
}
.packages .card .card-body p{
    font-size: 15px;
}
.checked{
    color: #ffa500;
}
.star i{
    font-size: 15px;
}
.packages .card .card-body h6{
    font-size: 20px;
}
.packages .card .card-body a{
    padding: 10px;
    text-decoration: none;
    background: #ffa500;
    color: white;
    border-radius: 5px;
}
/* Section Packages End */




/* Section Services Start */
.services{
    background: #f9f9f9;
    margin-top: 50px;
}
.services .card{
    box-shadow: rgba(0,0,0,0.1) 0px 4px 12px;
    border: none;
    cursor: pointer;
}
.services .card i{
    font-size: 80px;
    text-align: center;
    color: #ffa500;
    margin-top: 20px;
}
.services .card .card-body h3{
    font-weight: 600;
}
.services .card .card-body{
    text-align: center;
}
/* Section Services End */





/* Section Gallary Start */
.gallary{
    margin-top: 50px;
}
.gallary .card{
    border-radius: 10px;
    box-shadow: rgba(0,0,0,0.1) 0px 4px 12px;
    cursor: pointer;
}
.gallary .card img{
    border-radius: 10px;
    transition: 0.5s;
}
.gallary .card img:hover{
    transform: scale(1.1);
        border-radius: 40px;
    
}
/* Section Gallary End */




/* About Start */
.about{
    padding: 50px;
    margin-top: 50px;
    background: #f9f9f9;
}
.about .card{
    border-radius: 10px;
}
.about .card img{
    border-radius: 10px;
}
.about h2{
    font-weight: 600;
    letter-spacing: 1px;
}
.about p{
    font-weight: 500;
}
#about-btn{
    width: 150px;
    height: 38px;
    border: none;
    border-radius: 5px;
    background: #ffa500;
    color: white;
    letter-spacing: 2px;
    font-weight: 550;
    transition: 0.5s ease;
    cursor: pointer;
}
#about-btn:hover{
    width: 170px;
}
@media (max-width:765px){
    .about{
        padding: 0;
    }
}
/* About End */


.navigation-bar{
color:black}
    
    </style>
</head>
<body>
<%@include file="Header1.jsp"%>
<script type="text/javascript">
<% if (request.getAttribute("status") != null) {%>
  alert("<%= request.getAttribute("status")%>");
<%}%></script>
    <!-- Home Section Start -->
    <div class="home">
        <div class="content">
            <h5>Welcome </h5>
            <h5>we engage with   <span class="changecontent"></span></h5>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quae, nisi.</p>
            <a href="registration.jsp">Book event</a>
        </div>
    </div>
    <!-- Home Section End -->



    <!-- Section Packages Start -->
    <section class="packages" id="packages">
      <div class="container">
        
        <div class="main-txt">
          <h1><span>P</span>ackages</h1>
        </div>

        <div class="row" style="margin-top: 30px;">

          <!-- <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://i.pinimg.com/originals/a9/da/67/a9da672561bd0d5142f944d7244d7379.jpg" alt="wedding">
              <div class="card-body">
                <h3>Wedding Ceremony</h3>
                <p>“Two hearts, one promise—forever.” A succinct wedding ceremony encapsulating love, commitment, and lifelong union. 💕🎩👰</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$500</strong></h6>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://th.bing.com/th/id/OIP.copdJ0KaU2PCTdyA0uPwOwHaFt?rs=1&pid=ImgDetMain" alt="birthday">
              <div class="card-body">
                <h3>Birthday Party</h3>
                <p>Balloons, laughter, and cake—celebrating another year of joy.” 🎈🎂🎉</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$300</strong></h6>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://e0.pxfuel.com/wallpapers/595/55/desktop-wallpaper-night-club-club-party.jpg" alt="nightout">
              <div class="card-body">
                <h3>Night Party</h3>
                <p>Under moonlit skies, laughter danced, music swirled, and memories sparkled.” 🌙🎉✨</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$400</strong></h6>
              </div>
            </div>

          </div>



        </div>



        <div class="row" style="margin-top: 30px;">

          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://i.pinimg.com/736x/96/ab/26/96ab260db14978b40c6f02cffc43067b--sports-day-december-.jpg" alt="">
              <div class="card-body">
                <h3>Sport event</h3>
                <p>Under stadium lights, adrenaline surged, victories celebrated—the arena echoed with passion.” 🏟️🔥🏆</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$100</strong></h6>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://i.pinimg.com/originals/51/94/17/519417eecb138d2e3f0439d615ebc796.png" alt="sport">
              <div class="card-body">
                <h3>India Wedding</h3>
                <p>Amid sacred chants, the couple exchanges vows, encircling the holy fire—their union blessed by gods.” 🕉️🔥💍</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$1500</strong></h6>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <img src="https://th.bing.com/th/id/OIP.PqH11WnyQbbB9jKpe9dKbAAAAA?rs=1&pid=ImgDetMain" alt="birthday">
              <div class="card-body">
                <h3>First Cry</h3>
                <p>When a newborn takes their first breath and announces their arrival into the world. 🌟👶</p>
                <div class="star">
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star checked"></i>
                  <i class="fa-solid fa-star "></i>
                  <i class="fa-solid fa-star "></i>
                </div>
                <h6>Price: <strong>$200</strong></h6>
              </div>
            </div>

          </div> -->
          <% registration s1 = new registration(session);
          	ArrayList<event> ar = s1.getEventList();
          	Iterator<event> itr = ar.iterator();
          	int rating=0;
          	while (itr.hasNext()) {
          		event s = itr.next();
          		rating=Integer.parseInt(s.getRating());%>
          		<div class="col-md-4 py-3 py-md-0">
				
            <div class="card">
              <img src="<%=s.getEvent_img()%>">
              <div class="card-body">
                <h3><%=s.getEvent_name()%></h3>
                <p><%=s.getEvent_details()%></p>
                <div class="star">
                  <i class="fa-solid fa-star <%if (rating>0){ %>checked<%}%>"></i>
                  <i class="fa-solid fa-star <%if (rating>1){ %>checked<%}%>"></i>
                  <i class="fa-solid fa-star <%if (rating>2){ %>checked<%}%>"></i>
                  <i class="fa-solid fa-star <%if (rating>3){ %>checked<%}%>"></i>
                  <i class="fa-solid fa-star <%if (rating>4){ %>checked<%}%>"></i>
                </div>
                <h6>Price: <strong><%=s.getEvent_cost()%></strong></h6>
                <a href="events.jsp?event_category=<%=s.getEvent_category()%>">Book Now</a>
              </div>
            </div>

          </div>
          <%}%>



        </div>


      </div>
    </section>
    <!-- Section Packages End -->

    <!-- Section Services Start -->
    <section class="services" id="services">
      <div class="container">

        <div class="main-txt">
          <h1><span>S</span>ervices</h1>
        </div>

        <div class="row" style="margin-top: 30px;">

          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <i class="fas fa-hotel"></i>
              <div class="card-body">
                <h3>Affordable Hotel</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. A, eaque.</p>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <i class="fas fa-utensils"></i>
              <div class="card-body">
                <h3>Food & Drinks</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. A, eaque.</p>
              </div>
            </div>

          </div>
          <div class="col-md-4 py-3 py-md-0">

            <div class="card">
              <i class="fas fa-bullhorn"></i>
              <div class="card-body">
                <h3>Safety Guide</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. A, eaque.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Section Services End -->

    <!-- Section Gallary Start -->
    <section class="gallary" id="gallary">
      <div class="container">

        <div class="main-txt">
          <h1><span>G</span>allery</h1>
        </div>

        <div class="row" style="margin-top: 30px;">
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://i.ytimg.com/vi/Fjd2bUMbrc0/maxresdefault.jpg" alt="" height="230px">
            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://i.pinimg.com/736x/ff/46/7f/ff467f0b45612a978cbba9b95338b76a--gold-wedding-centerpieces-white-centerpiece.jpg" alt="" height="230px">
            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://www.specialevents.com/sites/specialevents.com/files/styles/article_featured_retina/public/Exquisite_Events_Beach_Anniversary_11_2.jpg?itok=Lz4MtQJA" alt="" height="230px">
            </div>
          </div>
        </div>


        <div class="row" style="margin-top: 30px;">
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://th.bing.com/th/id/OIP.k4ahqOxaWGZt1F-hSiR5UgHaE5?rs=1&pid=ImgDetMain" alt="" height="230px">
            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://th.bing.com/th/id/OIP.SnUe_epvaFe73hK7c4mKPAAAAA?w=236&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="" height="230px">
            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0">
            <div class="card">
              <img src="https://www.craftandsparkle.com/wp-content/uploads/2021/02/Summer-tablescape-ideas-4-scaled.jpg" alt="" height="230px">
            </div>
          </div>
        </div>

      </div>
    </section>
    <!-- Section Gallary End -->

    <!-- About Start -->
    <section class="about" id="about">
      <div class="container">

        <div class="main-txt">
          <h1>About <span>Us</span></h1>
        </div>

        <div class="row" style="margin-top: 50px;">

          <div class="col-md-6 py-3 py-md-0">
            <div class="card">
              <img src="https://th.bing.com/th/id/OIP.8ZB4IR0o6SEYBsImHpkvlwHaEK?rs=1&pid=ImgDetMain" alt="about us ">
            </div>
          </div>

          <div class="col-md-6 py-3 py-md-0">
            <h2>How Event Managment Agency Work</h2>
            <p>Event Horizon, our event management company, thrives on turning dreams into reality. Founded by passionate enthusiasts, we blend creativity, precision, and seamless execution. From weddings to corporate conferences, we tailor each event, collaborate closely with clients, and infuse innovation. Our diverse team orchestrates magic behind the scenes. Join us—where imagination meets execution</p>            
            <button id="about-btn">Read More...</button>
          </div>

        </div>

      </div>
    </section>
    <!-- About End -->    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<section id="BookaCall" class="gallary" >
		<div class="main-txt">
          <h1>Book <span>a</span> Call</h1>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 section-intro text-center" data-aos="fade-up">
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                        suffered<br>
                        alteration in some form, by injected humour, or randomised words which don't look even slightly
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 mx-auto" data-aos="fade-up">
                    <form action="register" class="row g-4" method="post">
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Full name" name="name">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="email" class="form-control" placeholder="Email address" name="email">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="number" class="form-control" placeholder="phone number" name="phno">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Subject" name="subject">
                        </div>
                        <div class="form-group col-md-12">
                            <textarea cols="30" rows="3" class="form-control" placeholder="Message" name="message"></textarea>
                        </div>
                        <div class="text-center">
                            <button id="about-btn" type="submit" name="contactme">Book Call</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <br>
</body>
</html>

