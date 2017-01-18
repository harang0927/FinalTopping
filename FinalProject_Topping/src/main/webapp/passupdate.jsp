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
        <title>Pass Update</title>

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

        <!-- passupdate.css -->
         <link rel="stylesheet" href="css/passupdate.css">
         
         <link rel="stylesheet" href="css/loginform.css">
        <!-- Template Javascript Files
        ================================================== -->
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
        
        <link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css"  />
		<script src="js/bootstrap-select.min.js" ></script>
        <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
        <script type="text/javascript">
    	
        //마우스 hover
        $(function(){
            $('#passChangeBtn').hover(function(){
               $(this).css('background-color','#02bace'); 
            }, function(){
            	$(this).css('background-color','#414141'); 
            });
         });

          function passcheck() {
        	var f=document.passwordupdateForm;
      		if(f.password.value!=f.passwordconfirm.value){
      			alert("The password does not match.");	
      			return false;
      		}
	      	document.passwordupdateForm.submit();
	      	}
        </script>
   
    </head>
    <body>
        <!--
        ==================================================
        Header Section Start
        ================================================== -->
        <!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->

		<%@include file="header_before_login.jsp" %> 

        
        <!--
        ==================================================
        Slider Section Start
        ================================================== -->
        <section id="hero-area-passchange" >
            <div class="container">
                
                <!-- password update -->
	            <div id="passchange">
		            <div>
				       <div class="card card-container">
				       <div id="passchange-Form">
				            <h2>${sessionScope.mvo.nickName}</h2>
				            <p style="text-align:center">Please enter your new password</p>
							<form name="passwordupdateForm" action="member.do" method="post"  onsubmit="return passcheck()">
								<input type="hidden" name="command" value="passupdateMember">
								<input type="hidden" name="email" value="${sessionScope.mvo.email}">
								<input type="password" name="password" class="form-control" placeholder="New Password" required autofocus>
								<input type="password" name="passwordconfirm" class="form-control" placeholder="New Password Again" required>
								<input type="submit" value="Password Edit" class="btn btn-lg btn-primary btn-block btn-signin passsearch-btn" id="passChangeBtn" style="padding:0px; margin-top: 0px; background-color: #9a9a9a;">
							</form>
				       </div>
				       </div><!-- /card-container -->		
					</div>
	            </div>
	            <!-- //password update -->
	            
			</div>
          </section><!--/#main-slider-->
          <!--
            ==================================================
            Footer Section Start
            ================================================== -->
            <%@include file="footer.jsp" %> 
                
        </body>
    </html>