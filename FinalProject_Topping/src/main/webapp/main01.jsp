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
        <title>Topping main</title>

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
        
        <script type="text/javascript">
    	
        //로그인View
        $(document).ready(function(){
            $("#loginViewBtn").click(function(){
               $(".main-intro-text").slideUp('slow');
               $("#hero-area-blank").slideUp('slow');
               $("#hidden-signin").hide();
               $("#hidden-passsearch").hide();
               $("#hidden-login").fadeIn('slow').css('display','block');
            });
         });
        
      //회원가입View
         $(document).ready(function(){
            $("#signinViewBtn").click(function(){
               $(".main-intro-text").slideUp('slow');
               $("#hero-area-blank").slideUp('slow');
               $("#hidden-login").hide();
               $("#hidden-passsearch").hide();
               $("#hidden-signin").fadeIn('slow').css('display','block');
            });
         });
         
      //비밀번호찾기View
         $(document).ready(function(){
            $("#hidden-login").hide();
            $("#hidden-passsearch").hide();
            $("#hidden-signin").hide();
            $("#passsearchViewBtn").click(function(){
               $("#hidden-login").hide();
               $("#hidden-signin").hide();
               $("#hidden-passsearch").fadeIn('slow');
            });
         });
        
        //마우스 hover
        $(function(){
            $('#loginViewBtn,#signinViewBtn').hover(function(){
               $(this).css('background-color','#02bace'); 
            }, function(){
            	$(this).css('background-color','#414141'); 
            });
         });
        
        $(function(){
            $('#overlapcheckofEmail, #overlapcheckofNickName').hover(function(){
               $(this).css('background-color','#414141'); 
            }, function(){
            	$(this).css('background-color','#9a9a9a'); 
            });
         });
        
        
        //중복확인 function       
        //1. 이메일 중복확인
		$(function(){
			 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			$('#inputRegEmail').keyup(function(){
				if(exptext.test($(this).val())==true){
	        		$.ajax({
	        			type:"POST",
	        			url:"member.do",
	        			data:"command=emailCheck&email="+$(this).val(),
		        		
	        			success:function(data){
	        				if(data.flag == false){
	        					$('#emailCheckResult').html("<font color='blue'>"+$('#inputRegEmail').val()+" is available for subscription.</font>");
	        					$('#emailFlag').val('true');
	        				}else{
	        					$('#emailCheckResult').html("<font color='red'>"+$('#inputRegEmail').val()+" is not available.</font>");
	        					$('#emailFlag').val('false');
	        				}
		       	 		}
	        		});
				}else{
					$('#emailCheckResult').html("<font color='red'>Please keep the email format...</font>");
					$('#emailFlag').val('false');
				}
	        });
		});
        
		$(function(){
			$('#inputRegNickname').keyup(function(){
				if($(this).val().length >=2){
	        		$.ajax({
	        			type:"POST",
	        			url:"member.do",
	        			data:"command=nickNameCheck&nickName="+$(this).val(),
		        		
	        			success:function(data){
	        				if(data.flag == false){
	        					$('#nickNameCheckResult').html("<font color='blue'>"+$('#inputRegNickname').val()+" is available for subscription.</font>");
	        					$('#nickFlag').val('true');
	        				}else{
	        					$('#nickNameCheckResult').html("<font color='red'>"+$('#inputRegNickname').val()+" is not available.</font>");
	        					$('#nickFlag').val('false');
	        				}
		       	 		}
	        		});
				}else{
					$('#nickNameCheckResult').html("<font color='red'>"+$('#inputRegNickname').val()+" is not available.</font>");
					$('#nickFlag').val('false');
				}
	        });
		});
        
        
        //1. totalCheck
	    function checkReg() {
			var f = document.regForm;
			if(f.passwordconfirm.value!=f.password.value){
				alert("The password does not match");
				return false;
			}else if(f.passQuestion.value==""){
				alert("Please enter your question.");
				return false;
			}else if(f.gender.value==""){
				alert("Please enter your gender.");
				return false;
			}else if(f.emailFlag.value=="false"){
				alert("Please check duplicate email.");
				return false;
			}else if(f.nickFlag.value=="false"){
				alert("Please check duplicate nick-name.");
				return false;
			}
		}       
        </script>
   
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
        
        <!-- ==================================================
        Slider Section Start
        ================================================== -->
        <section id="hero-area" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="block wow fadeInUp" data-wow-delay=".3s">
                            <div id="hero-area-blank"></div>
                            <!-- Slider -->
                          	<div class="main-intro-text">
                            <section class="cd-intro">
                                <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                                <span>Topping Your Seoul Tour</span><br>
                                <span class="cd-words-wrapper">
                                    <b class="is-visible">Fun</b>
                                    <b>Easy</b>
                                    <b>Useful</b>
                                </span>
                                </h1>
                            </section> 
                            <!-- cd-intro -->
                            <!-- /.slider -->
                                
	                            <h2 class="wow fadeInUp animated" data-wow-delay=".6s" >
	                                    make your travel plan in korea with us.
	                            </h2>
	                            </div>
	                            <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" id="loginViewBtn">Login</a>
	                            <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" id="signinViewBtn">Sign in</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- main hidden login -->
	            <div id="hidden-login">
	            <div>
			       <div class="card card-container">
			            <form class="form-signin" action="member.do" method="post">
			            <input type="hidden" name="command" value="login">
			                <span id="reauth-email" class="reauth-email"></span>
			                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email address" required autofocus>
			                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
			                <button class="btn btn-lg btn-primary btn-block btn-signin login-btn" type="submit" style="padding:0px; background-color: #02bace;">Login</button>
			            	
			            </form><!-- /form -->
			            <a class="searchlink"><button id="passsearchViewBtn" class="btn btn-lg btn-primary btn-block btn-signin passsearch-btn" style="padding:0px; margin-top: 0px; background-color: #9a9a9a;">Password search</button></a>
			        </div><!-- /card-container -->			
					</div>
	            </div>
	            <!-- //main hidden login -->
	            
	            <!-- main hidden signin -->
	            <div id="hidden-signin">
	            	<div>
	            	<div class="card card-container">
			            <form class="form-signin" name="regForm" action="member.do" method="post" onsubmit="return checkReg()">
			            <input type="hidden" name="command" value="register">
			                <span id="reauth-email" class="reauth-email"></span>
			               
			                <input type="email" id="inputRegEmail" name="email" class="form-control" placeholder="Email" style="height: 40px; text-size: 15px; margin-bottom: 5px" required="required" autofocus>
			                <label id="emailCheckResult"></label>
			                <input type="hidden" id="emailFlag" name="emailFlag" value="">
			                
			                <input type="text" id="inputRegNickname" name="nickName" class="form-control" placeholder="NickName" style="height: 40px; text-size: 15px; margin-bottom:5px" required="required" autofocus>
			                <label id="nickNameCheckResult"></label>
			                <input type="hidden" id="nickFlag" name="nickFlag" value="" >
			                
			                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" style="height: 40px; text-size: 15px; margin-bottom: 5px" required="required" autofocus>
			                <input type="password" id="inputPasswordConfirm" name="passwordconfirm" class="form-control" placeholder="Password Re-enter" style="height: 40px; text-size: 15px; margin-bottom: 5px" required="required" autofocus>
			                
			               <select id="QuestionSelect" name="passQuestion" class="form-control" style="height: 40px; margin-bottom: 5px" required autofocus>
			               	  <option value="">Select Question For Password Search</option>
							  <option value="South Korea's most want to go?">South Korea's most want to go?</option>
							  <option value="South Korea's most want to eat?">South Korea's most want to eat?</option>
							  <option value="South Korea's most want to get?">South Korea's most want to get?</option>
							</select>
							<input type="text" id="inputAnswer" name="passAnswer" class="form-control" placeholder="Answer for Password Search" style="height: 40px; text-size: 15px; margin-bottom: 5px" required="required" autofocus>
							
							<div class="radio" style="color:#414141; margin-top: 15px;">
								<span style="margin-left: 0px; padding-left: 0px; margin-right: 30px; color: #414141"><b>Gender Select</b></span>
					            <span style="margin-right: 30px">
					            <label>
					                <input type="radio" name="gender" value="male">
					                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
					                Male
					            </label>
					            </span>
					            
					            <span>
					            <label>
					                <input type="radio" name="gender" value="female">
					                <span class="cr"><i class="cr-icon fa fa-circle"></i></span>
					                Female
					            </label>
					            </span>
					        </div>
			                
			                <button class="btn btn-lg btn-primary btn-block btn-signin login-btn" type="submit" style="padding:0px; background-color: #02bace; ">Sign Up</button>			            	
			            </form><!-- /form -->		            
			        </div><!-- /card-container -->	
					</div>
				</div>
	            <!-- //main hidden signin -->
         
	            <!-- main hidden passsearch -->
	            <div id="hidden-passsearch">
	            	<div> 
	            	<div class="card card-container">
			            <form class="form-passsearch" name="passSearchForm" id="psf" action="member.do" method="post">
			            <input type="hidden" name="command" value="passsearchMember">
			                <span id="reauth-email" class="reauth-email"></span>
			               
			                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" style="height: 40px; text-size: 15px; margin-bottom: 5px" required autofocus>

			                <select id="QuestionSelect" name="passQuestion" class="form-control" style="height: 40px; margin-bottom: 5px" required autofocus>
			               	  <option value="">Select Question For Password Search</option>
							  <option value="South Korea's most want to go?">South Korea's most want to go?</option>
							  <option value="South Korea's most want to eat?">South Korea's most want to eat?</option>
							  <option value="South Korea's most want to get?">South Korea's most want to get?</option>
							</select>
							<input type="text" id="inputAnswer" name="passAnswer" class="form-control" placeholder="Answer for Password Search" style="height: 40px; text-size: 15px; margin-bottom: 5px" required autofocus>
                
			                <button class="btn btn-lg btn-primary btn-block btn-signin login-btn" type="submit" style="padding:0px; background-color: #02bace;" id="passSearchCheck">Search Password</button>
			            	
			            </form><!-- /form -->
			            
			        </div><!-- /card-container -->	
					</div>
				</div>
	            <!-- //main hidden passupdate -->
            
            </section><!--/#main-slider-->
            <!--
            ==================================================
            Footer Section Start
            ================================================== -->
            <%@include file="footer.jsp" %> 
                
        </body>
    </html>