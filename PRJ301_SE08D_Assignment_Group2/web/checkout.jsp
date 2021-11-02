<%-- 
    Document   : checkout
    Created on : Jul 3, 2021, 8:41:16 PM
    Author     : daong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shoplist A Ecommerce Category Flat Bootstrap Responsive  Website Template | Checkout :: w3layouts</title>
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
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- //end-smoth-scrolling -->
        <script src="js/simpleCart.min.js"></script>
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

                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <div class="head-signin">
                                    <h5><a href="login.jsp"><i class="hd-dign"></i>Sign in</a></h5>
                                </div>    
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}">

                                <div class="cart box_1">
                                    <a href="checkout.jsp">
                                        <h3>
                                            <img src="images/cart.png" alt=""/>

                                        </h3>
                                    </a>

                                </div>  
                                <a class="nav-link" href="MainController?action=logout" style="font-family: 'Oswald';font-size: small;vertical-align: -webkit-baseline-middle;color: black"> <i class="fas fa-user-alt mr-1 text-gray"></i>Logout</a>
                            </c:if>      
                            <div class="clearfix"> </div>					
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--header end here-->
        <!--start-ckeckout-->

        <div class="ckeckout">
            <div class="container">
                <div class="ckeckout-top">
                    <div class=" cart-items heading">
                        <h1>My Shopping Bag </h1>

                        
                            <div class="in-check" >
                                <ul class="unit" style="padding-left: 40px;text-align: center">
                                    <li><span>Product Image</span></li>
                                    <li><span>Product Name</span></li>		
                                    <li><span>Price</span></li>
                                    <li><span>Quantity</span></li>
                                    <li><span>Total</span></li>
                                    <li><span>Action</span></li>
                                    
                                    <div class="clearfix"> </div>
                                </ul>
                                <c:forEach items="${sessionScope.CART}" var="c">
                                    <form action="UpdateCartController" method="POST">
                                    <input type="hidden" name="productID" value="${c.product.productID}"/>
                                    <ul class="cart-header simpleCart_shelfItem">

                                        <li class="ring-in"><img src="images/${c.product.image}" class="img-responsive" alt="" style="margin-left: 37px;height: 100px"><span></span>
                                        </li>
                                        <li><span style="margin-left: -18px">${c.product.productName}</span></li>
                                        <li><span style="margin-left: -23px"class="item_price">${c.price}</span></li>
                                        <li><span style="margin-left: -63px">  <input class="form-control form-control-sm border-0 shadow-0 p-0" style="text-align: center" type="text" name="quantity" value="${c.quantity}"/>
                                                <font color="red">${requestScope.ERROR}</font></span></li>
                                                <li><span style="margin-left: -115px">${c.price*c.quantity}</span> <c:set var="amount" value="${c.quantity*c.price}"/> </li>	
                                        <li style="top: -47px;width: 11%;position: relative;left: 55px;"><span style="font-family: 'Oswald';font-size: small">
                                        <a href="DeleteCartController?productID=${c.product.productID}" onclick="return confirm('Are you sure delete Item?')">Delete</a>
                                        <input type="submit" value="Update"/>
                                            </span></li>
                                        <div class="clearfix"> </div>
                                    </ul>
                                    <c:set var="total" value="${total+amount}"/>
                                    </form>
                                </c:forEach>
                            </div>
                        
                    </div>  
                    <div class="col-lg-4">
                        <div class="card border-0 rounded-0 p-lg-4 bg-light">
                            <div class="card-body">
                                <h4 class="text-uppercase mb-4">Cart total</h4><br>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex align-items-center justify-content-between"><strong class="text-uppercase small font-weight-bold">Subtotal: </strong><span class="text-muted small">${total}$</span></li>
                                    <li class="border-bottom my-2"></li>
                                    <li class="d-flex align-items-center justify-content-between mb-4"><strong class="text-uppercase small font-weight-bold">Total: </strong><span class="text-muted small">${total}$</span></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                                    <br>
                                    
                    <a href="CheckoutController?userID=${sessionScope.LOGIN_USER.userID}&&total=${total}" class="add-cart cart-check item_add" style="border-radius: 22px;width: 100px;text-align: center;margin-left: 170px">Buy</a>		
                </div>
            </div>
        </div>
        <!--end-ckeckout-->
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
