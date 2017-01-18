<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="./images/favicon.png">
<title>Create Activity</title>
<style type="text/css">
A:hover {
	text-decoration: none
}

A {
	text-decoration: none;
}

A:visited {
	color: ffffff
}
/* #hiddenUpload{
				display: none;
			} */
</style>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Template CSS Files
        ================================================== -->
<!-- Twitter Bootstrs CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- Ionicons Fonts Css -->
<!--  <link rel="stylesheet" href="css/ionicons.min.css"> -->
<!-- animate css -->
<link rel="stylesheet" href="./css/animate.css">
<!-- Hero area slider css-->
<link rel="stylesheet" href="./css/slider.css">
<!-- owl craousel css -->
<link rel="stylesheet" href="./css/owl.carousel.css">
<link rel="stylesheet" href="./css/owl.theme.css">
<!-- <link rel="stylesheet" href="css/jquery.fancybox.css"> -->
<!-- template main css file -->
<link rel="stylesheet" href="./css/main.css">
<!-- responsive css -->
<link rel="stylesheet" href="./css/responsive.css">

<!-- login form css
         <link rel="stylesheet" href="css/loginform.css"> -->
<!-- main02 css -->
<link rel="stylesheet" href="./css/main02.css">

<!-- BootScript -->
<!-- modernizr js -->
<script src="./js/vendor/modernizr-2.6.2.min.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- owl carouserl js -->
<script src="./js/owl.carousel.min.js"></script>
<!-- bootstrap js -->
<script src="./js/bootstrap.min.js"></script>
<!-- wow js -->
<script src="./js/wow.min.js"></script>
<!-- slider js -->
<script src="./js/slider.js"></script>
<script src="./js/jquery.fancybox.js"></script>
<!-- template main js -->
<script type="text/javascript" src="./js/main.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<!-- main02 js -->
<script type="text/javascript" src="./js/main02.js"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#page-top").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 'slow');
		});
	});

	$(function() {
		$("#startdate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "sun", "mon", "tues", "wed", "thurs",
							"fri", "sat" ],
					monthNames : [ "January", "February", "March", "April",
							"May", "June", "July", "August", "September",
							"October", "November", "December" ],
					defaultDate : "+1w",
					numberOfMonths : 1,
					changeMonth : true,
					showMonthAfterYear : true,
					changeYear : true,
					onClose : function(selectedDate) {
						$("#enddate").datepicker("option", "minDate",
								selectedDate);
					}
				});

		$("#enddate").datepicker(
				{
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "sun", "mon", "tues", "wed", "thurs",
							"fri", "sat" ],
					monthNames : [ "January", "February", "March", "April",
							"May", "June", "July", "August", "September",
							"October", "November", "December" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					defaultDate : "+1w",
					numberOfMonths : 1,
					changeMonth : true,
					showMonthAfterYear : true,
					changeYear : true,
					onClose : function(selectedDate) {
						$("#startdate").datepicker("option", "maxDate",
								selectedDate);
					}
				});
	});
