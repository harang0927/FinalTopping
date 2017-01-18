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
<link rel="icon" type="image/png" href="images/favicon.png">
<title>Place</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->

<!-- login form css
         <link rel="stylesheet" href="css/loginform.css"> -->
<!-- main02 css -->
<link rel="stylesheet" href="css/main02.css">

<!-- radio button -->
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


<!-- main02 js -->
<script type="text/javascript" src="js/main02.js"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$('#radioBtn a').on(
			'click',
			function() {
				var sel = $(this).data('title');
				var tog = $(this).data('toggle');
				$('#' + tog).prop('value', sel);

				$('a[data-toggle="' + tog + '"]').not(
						'[data-title="' + sel + '"]').removeClass('active')
						.addClass('notActive');
				$('a[data-toggle="' + tog + '"][data-title="' + sel + '"]')
						.removeClass('notActive').addClass('active');
			})
</script>

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

#map_canvas {
	/* float:left; */
	/* 	width: 820px;
	height: 406px; */
	
}

#listing {
	margin-left: 1px;
	width: 205px;
	height: 326px;
	overflow: auto;
	cursor: pointer;
}

#listing {
	margin-left: 1px;
	width: 205px;
	height: 326px;
	overflow: auto;
	cursor: pointer;
}

#controls {
	float: left;
	padding: 5px;
}

.placeIcon {
	width: 16px;
	height: 16px;
	margin: 2px;
}

#results {
	border-collapse: collapse;
	width: 184px;
}

#results tr{
	border-bottom: 1px dotted #dddddd;
}

#results tr:hover{
	background-color: #e7e7e7;
}

</style>

</head>

<!-- JQuery src 연결 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		<c:if test="${sessionScope.mvo eq null or sessionScope.mvo.email eq null}">
			location.href="main01.jsp";
		</c:if>
		$('#toppingBtn').click(
				function() {
					var pFrm = document.placeFrm;

					//		placeVO.command = "toppingPlace";
					var placeId = pFrm.placeId.value;
					var longtitude = pFrm.lgt.value;
					var latitude = pFrm.lat.value;
					var placeName = pFrm.placeName.value;
					var placeDistrict = pFrm.placeDistrict.value;
					var placeImgUrl = pFrm.placeImgUrl.value;

					var str = "placeId=" + placeId + "&locationVO.longtitude="
							+ longtitude + "&locationVO.latitude=" + latitude
							+ "&placeName=" + placeName + "&placeDistrict="
							+ placeDistrict + "&placeImgUrl=" + placeImgUrl;
					$.ajax({
						type : "post",
						url : "place.do",
						data : "command=toppingPlace&" + str,

						success : function(data) {
							alert(data.result);
						},
						error : function() {
							alert("에러났다!!!");
						}
					});
				});
		
	});
	
