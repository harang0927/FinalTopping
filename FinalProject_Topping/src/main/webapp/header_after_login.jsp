<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" type="image/png" href="images/favicon.png">
        <title>Topping</title>

        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="css/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="css/main.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        
         <link rel="stylesheet" href="css/loginform.css">
        
        <!-- Template Javascript Files
        ================================================== -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- owl carouserl js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- bootstrap js -->
		
        <script src="js/bootstrap.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- slider js -->
        <script src="js/slider.js"></script>
        <script src="js/jquery.fancybox.js"></script>
        <!-- template main js -->
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
        
        <script type="text/javascript">
        function logout() {
    		var f=confirm("Are you sure you want to sign out?");
    		if(f)
    			location.href="member.do?command=logout";
    	}
        </script>
   
    </head>
    <body>
         <!--
        ==================================================
        Header Section Start
        ================================================== -->
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand" style="padding-top: 0; position:absolute; top:0; left:100">
                        <a href="main02.jsp" >
                            <img src="images/logo.png" alt="">
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="activity.do?command=getActivityList" >ACTIVITY</a></li>
                            <li><a href="destination.jsp">PLACE</a></li>
                            <li><a href="checkList.do?command=getListOfTopping">TOURLIST</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">COMMUNITY <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="tip.do?command=getTipBoardList">TIP BOARD</a></li>
                                        <li><a href="freeboard.do?command=getFreeBoardList">FREE BOARD</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">HOW?<span class="caret"></span></a>
                            	<div class="dropdown-menu">
                                    <ul>
                                        <li><a href="notice.do?command=getNoticeList&&page=1">NOTICE</a></li>
                                        <li><a href="write_qna.jsp">QnA</a></li>
										<c:if test="${sessionScope.mvo.checkAdmin==2}">
											<li><a href="qna.do?command=qnaAdminList&&page=1">QnA-Answer</a></li>
										</c:if>
                                    </ul>
                               </div>
                            </li>
                            <!-- <li><a href="#"><img src="images/bell.jpg"></a></li> -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.mvo.nickName}<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                    	<li><a onclick="window.open('MyPage.jsp?email=${sessionScope.mvo.email}','MyPage', 'width=760, height=620, menubar=no, location=no, status=no, fullscreen=no, toolbar=no, top=0')" target="_blank" style="cursor: pointer;">MyPage</a></li>
                                        <li><a href="javascript:logout()">Logout</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>
     
        </body>
    </html>