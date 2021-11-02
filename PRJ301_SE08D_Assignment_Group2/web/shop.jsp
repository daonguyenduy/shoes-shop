<%-- 
    Document   : shop
    Created on : Jul 2, 2021, 8:19:41 PM
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
        <title>Shoplist A Ecommerce Category Flat Bootstrap Responsive  Website Template | Product :: w3layouts</title>
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
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- //the jScrollPane script -->
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
        <!--product start here-->
        <div class="product">
            <div class="container">
                <div class="product-main">
                    <div class=" product-menu-bar">
                        <div class="col-md-3 prdt-right">
                            <div class="w_sidebar">
                                <section  class="sky-form">
                                    <h1>Categories</h1>
                                    <div class="row1 scroll-pane" style="border-style: outset">
                                        <div class="col col-4">
                                            <a <c:if test="${param.categoryID==c.categoryID}">style="text-decoration: underline;font-weight: bold; color: green"</c:if> href="MainController?action=shop"> All</a><br/>
                                            <c:forEach items="${requestScope.LIST_CATEGORY}" var="c">
                                                <a <c:if test="${param.categoryID==c.categoryID}">style="text-decoration: underline;font-weight: bold;color: green"</c:if> href="MainController?action=category&&categoryID=${c.categoryID}" >${c.categoryName}</a><br/>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </section>

                            </div>
                        </div>
                    </div>	
                    <div class="col-md-9 product-block">

                        <c:forEach items="${requestScope.LIST_PRODUCT}" var="list">

                            <div class="col-md-4 home-grid">
                                <div class="home-product-main">
                                    <div class="home-product-top">
                                        <a href="MainController?action=detail&&productID=${list.productID}"><img src="images/${list.image}" alt="" class="img-responsive zoom-img"></a>
                                    </div>
                                    <div class="home-product-bottom">
                                        <h3><a href="single.jsp">${list.productName}</a></h3>
                                        <ul class="bann-btns">                       
                                            <li style="display: block;margin-left: -40px"><a href="AddToCartController?productID=${list.productID}" class="item_add">Add To Cart</a></li>
                                        </ul>					
                                    </div>
                                    <div class="srch">
                                        <span>${list.price}</span>
                                    </div>
                                </div>
                            </div>                                   
                        </c:forEach>                        
                        <div class="clearfix"> </div>
                        <div style="text-align: center">
                        <c:if test="${requestScope.CATEGORYID ==null}"> 
                                            <c:forEach begin="1" end="${requestScope.endP}" var="i">
                                                <a class="page-link" <c:if test="${param.index==i}">style="text-decoration: underline;font-weight: bold"</c:if> href="ShopController?index=${i}">${i}</a>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.CATEGORYID !=null}"> 
                                            <c:forEach begin="1" end="${requestScope.endP}" var="i">
                                                <a class="page-link" <c:if test="${param.index==i}">style="text-decoration: underline;font-weight: bold"</c:if> href="MainController?action=category&index=${i}&&categoryID=${requestScope.CATEGORYID}">${i}</a>
                                            </c:forEach>
                                        </c:if>
                                                </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!--product end here-->
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
