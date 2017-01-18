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
        <title>Timer Agency Template</title>
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
       <!--  <link rel="stylesheet" href="css/ionicons.min.css"> -->
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="css/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <!-- <link rel="stylesheet" href="css/jquery.fancybox.css"> -->
        <!-- template main css file -->
        <link rel="stylesheet" href="css/main.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        
		<!-- login form css
         <link rel="stylesheet" href="css/loginform.css"> -->
        <!-- main02 css -->
        <link rel="stylesheet" href="css/main02.css">
        
        <!-- BootScript -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
        <!-- main02 js -->
        <script type="text/javascript" src="js/main02.js"></script>
        
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        <script type="text/javascript">
        $(document).ready(function(){
        	$("#page-top").click(function() {
                $('html, body').animate({scrollTop : 0}, 'slow');
            });
        });        
        </script>
		
		<style type="text/css">
			A:hover {text-decoration: none}
			A{text-decoration: none;}
			A:visited {color:ffffff}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Topping</title>
		</head>
		<body>
		
		<!--
        ==================================================
        Header Section Start
        ================================================== -->
        <!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
		<c:choose>
			<c:when test="${sessionScope.mvo==null}">
				<%@include file="header_before_login.jsp" %> 
			</c:when>
			<c:otherwise>
				<%@include file="header_after_login.jsp" %> 
			</c:otherwise>
		</c:choose>	
        
        
        
        
        
        
        
        
		<!--
        ==================================================
        Content Section Start
        ================================================== -->
        <!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
        <section id="contact-section">
            <div class="container" style="margin-top: 60px;">
			<!-- 요기부터 내용 넣어주심됩니다. -->
			
			
			<!-- 요기까지 넣어주세용 -->
            </div>
        </section>
        
       
            
            
            
            
            
            
            
            
            
            
            <!-- ==================================================
            Scroll Top
            ================================================== -->
            <div id="page-top">
            	<span><img src="./images/top_1.png"></span>
            </div>
            
           <!-- ==================================================
            Footer Section Start
            ================================================== -->
            <%@include file="footer.jsp" %> 
            
</body>
</html>