</script>
<!-- Map -->
<style type="text/css">
#map {
	height: 500px;
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
	<c:if test="${sessionScope.mvo eq null or sessionScope.mvo.email eq null}">
       	 location.href="main01.jsp";
    </c:if>

	<!--===============================================-->
	<section id="contact-section">
		<div class="container" style="margin-top: 60px;">
			<div>
				<h1 align="center">Create a special activity for you :)</h1>
			</div>
			<form action="activity.do" method="post" name="activity_form"
				enctype="multipart/form-data">
				<input type="hidden" name="command" value="createActivity">
				<div class="row" style="margin-top: 50px;">
					<div class="col-xs-8 col-xs-offset-2">
						<div class="input-group" style="margin: 0auto;">

							<input type="hidden" name="search_param" value="all"
								id="search_param"> <input id="placeId" type="hidden"
								name="placeVO.placeId"> <input id="searchBox"
								type="text" class="form-control" name="x" style="height: 40px;"
								placeholder="Search Location">
							<p>
							<div class="input-group-btn">
								<span><a href="#"><img src="./images/search_icon.jpg"
										style="margin-right: 1px"
										onmouseover="this.src='./images/search_icon_on.jpg'"
										onmouseleave="this.src='./images/search_icon.jpg'"></a></span>

							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="block">
							<div class="contact-form">
								<select id="TypeSelect" name="activityType" class="form-control"
									style="height: 40px; margin-bottom: 10px; border-radius: 0px;"
									required autofocus>
									<option value="">Select Type For Your Activity</option>
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
								</select>


								<div class="form-group wow fadeInDown" data-wow-duration="500ms"
									data-wow-delay=".6s">
									<input type="text" placeholder="Title" class="form-control"
										name="activityTitle" id="name" required="required">
								</div>


								<div class="form-group wow fadeInDown" data-wow-duration="500ms"
									data-wow-delay="1s">
									<input type="number" placeholder="The number of participants"
										class="form-control" name="maxAttendance" id="subject" required="required">
								</div>

								<div class="row"
									style="margin-bottom: 0px; margin-left: 1px; margin-right: 1px;">
									<!-- <div class="col-md-6"><input type="text" placeholder="Start Date" class="form-control" name="subject" id="startdate"></div> -->
									<p>Activity Date</p>
									<div class="col-md-6" style="margin: 0; padding-left: 0;">
										<input type="date" placeholder="Start Date"
											class="form-control" name="startDate" id="startdate" required="required">
									</div>
									<div class="col-md-6" style="margin: 0; padding: 0;">
										<input type="date" placeholder="End Date" class="form-control"
											name="endDate" id="enddate" required="required">
									</div>
								</div>

								<div class="form-group wow fadeInDown" data-wow-duration="500ms"
									data-wow-delay="1.2s" style="margin-top: 15px">
									<textarea rows="6" placeholder="Content" class="form-control"
										name="content" id="message" required="required"></textarea>
								</div>


								<div class="form-group" id="hiddenUpload">
									<label for="exampleInputFile">Image Upload</label> <input
										type="file" name="uploadFile[0]" style="width: 100%;">
									<input type="file" name="uploadFile[1]" style="width: 100%;">
									<input type="file" name="uploadFile[2]" style="width: 100%;">
									<p class="help-block">
										<font style="font-size: 13px">image upload up to
											three possible.</font>
									</p>
								</div>


								<div id="submit" class="wow fadeInDown"
									data-wow-duration="500ms" data-wow-delay="1.4s">
									<!-- <input type="button" id="imageUploadBtn" class="btn btn-default btn-send" value="Image upload" style="width: 100%; background-color: #9a9a9a; margin-top: 10px;"> -->
									<input type="submit" id="contact-submit"
										class="btn btn-default btn-send" value="Creat Activity"
										style="width: 100%; margin-top: 10px;">
								</div>


							</div>

						</div>
					</div>
					<div class="col-md-6" style="margin-top: 43px;">
						<div class="map-area" style="width: 500px; height: 500px;">
							<div id="map" class="map" style="width: 100%; height: 435px;">
							</div>
						</div>
				
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- Map -->
	<script>
		function initAutocomplete() {
			var seoul = {
				lat : 37.566535,
				lng : 126.97796919999996
			}
			var map = new google.maps.Map(document.getElementById("map"), {
				center : seoul,
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			});

			//InfoWindow
			var infowindow = new google.maps.InfoWindow();
			infowindow.close();
			// Create the search box and link it to the UI element.
			var input = document.getElementById("searchBox");
			var searchBox = new google.maps.places.SearchBox(input);

			// Bias the SearchBox results towards current map's viewport.
			map.addListener('bounds_changed', function() {
				map.setZoom(15);
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
					/* infoWindow 변경 */
					var content = " <strong>name</strong> : " + place.name;
					content += "<br> <strong>address</strong> : "
							+ place.formatted_address;
					content += "<br> <strong>Phone</strong> : "
							+ place.international_phone_number;
					infowindow.setContent(content);

					markers[0].addListener('click', function() {
						infowindow.open(map, markers[0]);
					});
					$('#placeId').val(place.place_id);
				});

				map.fitBounds(bounds);
			});
			// [END region_getplaces]
		}
		google.maps.event.addDomListener(window, 'load', initMap);
	</script>

	<!-- 언어설정 변경 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA95vH6tAb6oakponeSDvfvCQjWActrb8s&libraries=places&callback=initAutocomplete&language=en"
		async defer></script>


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