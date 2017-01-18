<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>Activity</title>
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
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<!-- main02 js -->
<script type="text/javascript" src="js/main02.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#page-top").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		});

	}); // ready
	$(function() {
		$('#titleBox').keyup(function(e){
			if(e.which == 13)
				$('#search_detail').trigger('click');
		});
		
		var num = 0;
		$('#detatilBtn').click(function() {
			if (num == 0) {
				$('#accordion').css('display', 'block');
				$("#activitylist").slideDown('slow');
				num = 1;
			} else {
				//$('#ss').remove();			  			
				$('#accordion').css('display', 'none');
				num = 0;
			}
		}); //click
		
		<c:forEach items="${requestScope.list}" var="avo">
		$.ajax({
			type:"POST",
			url:"activity.do",
			data:"command=checkToppingByNo&actNo=${avo.activityNo}",
			
			success:function(data){
				var map = data.map;
				var checkpath = "";
				if(map.flag == true){
					checkpath = "images/topping_0.png";
				}else{
					checkpath = "images/topping_1.png";
				}
				$('#span_'+map.actNo+'> img').attr("src",checkpath);
			}
		});
		</c:forEach>
		
		/* Recently, Best, Due Date */
		var type2 = "";
		var type1 = [];
		var search_title="";
		$('.type').click(function(){
			type2 = $(this).attr('id');
			search();
		});//type
		
		function search(){
			var command = "command=getActivityListByType";
			type1 = [];
			$('input[type=checkbox]:checked').each(function(){
				type1.push(this.value);
			});
			if(type2 != null && type2 != "")
				command += "&type2="+type2;
			if(search_title != "")
				command += "&title="+search_title;
			if(type1 != null && type1.length != 0)
				command += "&type1="+type1;
			console.log("title :: "+search_title);
			console.log("type1 :: "+type1);
			console.log("type2 :: "+type2);
			console.log("command :: "+command);
			$.ajax({
	            type:"POST",
	            url:"activity.do",
	            data:command,
	            
	            success:function(data){
	               var content = "";
	               var list = data.list;
	               $('#1pageSample').html('');
	               $('div#infiniteScroll').each(function(){
	                  this.remove();
	               });
	               $('#moreBtn').show();
	               if(list.length != 6){
	                  console.log("length :: "+list.length);
	                  $('#moreBtn').hide();
	               }
	               if(list.length != 0){
	                  for(var i=0;i<list.length;i++){
	                     content += '<div class="col-sm-4 col-xs-12">';
	                     content += '<input class="scrolling" type="hidden" value="'+(i*1+1)+'">';
	                     content += '<figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">';
	                     content += '<div class="img-wrapper" style="height:250px;">';
	                     if(list[i].img.length == 0)
	                        content += '<img src="./images/activity_default.jpg" class="img-responsive">';
	                     else
	                        content += '<img src="./activity_upload/'+list[i].img[0].newName+'" class="img-responsive" alt="this is a title" width="474px" height="395px">';
	                      
	                  
	                     content += '   <div class="overlay">';
	                     content += '      <div class="buttons">';
	                     content += '         <a target="_blank" href="activity.do?command=showActivityByNo&&activityNo='+list[i].activityNo+'" style="margin: 0 auto; margin-left: 30%;">Details</a>';
	                     content += '      </div>';
	                     content += '   </div>';
	                     content += '</div>';
	                     content += '<figcaption style="height: 100px;">';
	                     content += '   <h4>';
	                     content += '   <a href="#"> <span style="float: left;">'+list[i].activityTitle;
	                     content += '   </span> <span id="span_'+list[i].activityNo+'" style="float: right;">';
	                     console.log("actNo :: "+list[i].activityNo);
	                     /* <!-- 나의 토핑 여부에 따라서 하트색깔을 달리 가져갈 것이다. --> */
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
	                          $('#span_'+map.actNo).prepend("<img src='"+checkpath+"' style='size: 80%; margin-right: 5px;'>");
	                       },errer:function(){
	                       }
	                    });
	                  content += '      <font style="color: #ff0707">'+list[i].toppingCount+'</font>';
	                  content += '</span>';
	                  content += '   </a>';
	                  content += '   </h4>';
	                  content += '   <br> <span style="float: left; margin-right: 15px;">'+list[i].activityType+'</span>';
	                  content += '   <span style="float: right;">Member: '+list[i].nowAttendance+'/'+list[i].maxAttendance+'</span>';
	                  content += '      <span style="float: left;"><font style="font-size: 11px">'+list[i].startDate+' ~ '+list[i].endDate+'</font></span>';
	                  content += '   </figcaption>';
	                  content += '   </figure>';
	                  content += '   </div>';
	                  }//for
	               }//if
	               else{
	               content += "<h5 style='text-align:center;'>No Matching Search</h5>";
	               }
	               $('#1pageSample').html(content);
	            }//success
	         });//ajax
		}

		$('#moreBtn').click(function() {
			var command = "command=infiniteScrollDown";
			var last_id = $('.scrolling:last').val();
			if(type2 != null && type2 != "")
				command += "&type2="+type2;
			if(search_title != "")
				command += "&title="+search_title;
			if(type1 != null && type1.length != 0)
				command += "&type1="+type1;
			command += "&scrollStart="+last_id;
			$.ajax({
				type : "POST",
				url : "activity.do",
				data : command,
				success : function(data) {
					var list = data.list;
					if (list.length != 0) {
						$('#moreBtn').hide();
											
						$('.scrolling:last').attr('value', (last_id)*1+6);
						var str = "";
						var testValue = last_id*1;
						$(list).each(function(){
							testValue += 1;
							str+='<div id="infiniteScroll"><div class="col-sm-4 col-xs-12"><input class="scrolling" type="hidden" value="'+testValue+'">'+
							'<figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms"><div class="img-wrapper" style="height:250px;">';
						
							if(this.img.length==0) {
								str+='<img src="./images/activity_default.jpg" class="img-responsive">';
							} else {
								str+='<img src="./activity_upload/'+this.img[0].newName+'" class="img-responsive">';
							}
							str+='<div class="overlay"><div class="buttons"><a target="_blank" href="activity.do?command=showActivityByNo&&activityNo='+this.activityNo+'"'
							+'style="margin: 0 auto; margin-left: 30%;">Details</a></div></div></div>';
							//console.log(str);
							str+='<figcaption style="height: 100px;"><h4><a href="#"> <span style="float: left;">'+this.activityTitle+
							'</span><span id="span_'+this.activityNo+'" style="float: right;">';
							console.log('actNo :: ' +this.activityNo );
							/* <!-- 나의 토핑 여부에 따라서 하트색깔을 달리 가져갈 것이다. --> */
		                     $.ajax({
		                          type:"POST",
		                          url:"activity.do",
		                          data:"command=checkToppingByNo&actNo="+this.activityNo,
		                       
								success:function(data){
		                          	var map = data.map;
		                          	var checkpath = "";
									if(map.flag == true){
		                             checkpath = "images/topping_0.png";
		                          }else{
		                             checkpath = "images/topping_1.png";
		                          }
		                          $('#span_'+map.actNo).prepend("<img src='"+checkpath+"' style='size: 80%; margin-right: 5px;'>");
		                       },errer:function(){
		                       }
		                    });
							str+='<font style="color: #ff0707">'+this.toppingCount+'</font></span></a></h4></br><span style="float: left; margin-right: 15px;">'+
							'GangNam</span><span style="float: right;">Member:' + this.nowAttendance +'/' + this.maxAttendance +'</span>'; 
							
							str +='<span style="float: left;"><font style="font-size: 11px">'+this.startDate+'~'+
							this.startDate+'</font></span></figcaption></figure></div></div>';
						}); // each
						$('#1pageSample').append(str);
						
					}else{ // if
						$('#moreBtn').hide();
					}
					if(list.length == 6)
						$('#moreBtn').show();// 버튼 안붙음 ㅜ
					
				} // success			
			}); // ajax
		}); // live
		$('#search_detail').click(function(){
			search_title= $('#titleBox').val();
			search();
		});
	});
