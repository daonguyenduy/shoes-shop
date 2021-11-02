<%-- 
    Document   : login
    Created on : Jul 4, 2021, 7:40:27 PM
    Author     : daong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shoplist A Ecommerce Category Flat Bootstrap Responsive  Website Template | Login :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoplist Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Hind:400,500,300,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<script src="js/simpleCart.min.js"> </script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<!--header strat here-->
 <div class="header">
            <div class="container">
                <div class="header-main">
                    <div class="top-nav">
                        <div class="content white">
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <div class="navbar-brand logo">
                                      <img src="images/logo1.png" alt=""></a>
                                    </div>
                                </div>
                                <!--/.navbar-header-->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li><a href="MainController">Home</a></li>
                                        <li><a href="MainController?action=shop">Shop</a></li>
                                    </ul>
                                </div>
                                <!--/.navbar-collapse-->
                            </nav>
                            <!--/.navbar-->
                        </div>
                    </div>
                    <div class="header-right">
                        <div class="search">
                            <div class="search-text">
                                <form action="MainController" method="POST">
                                    <input class="serch" type="text" name="Search" value="" style="margin-left: -200px"/>
                                    <input type="submit" name="action" value="search" >
                                </form>
                            </div>

                                        
                            <div class="clearfix"> </div>					
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
<!--header end here-->
<!--log in start here-->
<div class="login">
	<div class="container">
		<div class="login-main">
			  <h1>Login</h1>
		  <div class="col-md-6 login-left">
			<h2>Existing User</h2>
			<form action="MainController" method="post" >
                            <input type="text" placeholder="Username" name="txtUser" value="">
				<input type="password" placeholder="Password" name="txtPassword" value="">
				<input type="submit" name="action" value="Login">
			</form>
		  </div>
		  <div class="col-md-6 login-right">
		  	 <h3>New User? Create an Account</h3>
		  	 <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system. and expound the actual teachings of the great.</p>
		     <a href="signup.jsp" class="login-btn">Create an Account </a>
		  </div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--log in end here-->
<!--footer strat here-->
<div class="footer">
            <div class="container">
                <div class="footer-main">	
                    <div class="ftr-grids-block">
                        <div class="col-md-3 footer-grid">		
                            <h3 class="a">Address</h3>
                            <h5 class="a">Block CT1 Sky9 Building</h5>
                        </div>
                        <div class="col-md-3 footer-grid">		
                            <h3 class="a">Contact Us</h3>
                            <h5 class="a">Phone: 0987706895</h5>
                            <h5 class="a">Email: thailvse140xxx@fpt.edu.vn</h5>
                        </div>
                            <div class="col-md-3 footer-grid">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.0888180767242!2d106.78902031534753!3d10.804509261627816!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527d8d00bace5%3A0x10e70e4afa1d2c40!2sSKY%209!5e0!3m2!1svi!2s!4v1625150079807!5m2!1svi!2s" width="600" height="150" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="copy-rights">
                        <p>© 2021 Group 2's Shop. All Rights Reserved | Design by Group 2 </p>
                    </div>
                </div>
            </div>
        </div>
<!--footer end here-->
</body>
</html>
