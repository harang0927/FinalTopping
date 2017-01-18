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
        <title>Update Tip</title>
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
       <!--  <link rel="stylesheet" href="css/main.css"> -->
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">

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

        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
        
        <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
        	$("#page-top").click(function() {
                $('html, body').animate({scrollTop : 0}, 'slow');
            });
        }); 
        
        $(function(){
            $(window).scroll(function() {
                if ($(this).scrollTop() > 450) {
                    $('#page-top').fadeIn();
                } else {
                    $('#page-top').fadeOut();
                }
            });
            
	    });
        
		
		$(document).ready(function(){
		    $('[data-toggle="tooltip"]').tooltip();   
		});

        $(document).ready(function(){
        	$("#page-top").click(function() {
                $('html, body').animate({scrollTop : 0}, 'slow');
            });
        	for(var i=0;i<$('#type option').length;i++){
        		if($('#type option:eq('+i+')').attr('value') =='${tbvo.type}')
        			$('#type option:eq('+i+')').attr('selected',"selected")
        	}
        	alert('${tbvo.img[0].orgName}');
        	$('#uploadFile').attr('value','${tbvo.img[0].newName}');
        });    


        </script>
		
		
		<style type="text/css">
			A:hover {text-decoration: none}
			A{text-decoration: none;}
			A:visited {color:ffffff}
			
			
			#pac-input {
				background-color: #fff;
				font-family: Roboto;
				font-size: 15px;
				font-weight: 300;
				padding: 0 11px 0 13px;
				text-overflow: ellipsis;
				width: 100%;
			}
			
			#map {
				height: 300px;
			}
			
			input[type=text],select{
				width:100%;
			}
			
			#write-header{
				background-color:#333333;
				color:#ffffff;
				line-height: 15px;
				font-size: 15px;
				padding:12px 0;
				text-align: center;
				border-radius: 45px 45px 45px 45px;
			}
			
			#page-top{
			position: fixed;
			right: 2%;
			bottom: 50px;
			display: none;
			z-index: 999;
			cursor : pointer;
			}
			
			#page-top a{
				text-decoration: none;
			}
			#page-top:hover{
				color : orange;
			}

		</style>

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
            <div class="container" style="margin-top: 40px;"  class="col-sm-12">
			<!-- 요기부터 내용 넣어주심됩니다. -->
			
			<h2 align="center"><b>TIP</b></h2>
			<p style="text-align: center">You can share your information with other travelers.</p>
			<section class="col-sm-1"></section>
			<section  class="col-sm-10">
				<form action="tip.do" method="post" name="updateForm" enctype="multipart/form-data">
					<input type="hidden" name="command" value="updateTip">
					<input type="hidden" name="tipNo" value="${tbvo.tipNo}">
					<div class="col-sm-4"> 
					<div id="write-header">Update Tip Form</div><br>
					WRITER<input type="text" name="memberVO.nickname" id="nickname" value="${sessionScope.mvo.nickName}" readonly="readonly"><br>
					TYPE<br>
					<select id="type" name="type" required="required">
						<c:if test="${tbvo.type!=null}">
							<option value="${tbvo.type}">${tbvo.type}</option>
						</c:if>
						<option value="">==TYPE==</option>
						<option value="Tour">Tour</option>
						<option value="Party">Party</option>
						<option value="Shopping">Shopping</option>
						<option value="Music">Music</option>
						<option value="Movie">Movie</option>
						<option value="Art">Art</option>
						<option value="Star">Star</option>
						<option value="Beauty">Beauty</option>
						<option value="Sport">Sport</option>
						<option value="Food">Food</option>
					</select><br><br>
					TITLE<input type="text" name="title" id="title" value="${tbvo.title}" required="required"><br>
					PlACE<input type="text" id="placeId" name="placeVO.placeId" value="${tbvo.placeVO.placeId}" readonly="readonly" data-toggle="tooltip" data-placement="right" title="Please enter a location in the search box."><br>
					</div>
					
					<div id="mapdiv" class="col-sm-8">
							<input id="pac-input" type="text" placeholder="Search Box">		
						<div id="map" style="float: none;"></div>	
					</div>
					<div class="col-sm-12">
					CONTENT<br>
					<textarea rows="10" name="content" id="content" style="resize:none;width:100%;">${tbvo.content}</textarea><br>
					</div>
		
					<div class="col-sm-12">
					<c:forEach items="${tbvo.img}" var="tvo">
						<img alt="" src="./tip_upload/${tvo.newName}" width="100px" height="100px" name="uploadFile">
							<input type="file" id="uploadFile" name="uploadFile" value="${tvo.newName}">
								<span><input type="button" value="Delete" onclick="deleteImg()"></span>
							
					</c:forEach>
					</div>
					
					</div>
					
					<div class="col-sm-12">
					<hr>
						<input type="submit" value="Modify" style="float:right;background-color:#333333;border-radius:4px;color:#ffffff;">
						<a href="tip.do?command=getTipBoardList&&page=1"><input type="button" value="CANCEL" style="float:right;background-color:#333333;border-radius:4px;color:#ffffff;margin-right:15px;"></a>
					</div>
				</form>
				</section>
				<script>
					// This example adds a search box to a map, using the Google Place Autocomplete
					// feature. People can enter geographical searches. The search box will return a
					// pick list containing a mix of places and predicted search terms.
				
					/* 지도지도지도지도지도지도 */
					function initAutocomplete() {
						var seoul = {
							lat : 37.566535,
							lng : 126.97796919999996
						}
						var map = new google.maps.Map(document.getElementById('map'), {
							center : seoul,
							zoom : 15,
							mapTypeId : google.maps.MapTypeId.ROADMAP
						});
				
						//InfoWindow
						var infowindow = new google.maps.InfoWindow();
						infowindow.close();
						// Create the search box and link it to the UI element.
						var input = document.getElementById('pac-input');
						var searchBox = new google.maps.places.SearchBox(input);
				
						// Bias the SearchBox results towards current map's viewport.
						map.addListener('bounds_changed', function() {
							searchBox.setBounds(map.getBounds());
						});
				
						var markers = [];
						// [START region_getplaces]
						// Listen for the event fired when the user selects a prediction and retrieve
						// more details for that place.
						searchBox.addListener('places_changed', function() {
							var places = searchBox.getPlaces();
							if (places.length == 0) {
								return;
							}
				
							// Clear out the old markers.
							markers.forEach(function(marker) {
								marker.setMap(null);
							});
							markers = [];
				
							// For each place, get the icon, name and location.
							var bounds = new google.maps.LatLngBounds();
							places.forEach(function(place) {
								var icon = {
									url : place.icon,
									size : new google.maps.Size(71, 71),
									origin : new google.maps.Point(0, 0),
									anchor : new google.maps.Point(17, 34),
									scaledSize : new google.maps.Size(50, 50)
								};
				
								// Create a marker for each place.
								markers.push(new google.maps.Marker({
									map : map,
									icon : icon,
									title : place.name,
									position : place.geometry.location
								}));
				
								if (place.geometry.viewport) {
									// Only geocodes have viewport.
									bounds.union(place.geometry.viewport);
								} else {
									bounds.extend(place.geometry.location);
								}
								var address = "";
								for (var i = 0; i < place.address_components.length; i++) {
									address += place.address_components[i].short_name + " "
								}
				
								$('#placeId').val(place.place_id);
							});
				
							map.fitBounds(bounds);
						});
						// [END region_getplaces]
					}
				
				</script>
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA95vH6tAb6oakponeSDvfvCQjWActrb8s&libraries=places&callback=initAutocomplete"
					async defer></script>
			   </section>
			   <section class="col-sm-1"></section>
			
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