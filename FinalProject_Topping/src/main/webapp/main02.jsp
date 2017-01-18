<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<!-- 20161219 css긁어온것 추가함 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>





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
<!--         login form css
         <link rel="stylesheet" href="css/loginform.css"> -->
        <!-- main02 css -->
        <link rel="stylesheet" href="css/main02.css">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <!-- Template Javascript Files
        
        ================================================== -->
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
        <script type="text/javascript">
        $(document).ready(function(){
        	if('${sessionScope.mvo.email eq null}' == 'true')
        		location.href="main01.jsp";
        	
        	$("#page-top").click(function() {
                $('html, body').animate({scrollTop : 0}, 'slow');
            });

        	/* PopularPlace */
        	$.ajax({
        		type:"POST",
        		url:"place.do",
        		data:"command=getBestPlaceForMain",
        		
        		success:function(data){
        			var list = data.bestPlace;
        			var content = "";
        			for(var i=0;i<list.length;i++){
        				var path="images/portfolio/item-4.jpg";
        				content += "<div class='col-sm-4 col-xs-12'>";
        				content += "<figure class='wow fadeInLeft animated' data-wow-duration='500ms' data-wow-delay='600ms'>";
        				content += "<div class='img-wrapper' style='height:250px'>";
        				if(list[i].placeImgUrl != null)
        					path = list[i].placeImgUrl;
        				content += "<img src='"+path+"' class='img-responsive' alt='' style='width:100%; height:100%'>";
        				content += "<div class='overlay'>";
        				content += "<div class='buttons' style='position:absolute;left:0;right:0;'>";
        				/* content += "<a rel='gallery' class='fancybox' href='images/portfolio/item-4.jpg'>Topping</a>"; */
        				content += "<a target='_blank' href='destination.jsp?placeId="+list[i].placeId+"'>Details</a>";
        				content += "</div>";
        				content += "</div>";
        				content += "</div>";
        				content += "<figcaption>";
        				content +="<div style='height:30px;'>";
        				content += "<span style='float:left;'>";
        				content += "<h4>";
        				content += "<a href='#'>";
        				content += list[i].placeName;
        				content += "</a>";
        				content += "</h4>";
        				content += "</span>";
        				content += "<span id='spantp_"+list[i].placeId+"' style='float:right;'>";
        				
        				$.ajax({
        					type:"POST",
        					url:"place.do",
        					data:"command=checkToppingByPlaceId&placeId="+list[i].placeId,
        					
        					success:function(data){
        						var map = data.resMap;
        						var checkpath = "";
        						if(map.flag == true){
        							checkpath = "images/topping_0.png";
        						}else{
        							checkpath = "images/topping_1.png";
        						}
        						$('#spantp_'+map.placeId).prepend("<img src='"+checkpath+"'>");
        					}
        				});
        				content += list[i].toppingCount;
        				content += "</span>";
        				content +="</div>";
        				content += "<p>";
        				content += list[i].placeDistrict;
        				content += "</p>";
        				content += "</figcaption>";
        				content += "</figure>";
        				content += "</div>";
        			}
        			$('#popularPlace').append(content);
        		}
        	});
        	
        	/* PopularActivty */
        	$.ajax({
        		type:"POST",
        		url:"activity.do",
        		data:"command=getPopularActivity",
        		
        		success:function(data){
        			var list = data.actList;
        			var content = "";
        			for(var i=0;i<list.length;i++){
        				var path="images/activity_default.jpg";
        				content += "<div class='col-sm-4 col-xs-12'>";
        				content += "<figure class='wow fadeInLeft animated' data-wow-duration='500ms' data-wow-delay='600ms'>";
        				content += "<div class='img-wrapper' style='height:250px'>";
        				if(list[i].img != null && list[i].img[0] != null)
        					path = "./activity_upload/"+list[i].img[0].newName;
        				content += "<img src='"+path+"' class='img-responsive' alt='' style='width:100%; height:100%'>";
        				content += "<div class='overlay'>";
        				content += "<div class='buttons' style='position:absolute;left:0;right:0;'>";
        				/* content += "<a rel='gallery' class='fancybox' href='images/portfolio/item-4.jpg'>Topping</a>"; */
        				content += "<a target='_blank' href='activity.do?command=showActivityByNo&activityNo="+list[i].activityNo+"'>Details</a>";
        				content += "</div>";
        				content += "</div>";
        				content += "</div>";
        				content += "<figcaption>";
        				content += "<div style='height:30px;'>";
        				content += "<span style='float:left;'>";
        				content += "<h4>";
        				content += "<a href='#'>";
        				content += list[i].activityTitle;
        				content += "</a>";
        				content += "</h4>";
        				content += "</span>";
        				content += "<span id='spantp_"+list[i].activityNo+"' style='float:right;'>";
        				
        				$.ajax({
        					type:"POST",
        					url:"activity.do",
        					data:"command=checkToppingByNo&actNo="+list[i].activityNo,
        					
        					success:function(data){
        						var map = data.map;
        						var checkpath = "";
        						if(map.flag == true){
        							checkpath = "images/topping_0.png";
        						}else{
        							checkpath = "images/topping_1.png";
        						}
        						$('#spantp_'+map.actNo).prepend("<img src='"+checkpath+"'>");
        					}
        				});
        				content += list[i].toppingCount;
        				content += "</span>";
        				content +="</div>";
        				content += "<div>";
        				content += "<span>";
        				content += list[i].nowAttendance+" / "+list[i].maxAttendance;
        				content += "</span>";
        				content += "<span style='position:absolute;right:15px;'>";
        				content += list[i].startDate+" ~ "+list[i].endDate;
        				content += "</span>";
        				content += "</div>";
        				content += "</figcaption>";
        				content += "</figure>";
        				content += "</div>";
        			}
        			$('#popularActivity').append(content);
        		}
        	});
        
        
        ////////////////////////////////////////////////////////////
        	$.ajax({
        		type:"POST",
        		url:"tip.do",
        		data:"command=getTipBoardListByClipCount",
        		
        		success:function(data){
        			var list = data.tbvo;
        			var content = "";
        			for(var i=0;i<list.length;i++){
        				var path="images/Tip_default.jpg";
        				content += "<div class='col-sm-4 col-xs-12'>";
        				content += "<figure class='wow fadeInLeft animated' data-wow-duration='500ms' data-wow-delay='600ms'>";
        				content += "<div class='img-wrapper' style='height:250px'>";
        				if(list[i].img[0] != null && list[i].img.length != 0)
        					path = "./tip_upload/"+list[i].img[0].newName;
        				content += "<img src='"+path+"' class='img-responsive' alt='' style='width:100%;'>";
        				content += "<div class='overlay'>";
        				content += "<div class='buttons' style='position:absolute;left:0;right:0;'>";
        				/* content += "<a rel='gallery' class='fancybox' href='images/portfolio/item-4.jpg'>Topping</a>"; */
        				content += "<a target='_blank' href='tip.do?command=showTipByNo&tipNo="+list[i].tipNo+"'>Details</a>";
        				content += "</div>";
        				content += "</div>";
        				content += "</div>";
        				content += "<figcaption>";
        				content +="<div style='height:30px;'>";
        				content += "<span style='float:left;'>";
        				content += "<h4>";
        				content += "<a href='#'>";
        				content += list[i].title;
        				content += "</a>";
        				content += "</h4>";
        				content += "</span>";
        				content += "<span id='spantip_"+list[i].tipNo+"' style='float:right;'>";
        				
        				$.ajax({
        					type:"POST",
        					url:"tip.do",
        					data:"command=clipWhetherCheck&tipNo="+list[i].tipNo,
        					
        					success:function(data){
        						var map = data.resMap;
        						var checkpath = "";
        						if(map.status == true){
        							checkpath = "images/clip_0.png";
        						}else{
        							checkpath = "images/clip_1.png";
        						}
        						$('#spantip_'+map.tipNo).prepend("<img src='"+checkpath+"'>");
        					}
        				});
        				content += list[i].clipCount;
        				content += "</span>";
        				content +="</div>";
        				content +="<div>";
        				content += "<span>";
        				content += list[i].type;
        				content += "</span>";
        				content += "<span style='position:absolute;right:20px;'>";
        				content += "writer "+list[i].memberVO.nickName;
        				content += "</span>";
        				content +="</div>";
        				content += "</figcaption>";
        				content += "</figure>";
        				content += "</div>";
        			}
        			$('#popularTip').append(content);
        		}
        	});
        });
        
        
        </script>
      
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>After Login</title>
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
		
		      <!-- 메인슬라이스 -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 80px;">

			<!--페이지-->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<!--  <li data-target="#myCarousel" data-slide-to="3"></li> -->
			</ol>
			<!--페이지-->

			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active">
					<img src="./images/main_banner_1.jpg"
						style="width: 100%" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
							<!-- <h1>Korea History</h1> -->
							<p style="position: absolute; right: 100; bottom: 0">Nightscape of Seoul</p>
						</div>
					</div>
				</div>
				<!--슬라이드1-->

				<!--슬라이드2-->
				<div class="item">
					<img src="./images/main_banner_2.jpg"
						style="width: 100%" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<!-- <h1>Korea Art</h1> -->
							<p style="position: absolute; right: 100; bottom: 0">Cheonggyecheon</p>
						</div>
					</div>
				</div>
				<!--슬라이드2-->

				<!--슬라이드3-->
				<div class="item">
					<img src="./images/main_banner_3.jpg"
						style="width: 100%" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<!-- <h1>Korean Food</h1> -->
							<p style="position: absolute; right: 100; bottom: 0">Winter at a Mountainside Temple</p>
						</div>
					</div>
				</div>
				<!--슬라이드3-->
			</div>

			<!--이전, 다음 버튼-->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
		
		
        <!--
            ==================================================
            Portfolio Section Start
            ================================================== -->
            <section id="works" class="works" style="padding-top: 0">
                <div class="container">
                    <div class="section-heading">
                        <%-- <h1 class="title wow fadeInDown main-title" data-wow-delay=".3s">Korea Tourism Information</h1>
                        <p class="wow fadeInDown" data-wow-delay=".5s">
                            <!-- Picking the right destination for vacation is never easy. It seems almost impossible to choose just one place when there are so many things you want to see and do; <br>experience something traditional, capture a beautiful nature scene, and go on a shopping spree. <br>If this is the case you find yourself stuck in, one of the following destinations just might appeal to you.  -->
                            Welcome!!${sessionScope.mvo.nickName}<br>
                            Korea is full of enjoyable attractions to match the personal tastes of all visitors. Keep reading to find your perfect vacation spot!
                        </p> --%>
                        <!-- 지도 -->
                        <!-- <div class="main-map" style="z-index:999">
                        	  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.957562550006!2d126.9748523147772!3d37.579616979795375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2c74aeddea1%3A0x8b3046532cc715f6!2z6rK967O16raB!5e0!3m2!1sko!2skr!4v1480646367796" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>   -->  
                        
                        

                        
                        
                        
                        
                        
                        
                        
                        
                        
                         
                        
                        <!-- 검색창 -->
                        <!-- <div id="main-search">
                        <div class="col-md-4 col-sm-3 col-xs-1"></div>
                        <div class="col-md-4 col-sm-6 col-xs-10">
						    <div class="input-group">
						      <input type="text" class="form-control" placeholder="Search for...">
						      <span class="input-group-btn">
						        <button class="btn btn-default" type="button">Go!</button>
						      </span>
						    </div>
						 </div>
						 <div class="col-md-4 col-sm-3 col-xs-1"></div>
						 </div> -->
                        <!-- //검색창 -->

                    </div>
                    
                    <!-- 1 -->
					<div class="row" id="popularPlace" style="width: 85%; margin: 0 auto;">
                    	<div class="main-preView">
                    		<p>
                    		<span class="main-preView-title">Popular PLACE</span>&nbsp;&nbsp;&nbsp;
                    		<!-- <span class="main-preView-more"><a href="#">more</a></span> -->
                    		</p>
                    	</div>
                        
					</div>
                        <!-- //1 -->
                        
                        
                        <!-- 2 -->
                        <div class="row" id="popularActivity" style="width: 85%; margin: 0 auto;">
                        <div class="main-preView">
                    		<p>
                    		<span class="main-preView-title">Popular ACTIVITY</span>&nbsp;&nbsp;&nbsp;
                    		<!-- <span class="main-preView-more"><a href="activity.jsp">more</a></span> -->
                    		</p>
                    	</div>
                        
                        </div>
                        <!-- //2 -->
                        
                        
                        
                        <!-- 3 -->
                        <div class="row" id="popularTip"  style="width: 85%; margin: 0 auto;">
                        <div class="main-preView">
                    		<p>
                    		<span class="main-preView-title">Popular TIP</span>&nbsp;&nbsp;&nbsp;
                    		<!-- <span class="main-preView-more"><a href="#">more</a></span> -->
                    		</p>
                    	</div>
                        </div>
                        <!-- //3 -->
                    </div>
                </div>
            </section> <!-- #works -->
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