</script>

<style type="text/css">
A:hover {
	text-decoration: none
}

A:ACTIVE {
	text-decoration: none
}

A:visited {
	color: ffffff
}

.checkbox-inline {
	margin-right: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Activity</title>
</head>
<body>
	<!--
        ==================================================
        Header Section Start
        ================================================== -->
	<!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<%@include file="header_before_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="header_after_login.jsp"%>
		</c:otherwise>
	</c:choose>

	<!--
            ==================================================
            Portfolio Section Start
            ================================================== -->
	<section id="works" class="works">

		<div id="mainbanner_1"
			style="width: 100%; height: 250px; background-image: url('./images/activity_main.jpg'); background-size: 100%">
			<!-- main hidden activity main -->
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="block wow fadeInUp" data-wow-delay=".3s">
						<div id="hero-area-blank"></div>
						<!-- Slider -->
						<div class="main-intro-text">
							<section class="cd-intro">
								<h1 class="wow fadeInUp animated cd-headline slide"
									data-wow-delay=".4s" style="color: white; margin-top: 0px;">
									<span>Only to create a new activity for you</span><br>
								</h1>

								<a href="createactivity.jsp"><button type="button"
										class="btn btn-default btn-lg btn-block"
										style="width: 250px; margin: 0 auto;">Creat Activity</button></a>

							</section>
							<!-- cd-intro -->
							<!-- /.slider -->
						</div>

					</div>
				</div>
			</div>
		</div>


		<div class="container">

			<!-- search form -->
			<div class="row" style="margin: 0 auto; margin-top: 50px;">
				<div class="col-xs-8 col-xs-offset-2">
					<div class="input-group" style="width: 100%;">
						<input type="hidden" name="search_param" value="all" id="search_param"> 
						<input type="text" class="form-control" id="titleBox" name="title" style="height: 40px;" placeholder="Search Activity">
						<p>
						<div class="input-group-btn">
							<span>
							<img id="search_detail" src="./images/search_icon.jpg" style="margin-right: 1px" onmouseover="this.src='./images/search_icon_on.jpg'" onmouseleave="this.src='./images/search_icon.jpg'">
							</span>
							<button type="button" class="btn btn-default" id="detatilBtn" style="border-radius: 0px; border-color: #cccccc; height: 40px;" id="createSection">Detail Search</button>
						</div>
					</div>
				</div>
			</div>

			<!--  detail Search -->
			<div id="accordion" style="margin: 0auto; margin-left: 10%; margin-top: 15px; width: 80%;">

				<div class="row" style="margin-left: 5%; margin-right: 5%; border-top: 2px solid #ececec;">
					<h3 align="center">Detail Search</h3>
					<form name="detailSelectBox" id="detailSelectBox" style="text-align: center;">
						<span style="margin-right: 5px;">
						<img src="./images/type_icon.jpg"></span> <span>
						<font style="color: #414141;"><b>Activity Type Select</b></font></span><br> 
						<label class="checkbox-inline" style="margin-left: 10px;"> 
						<input type="checkbox" id="inlineCheckbox1" value="Tour">Tour
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox2" value="Party">Party
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox3" value="Shopping">Shopping
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox4" value="Music">Music
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox5" value="Movie">Movie
						</label>
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox6" value="Art">Art
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox7" value="Star">Star
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox8" value="Beauty">Beauty
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox9" value="Sport">Sport
						</label> 
						<label class="checkbox-inline"> 
						<input type="checkbox" id="inlineCheckbox10" value="Food">Food
						</label>

						<p style="margin-bottom: 10px;"></p>
					</form>
				</div>
			</div>

			<!-- List Start -->

			<div class="row" style="width: 85%; margin: 0 auto;">

				<!-- title -->
				<div class="main-preView">
					<div class="tap" style="float: right; color: #9a9a9a">
						<span style="margin-right: 10px;"><a id="recently" class="type" style="cursor:pointer;">Recently</a></span>
						<span>l</span>
						<span style="margin-right: 10px;  margin-left: 10px"><a id="best" class="type"  style="cursor:pointer;">Best</a></span>
						<span>l</span>
						<span style="margin-left: 10px"><a id="dueend" class="type"  style="cursor:pointer;">Due Date</a></span>
					</div>
					<span class="main-preView-title">ACTIVITY LIST</span>
				</div>


				<div id="1pageSample">
					<!-- 처음에 1페이지만 보여주도록함. 더보기 버튼을 누르면 2페이지.. 3페이지.. -->
					<!-- 1 -->
					<!-- List 반복구간 // foreach로 반복시킬구간 시작. -->

					<c:forEach var="vo" items="${list}" varStatus="voIndex">
						<div class="col-sm-4 col-xs-12">
							<input class="scrolling" type="hidden" value="${voIndex.index*1+1}">
							<figure class="wow fadeInLeft animated portfolio-item"
								data-wow-duration="500ms" data-wow-delay="0ms">
								<div class="img-wrapper" style="height: 250px;">
									<c:choose>
										<c:when test="${vo.img[0].imgNo==null}">
											<img src="./images/activity_default.jpg"
												class="img-responsive">
										</c:when>
										<c:otherwise>
											<img src="./activity_upload/${vo.img[0].newName }"
												class="img-responsive" alt="this is a title" width="474px"
												height="395px">
										</c:otherwise>
									</c:choose>
									<div class="overlay">
										<div class="buttons">
											<a target="_blank" href="activity.do?command=showActivityByNo&&activityNo=${vo.activityNo}" style="margin: 0 auto; margin-left: 30%;">Details</a>
										</div>
									</div>
								</div>
								<figcaption style="height: 100px;">
									<h4>
										<span style="float: left;">${vo.activityTitle }
										</span> 
										<span id="span_${vo.activityNo}" style="float: right;"> 
										<!-- 나의 토핑 여부에 따라서 하트색깔을 달리 가져갈 것이다. -->
											<img src="./images/topping_1.png" style="size: 80%; margin-right: 5px;">
											<font style="color: #ff0707">${vo.toppingCount }</font>
										</span>
									</h4>
									<br> <span style="float: left; margin-right: 15px;">${vo.activityType }</span><span
										style="float: right;">Member: ${vo.nowAttendance }/${vo.maxAttendance }</span>
									<span style="float: left;"><font style="font-size: 11px">${vo.startDate } ~ ${vo.endDate }</font></span>
								</figcaption>
							</figure>
						</div>
					</c:forEach>
					<!-- List 반복구간 foreach로 반복시킬구간 끝. -->
				</div>
				<!-- 1페이지끝 -->

				<!-- 더보기시작//2페이지부터는 더보기 버튼을 눌러야한다. -->
				<c:if test="${fn:length(list) ==6 }">
				<div class="activityMore">
					<div class="row">
						<div class="col-xs-12" id="moreBtn">
							<p align="center">
								<!-- <span style="float: left;"><img src="./images/bar_line.png"></span> -->
								<span> <font
									style="text-align: center; color: #9a9a9a; cursor: pointer;">
									<b>more activity list</b></font>
								</span> <span style="margin-left: 5px;">
								<img src="./images/arrow.png"></span>
								<!-- <span style="float: right; "><img src="./images/bar_line.png"></span> -->
							</p>
						</div>
					</div>
				</div>
				</c:if>
				
				<!-- 더보기끝 -->
			</div>
			<!-- row끝 -->

		</div>
		<!-- container 끝.  -->
	</section>
	<!-- #works -->



	<!-- ==================================================
            Scroll Top
            ================================================== -->
	<div id="page-top">
		<span><img src="./images/top_1.png"></span>
	</div>

	<!-- ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>