</script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA95vH6tAb6oakponeSDvfvCQjWActrb8s&sensor=false&libraries=places&language=en"></script>
<script type="text/javascript">
   var map, places, infoWindow;
   var markers = [];
   var autocomplete;
   var marker;
   var type, index, OnOff=0;
   var place__Id="";
   var beforeContent = "";
   if('${param.placeId ne null}'){
      place__Id = '${param.placeId}';
      OnOff = 1;
      
   }

   function initialize() {
      var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996);
      var myOptions = {
         zoom : 14,
         center : myLatlng,
         mapTypeId : google.maps.MapTypeId.ROADMAP
      };//myOptions
      map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
      places = new google.maps.places.PlacesService(map);
      if(place__Id != ""){
         places.getDetails({
            placeId : place__Id
         }, function(place, status){
            if(status == google.maps.places.PlacesServiceStatus.OK){
               map.setCenter(place.geometry.location);
               marker = new google. maps.Marker({
                  map : map,
                  position : place.geometry.location
               });
               infoWindow = new google.maps.InfoWindow({
                  content : getinfoWindowContent(place)
               });//infoWindow
               markers[0] = marker;
               infoWindow.open(map, markers[0]);
            }
         });
      }
      google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
      autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
      google.maps.event.addListener(autocomplete, 'place_changed',function() {
         showSelectedPlace();
      });
   }//init

   function tilesLoaded() {
      google.maps.event.clearListeners(map, 'tilesloaded');
      google.maps.event.addListener(map, 'zoom_changed', search);
      google.maps.event.addListener(map, 'dragend', search);
      if(OnOff == 0){
         markers[0].setMap(null);
         search();
      }
   }//tilesLoaded

   function showSelectedPlace() {
      clearResults();
      clearMarkers();
      var place = autocomplete.getPlace();
      placeForUse = place;
      map.panTo(place.geometry.location);
      marker = new google.maps.Marker({
         position : place.geometry.location,
         map : map
      });//markers
      infoWindow = new google.maps.InfoWindow({
         content : getinfoWindowContent(place)
      });//infoWindow
      markers[0] = marker;
      infoWindow.open(map, markers[0]);
   }//showSelectedPlace

   $(document).on('click','img#typeImg',function(){
      index = $(this).index("img#typeImg");
      search();
   });
   
   function search() {
      type = $('img#typeImg:eq('+index+')').attr('class');
      autocomplete.setBounds(map.getBounds());
      var search = {
         bounds : map.getBounds()
      };//search
      if (type != 'establishment') {
         if (type == 'travel') {
            search.types = [ 'park', 'museum', 'amusement_park',
                  'aquarium', 'art_gallery' ];
         } else {
            search.types = [ type ];
         }//if-else
      }//if
      places.search(search, function(results, status) {
         if (status == google.maps.places.PlacesServiceStatus.OK) {
            clearResults();
            clearMarkers();

            createMarkers(results);
         }//if
      });//places.search()
   }//search()

   function createMarkers(results) {
      for (var i=0; i < results.length; i++){
         var image = {
            url : results[i].icon,
            size : new google.maps.Size(71, 71),
            origin : new google.maps.Point(0, 0),
            anchor : new google.maps.Point(17, 34),
            scaledSize : new google.maps.Size(25, 25)
         };
         markers[i] = new google.maps.Marker({
            map : map,
            icon : image,
            title : results[i].name,
            position : results[i].geometry.location
         });//markers
         google.maps.event.addListener(markers[i], 'click', getDetails(results[i], i));
         insertMarker(i);
         addResult(results[i], i);
      }//for
   }

   function clearMarkers() {
      for (var i = 0; i < markers.length; i++) {
         if (markers[i]) {
            markers[i].setMap(null);
            markers[i] == null;
         }//if
      }//for
   }//clearMarkers

   function insertMarker(i) {
      return function() {
         markers[i].setMap(map);
      }//return function
   }//dropMarker

   function addResult(result, i) {
      var results = document.getElementById('results');
      var tr = document.createElement('tr');
      tr.onclick = function() {
         google.maps.event.trigger(markers[i], 'click');
      };//tr-onclick
      var iconTd = document.createElement('td');
      var nameTd = document.createElement('td');
      var icon = document.createElement('img');
      icon.src = result.icon.replace('http:', '');
      icon.setAttribute('class', 'placeIcon');
      var name = document.createTextNode(result.name);
      iconTd.appendChild(icon);
      nameTd.appendChild(name);
      tr.appendChild(iconTd);
      tr.appendChild(nameTd);
      results.appendChild(tr);
   }//addResult

   function clearResults() {
      var results = document.getElementById('results');
      while (results.childNodes[0]) {
         results.removeChild(results.childNodes[0]);
      }
   }

   function getDetails(result, i) {
      return function() {
         places.getDetails({
            reference : result.reference
         }, showInfoWindow(i));
      }
   }

   var placeForUse;
   function showInfoWindow(i) {
      return function(place, status) {
         placeForUse = place;
         //alert(place.geometry.location+"\n"+place.formatted_address);
         if (infoWindow) {
            infoWindow.close();
            infoWindow = null;
         }
         if (status == google.maps.places.PlacesServiceStatus.OK) {
            infoWindow = new google.maps.InfoWindow({
               content : getinfoWindowContent(place)
            });
            infoWindow.open(map, markers[i]);
         }
      }
   }
	var toppingPlaceId = [];
	$.ajax({
		type:"POST",
		url:"place.do",
		data:"command=getMyToppingPlaceList",
		
		success:function(data){
			var list = data.toppingList;
			for(var i=0;i<list.length;i++)
				if(list[i].placeVO != null && list[i].placeVO.placeId != null)
					toppingPlaceId.push(list[i].placeVO.placeId);
		}
	});
	
	function getinfoWindowContent(place) {
		var content = '<table width="300px" height="auto"><tr><td style="border:0;" width="100%" colspan="2">';
		//content += '<img class="placeIcon" src="' + place.icon + '">';
		content += '<h4 style="color: #02bace"><b>'
				+ place.name + '</a></b></h4></td></tr>';
		content += '<tr><td style="border-bottom:2px solid #9a9a9a;" colspan="2"></td></tr>';
		content += '<tr><td style="height:10px;" colspan="2"></td></tr>';
		
		if(place.formatted_address != null){
			content += '<tr><td>';
			content += place.formatted_address;
			content += '</td>';
		}
		
		if(place.photos != null){
			if(place.photos[0].getUrl({'maxWidth':100,'maxHeight':100}) != null){
			content += '<td rowspan="3">';
			content += '<img src="'+place.photos[0].getUrl({'maxWidth':100,'maxHeight':100})+'" width="60px" height="60px" style="margin-left: 10px; margin-bottom: 10px;">';
			content += '</td></tr>';
			}
		}
		
		
		if(place.international_phone_number != null){
			content += '<tr><td>';
			content += place.international_phone_number;
			content += '</td></tr>';
		}
		
		
		if(place.website != null){
			content += '<tr><td>';
			content += '<a href="'+place.website+'" target="_blank">website</a>';
			content += '</td></tr>';
		}
		
		content += '<tr><td style="height:10px;" colspan="2"></td></tr>';
		content += '<tr><td style="border-bottom:2px solid #d4d4d4;" colspan="2"></td></tr>';
		content += '<tr><td style="height:10px;" colspan="2"></td></tr>';
		
		//content += '<tr><td style="text-align: right; float:right" colspan="2">';
		
		content += '<tr><td style="text-align: right; float:right" colspan="2">';
		var testFlag=false;
		if(toppingPlaceId.indexOf(place.place_id) > -1){
			testFlag = true;
		}
		if(testFlag == true)
			content += '<span id="toppingBtn" style="cursor:pointer;"><img src="./images/destination_heart_icon_on.jpg"></span>';
		else
			content += '<span id="toppingBtn" style="cursor:pointer;"><img src="./images/destination_heart_icon.jpg"></span>';
		

		content += '<span id="goTipList" style="cursor:pointer;" class="'+place.place_id+'"><img src="./images/destination_tip_icon.jpg"></span></td></tr>';
		
		return content;
	}
	
   $(document).on('click','#goTipList',function(){
      location.href="tip.do?command=getTipBoardListByPlaceId&placeId="+$(this).attr('class');
   });
   $(document).on('click','#toppingBtn',function(){
      var command = "command=toppingPlace";
      command +="&placeId="+placeForUse.place_id;
      command +="&locationVO.latitude="+placeForUse.geometry.location.lat();
      command += "&locationVO.longtitude="+placeForUse.geometry.location.lng();
      command += "&placeName="+placeForUse.name;
      command += "&placeDistrict="+placeForUse.formatted_address;
      if(placeForUse.photos != null)
         command += "&placeImgUrl="+placeForUse.photos[0].getUrl({'maxWidth':1000,'maxHeight':1000});
      $.ajax({
          type:"POST",
          url:"place.do",
          data:command,
          
          success:function(data){
				if(data.result.indexOf("add") > -1){
					alert(data.result);
					$('#toppingBtn img').attr('src',"./images/destination_heart_icon_on.jpg");
				}else{
					alert(data.result);
					$('#toppingBtn img').attr('src',"./images/destination_heart_icon.jpg")
				}
          }
       });
   });


   google.maps.event.addDomListener(window, 'load', initialize);
