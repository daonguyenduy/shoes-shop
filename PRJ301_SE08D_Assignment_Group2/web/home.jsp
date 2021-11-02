<%-- 
    Document   : home
    Created on : Jul 2, 2021, 7:33:18 PM
    Author     : daong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Shoplist A Ecommerce Category Flat Bootstrap Responsive  Website Template | Home :: w3layouts</title>
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

                                        <li>   <a href="MainController?action=shop">Shop </a></li>

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
        <!--banner strat here-->
        <div class="banner">
            <div class="container">
                <div class="banner-main">
                    <c:set value="${requestScope.PRODUCT}" var="p"/>
                    <div class="col-md-6 banner-left">
                        <a href="MainController?action=detail&&productID=${p.productID}"><img src="images/${p.image}" alt="" class="img-responsive"></a>
                    </div>
                    <div class="col-md-6 banner-right simpleCart_shelfItem">

                        <h2>${p.categoryID}</h2>
                        <h1>${p.productName}</h1>
                        <h5 class="item_price">${p.price}</h5>


                        <ul class="bann-btns">                       
                            <li><a href="AddToCartController?productID=${p.productID}" class="item_add">Add To Cart</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--banner end here-->
        <!--block-layer2 start here-->
        <div class="blc-layer2">
            <div class="container">
                <div class="blc-layer2-main">
                    <div class="col-md-6 blc-layer2-left"  style="margin-left: 1000px;margin-top: 100px">
                        <h3 style="color: black">Welcome to our shop</h3>
                        <p style="color: black">Relax and have a good shopping trip today!</p>
                    </div>
                    <div class="col-md-6 blc-layer2-right">

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--block-layer2 end here-->
        <!--block-layer1 start here-->
        <div class="blc-layer3">
            <div class="container">
                <div class="blc-layer3-main">
                    <c:set value="${requestScope.PRODUCT_SHOES}" var="ps"/>

                    <div class="col-md-4 blc-layer3-grids1">
                        <h6>${ps.productName}</h6>
                        <h3>${ps.price}</h3></br>
                        <h6>Description</h6>
                        <ul>
                            <li><h4>${ps.description}</h4>

                            </li>

                        </ul>
                    </div>
                    <div class="col-md-4 blc-layer3-grids2">
                        <a href="MainController?action=detail&&productID=${ps.productID}"><img src="images/${ps.image}" alt=""></a>
                        <ul class="bann-btns">                       
                            <li style="display: block;margin-left: -40px"><a href="AddToCartController?productID=${ps.productID}" class="item_add">Add To Cart</a></li>
                        </ul>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!--block-layer1 end here-->
        <!--home-block start here-->
        <div class="home-block">
            <div class="container">
                <div class="home-block-main">
                    <c:set value="${requestScope.PRODUCT_ACCESSORIES}" var="pa"/>
                    <div class="col-md-3 home-grid ">
                        <div class="home-product-main">
                            <div class="home-product-top">
                                <a href="MainController?action=detail&&productID=${pa.productID}"><img src="images/${pa.image}" alt="" class="img-responsive zoom-img"></a>
                            </div>
                            <div class="home-product-bottom">
                                <h3><a href="MainController?action=detail&&productID=${pa.productID}">${pa.productName}</a></h3>
                                <ul class="bann-btns">                       
                                    <li style="display: block;margin-left: -40px" ><a href="AddToCartController?productID=${pa.productID}" class="item_add">Add To Cart</a></li>
                                </ul>					
                            </div>
                            <div class="srch">
                                <span>${pa.price}</span>
                            </div>
                        </div>
                    </div>

                    <c:set value="${requestScope.PRODUCT_UNIFORM}" var="pu"/>
                    <div class="col-md-3 home-grid" style="margin-left: 52px">
                        <div class="home-product-main">
                            <div class="home-product-top">
                                <a href="MainController?action=detail&&productID=${pu.productID}"><img src="images/${pu.image}" alt="" class="img-responsive zoom-img"></a>
                            </div>
                            <div class="home-product-bottom">
                                <h3><a href="MainController?action=detail&&productID=${pu.productID}">${pu.productName}</a></h3>
                                <ul class="bann-btns">                       
                                    <li style="display: block;margin-left: -40px"><a href="AddToCartController?productID=${pu.productID}" class="item_add">Add To Cart</a></li>
                                </ul>						
                            </div>
                            <div class="srch">
                                <span>${pu.price}</span>
                            </div>
                        </div>
                    </div>
                            <div class="col-md-4 blc-layer3-grids1">
                                <h6>Notes!</h6>
                                <h4 style="font-size: 1.25em;color: #847057;font-family:'Oswald',sans-serif">Are you in need of a sports fashion solution? Don't worry because we understand you. Based on both positive and negative customer reviews, we'll show you the best of each sportswear category. You'll definitely want to take a look at them. Thanks!</h4>
                            </div>
                            
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>

        <!--home block end here-->
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
        <c:if test="${requestScope.CHECK_OUT != null}">
            <script>
            alert('${requestScope.CHECK_OUT}');
            </script>
        </c:if>
        <!--footer end here-->
    </body>
</html>