</script>

<!-- 마우스오버시 ... -->
<script type="text/javascript">
$(document).ready(function(){
	//toppingBtn
    $(".restaurant").click(function(){
        $(this).attr("src", "./images/restaurant_icon_on.png");
    });
});
</script>


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
        Content Section Start
        ================================================== -->
	<!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
	<section id="contact-section">
		<div class="container" style="margin-top: 40px;">
			<!-- 요기부터 내용 넣어주심됩니다. -->
			<h2 align="center" style="margin-bottom: 40px;">
				Search what you want to visit in Seoul.
			</h2>

			<div class="row" style="align: center; width: 90%; margin: 0 auto">
				<div class="col-md-12">

					<div class="row" style="margin: 0 auto; padding: 0">
						<div class="col-md-4" style="padding: 0; margin: 0">
							<div class="row">
								<!-- 검색창 -->
								<div class="col-md-12">
									<div style="margin-bottom: 5px;">
										<input id="autocomplete" type="text"
											style="width: 100%; font-size: 13px;">
									</div>
								</div>

								<!-- 아이콘/리스트 시작-->
								<div class="col-md-12" style="height: 500px; width: 100%">
									
										<div class="row"
											style="width: 100%; height: 500px; border: 1px solid #d4d4d4; margin: 0 auto;">
												<!-- 좌측아이콘(시작) -->
												<div class="col-md-2"
												style="background-color: black; height: 500px; margin: 0 auto; padding: 0">
													<!-- 1. tour -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="travel" src="./images/tourlist_icon.png" 
														onmouseover="this.src='./images/tourlist_icon_on.png'"
														onmouseleave="this.src='./images/tourlist_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
													
													<!-- 2. Shopping -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="shopping_mall" src="./images/shopping_icon.png" 
														onmouseover="this.src='./images/shopping_icon_on.png'"
														onmouseleave="this.src='./images/shopping_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
													
													<!-- 3. Restaurant -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="restaurant" src="./images/restaurant_icon.png" 
														onmouseover="this.src='./images/restaurant_icon_on.png'"
														onmouseleave="this.src='./images/restaurant_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
													
													<!-- 4. Accommodations -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="lodging" src="./images/hotel_icon.png" 
														onmouseover="this.src='./images/hotel_icon_on.png'"
														onmouseleave="this.src='./images/hotel_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
													
													<!-- 5. Hospital -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="hospital" src="./images/hospital_icon.png" 
														onmouseover="this.src='./images/hospital_icon_on.png'"
														onmouseleave="this.src='./images/hospital_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
													
													<!-- 6. Facility -->
													<div style="width: 100%; height: 50px; margin-top: 10px; position: relative;" align="center">
														<img id="typeImg" class="subway_station" src="./images/traffic_icon.png" 
														onmouseover="this.src='./images/traffic_icon_on.png'"
														onmouseleave="this.src='./images/traffic_icon.png'">
													</div>
													<div style="border-top: 1px solid #727272; width: 100%"></div>
												</div>
												<!-- 좌측아이콘(끝) -->
												
											<!-- 우측 리스트(시작) -->
											<div class="col-md-10" style="margin-top: 10px; padding-left: 20px;">
												<div class="row">
													<div class="col-md-12">
														<div style="width: 100%; height: 5px;">
															<table id="results" style="font-size:12px; cursor: pointer; width: 100%">

															</table>
														</div>
													</div>
												</div>	
											</div>
											<!-- 우측 리스트(끝) -->
											
										</div>
								</div>
								<!-- 아이콘/리스트(끝) -->
							
							</div>
						</div>

						<!-- 맵(오른쪽 크게) -->
						<div class="col-md-8" style="padding: 0; padding-left: 5px;">
							<div id="map_canvas" style="height: 545px;"></div>
						</div>

					</div>

				</div>
			</div>
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
	<%@include file="footer.jsp"%>

</body>
</html>