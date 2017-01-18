<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>TourList</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
#row-main {
	height: 100%;
	margin-top: 120px;
	overflow-x: hidden; /* necessary to hide collapsed sidebars */
	background-color: rgba(63, 105, 105, 0.75);
}

#content, .topping-sidebar {
	min-height: 500px;
}

#content {
	-webkit-transition: width 0.3s ease;
	-moz-transition: width 0.3s ease;
	-o-transition: width 0.3s ease;
	transition: width 0.3s ease;
}

#content {
	background-color: #ffffff;
}

#content .btn-group {
	margin-bottom: 10px;
}

/* .col-md-6 .width-9, .col-md-6 .width-12, .col-md-9 .width-6, .col-md-9 .width-12,
	.col-md-12 .width-6, .col-md-12 .width-9 {
	display: none; 
} *//* just hiding labels for demo purposes */

.topping-sidebar {
	-webkit-transition: margin 0.3s ease;
	-moz-transition: margin 0.3s ease;
	-o-transition: margin 0.3s ease;
	transition: margin 0.3s ease;
	weight: 100%;
}

.collapsed {
	display: none; /* hide it for small displays */
}

@media ( min-width : 992px) {
	.collapsed {
		display: block;
	}
	#sidebar-left.collapsed {
		margin-left: -50%; /* same width as sidebar */
	}
	#content.collapsed {
		margin-right: -25%; /* same width as sidebar */
	}
}

@media ( min-width : 768px) {
	.collapsed {
		display: block;
	}
	#sidebar-left.collapsed {
		margin-left: -50%; /* same width as sidebar */
	}
	#content.collapsed {
		margin-right: -25%; /* same width as sidebar */
	}
}

/*finished시작*/
.column {
	width: 100%;
	float: left;
}

.portlet {
	margin: 0 1em 1em 0;
	padding: 0.3em;
}

.portlet-header {
	padding: 0.2em 0.3em;
	margin-bottom: 0.5em;
	position: relative;
}

.portlet-toggle {
	position: absolute;
	top: 50%;
	right: 0;
	margin-top: -8px;
}

.portlet-content {
	padding: 0.4em;
}

.portlet-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
}

/*==========*/
#finished-Btn {
	width: 98%;
	border: 1px solid #c5c5c5;
	font-weight: bold;
	background-color:#333;
	color:#ffffff;
}

/*finished끝*/

/*토핑 시작*/
#sortable1, #sortable2 {
	border: 1px solid #eee;
	width: 100%;
	min-height: 20px;
	list-style-type: none;
	margin: 0;
	padding: 5px;
	float: left;
	margin-right: 10px;
}

#sortable1 li, #sortable2 li {
	width: 100%;
	padding: 5px;
	font-size: 1.2em;
	margin: 3px 0;
	cursor:pointer;
}
/*토핑끝*/

/* tourlist-finished 시작*/
#sortable2 {
	/* float: left; */
	width: 100%;
	min-height: 12em;
}

.sortable2.custom-state-active {
	background: #eee;
}

.sortable2 li {
	float: left;
	width: 96px;
	padding: 0.4em;
	margin: 0 0.4em 0.4em 0;
	text-align: center;
}

.sortable2 li h5 {
	margin: 0 0 0.4em;
	cursor: move;
}

.sortable2 li a {
	float: right;
}

.sortable2 li a.ui-icon-zoomin {
	float: left;
}

#finish {
	width: 100%;
	min-height: 18em;
	padding: 1%;
}

#finish h4 {
	line-height: 16px;
	margin: 0 0 0.4em;
}

#finish h4 .ui-icon {
	float: left;
}

#finish .sortable2 h5 {
	display: none;
}
/* tourlist-finished 끝*/
</style>
<script>
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?");
		if (f)
			location.href = "member.do?command=logout";
	}

	/* Tourlist 슬라이드 시작 */
	$(function() {
		/* $( ".column" ).sortable({
		  connectWith: ".column",
		  handle: ".portlet-header",
		  cancel: ".portlet-toggle",
		  placeholder: "portlet-placeholder ui-corner-all"
		}); */

		$(".portlet")
				.addClass(
						"ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
				.find(".portlet-header")
				.addClass("ui-widget-header ui-corner-all")
				.prepend(
						"<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

		$(".portlet-toggle").on("click", function() {
			var icon = $(this);
			icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
			icon.closest(".portlet").find(".portlet-content").toggle();
		});
	});
	/* Tourlist 슬라이드 끝 */

	/* TOPPING-TOURLIST 시작*/
	$(function() {
		/* $( "#sortable1, #sortable2" ).sortable({
		  connectWith: ".connectedSortable"
		}).disableSelection(); */
		$('#sortable1 li').draggable({
			revert : "invalid",
			stack : "#sortable1 li",
			helper : "clone"
		});

		/* TOPPING-TOURLIST 끝*/

		/* tourlist-finished 시작*/
		$(document).on('click', '#sortable2 a.ui-icon-finish', function() {
			deleteImage($(this).parent());
			updateList($(this).parent().val());
			console.log("finish");
		});
		$(document).on('click', '#finish a.ui-icon-refresh', function() {
			recycleImage($(this).parent());
			updateList($(this).parent().val());
			console.log("refresh");
		});
		$('#finish').droppable({
			accept : '#sortable2 a.ui-icon-finish',
			drop : function(event, ui) {
				deleteImage(ui.draggable);
			}
		});
		$('#sortable2').droppable({
			accept : '#sortable1 li, #finish a.ui-icon-refresh',
			drop : function(event, ui) {
				recycleImage(ui.draggable);
			}
		});

		function deleteImage($item) {
			var recycle_icon = "<a style='cursor:pointer;' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
			var delete_icon = "<a style='cursor:pointer;' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image.</a>";
			$item
					.fadeOut(function() {
						var $list = $("ul", $('#finish')).length ? $("ul",
								$('#finish')) : $(
								"<ul class='sortable2 ui-helper-reset'/>")
								.appendTo($('#finish'));
						$item.find("a.ui-icon-trash").remove();
						$item.find("a.ui-icon-finish").remove();
						$item.clone().append(recycle_icon).append(delete_icon)
								.appendTo($list).fadeIn(function() {
									$item.animate({
										width : "100%"
									});
								});
					});
		}

		// Image recycle function

		function recycleImage($item) {
			var finish_icon = "<a style='cursor:pointer;' title='Delete this image' class='ui-icon ui-icon-finish'>Finish image.</a>";
			var delete_icon = "<a style='cursor:pointer;' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
			var flag1 = false;
			var flag2 = false;
			if (!$item.find("a.ui-icon-refresh").length) {
				if ($('#sortable2').find('li').length != 0) {
					$('#sortable2').find('li').each(
							function(index, value) {
								if ($('#sortable2 li:eq(' + index + ')').text()
										.split('.')[0] == $item.text()) {
									flag1 = false;
									return false;
								} else {
									flag1 = true;
								}
							});
				} else {
					flag1 = true;
				}
				if ($('#finish').find('li').length != 0) {
					$('#finish').find('li').each(
							function(index, value) {
								if ($('#finish li:eq(' + index + ')').text()
										.split('.')[0] == $item.text()) {
									flag2 = false;
									return false;
								} else {
									flag2 = true;
								}
							});
				} else {
					flag2 = true;
				}

				if (flag1 && flag2) {
					$item.clone().css("width", "100%").prepend(finish_icon)
							.prepend(delete_icon).appendTo($('#sortable2'))
							.fadeIn();
					$.ajax({
						type : "POST",
						url : "checkList.do",
						data : "command=addCheckList&toppingNo=" + $item.val(),

						success : function(data) {
							printList(data.list);
						}
					});
				}
			} else {
				$item.fadeOut(function() {
					$item.find("a.ui-icon-trash").remove();
					$item.find("a.ui-icon-refresh").remove().end().css("width",
							"100%").prepend(finish_icon).prepend(delete_icon)
							.appendTo($('#sortable2')).fadeIn();
				});//fadeout
			}//if-else

		}//recycleImage

		/* tourlist-finished 끝*/

		/* TourCheckList 삭제 */
		$(document).on(
				'click',
				'a.ui-icon-trash',
				function() {
					$(this).parent().remove();
					$.ajax({
						type : "POST",
						url : "checkList.do",
						data : "command=deleteCheckList&toppingNo="
								+ $(this).parent().val(),

						success : function(data) {
							printList(data.list);
						}//success
					});//ajax
				});//trash click

		/*  */
		$.ajax({
			type : "POST",
			url : "checkList.do",
			data : "command=getCheckList",

			success : function(data) {
				printList(data.list);
			}
		});//ajax
	});//function
	function printList(list) {
		var recycle_icon = "<a style='cursor:pointer;' title='Recycle this image' class='ui-icon ui-icon-refresh'>.Recycle image</a>";
		var finish_icon = "<a style='cursor:pointer;' title='Delete this image' class='ui-icon ui-icon-finish'>.Finish image</a>";
		var delete_icon = "<a style='cursor:pointer;' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";

		$('#sortable2').html('');
		$('#finish ul').html('');
		for (var i = 0; i < list.length; i++) {
			var content = "";
			var tclvo = list[i];
			var tvo = tclvo.toppingListVO;
			var name = "";
			if (tvo.activityBoardVO == null)
				name = "[Place]" + tvo.placeVO.placeName;
			if (tvo.placeVO == null)
				name = "[Activity]" + tvo.activityBoardVO.activityTitle;

			content += '<li style="text-align:center;font-size:1.2em;padding:4px;" id="toppingList" class="ui-state-default" value="'+tvo.toppingListNo+'">';
			content += name;
			if (tclvo.tourStatus == 0) {
				content += finish_icon + delete_icon;
				content += "</li>";
				$('#sortable2').append(content);
			}
			if (tclvo.tourStatus == 1) {
				content += recycle_icon + delete_icon;
				content += "</li>";
				$('#finish ul').append(content);
			}
		}
	}

	function updateList(toppingNo) {
		console.log("no : " + toppingNo);
		$.ajax({
			type : "POST",
			url : "checkList.do",
			data : "command=changeStateList&toppingNo=" + toppingNo,

			success : function(data) {
			}
		});
	}
</script>
</head>
<body>
 	<!--
        ==================================================
        Header Section Start
        ================================================== -->
	<!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
<%-- 	  	<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<%@include file="header_before_login.jsp"%>
				</c:when>
				<c:otherwise>
					<%@include file="header_after_login.jsp"%>
				</c:otherwise>
			</c:choose>
	 --%>
	 <c:choose>
		<c:when test="${sessionScope.mvo!=null}">
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
        
        </c:when>
		<c:otherwise>
        
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
                    <div class="navbar-brand">
                        <a href="main01.jsp" >
                            <img src="images/logo.png" alt="">
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">HOW?<span class="caret"></span></a>
                            	<div class="dropdown-menu">
                                    <ul>
                                        <li><a href="notice.do?command=getNoticeList&&page=1">NOTICE</a></li>
                                    </ul>
                               </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>
        </c:otherwise>
		</c:choose>
<!--
        ==================================================
        Notice Board Table
        ================================================== -->
	<div class="container">
		<div class="row" id="row-main">
		
			<!-- left-sdie-toppinglist -->
			<div class="col-md-4 topping-sidebar" id="sidebar-left">
				<h3 style="margin:20px 0;text-align: center;padding:5px 0;margin:20px 0;color:#ffffff">Topping</h3>
				<ul id="sortable1" class="connectedSortable">
				<c:forEach items="${requestScope.toppingList }" var="tvo">
					<c:if test="${tvo.activityBoardVO eq null}">
						<c:set var="name" value="[Place]${tvo.placeVO.placeName }"></c:set>
					</c:if>
					<c:if test="${tvo.placeVO eq null}">
						<c:set var="name" value="[Activity]${tvo.activityBoardVO.activityTitle }"></c:set>
					</c:if>
					<li id="toppingList" class="ui-state-default" value="${tvo.toppingListNo }">${name}</li>
				</c:forEach>
				</ul>
			</div>
			<!-- //left-sdie-toppinglist -->
			
			<div class="col-md-8" id="content">
				<div class="btn-group" role="group" aria-label="Controls" class="col-md-12">
					<button type="button" class="btn btn-danger toggle-sidebar-left">Topping</button>
				</div>
				<section class="col-md-12">
					<h3>TourList</h3>
					<div>
						<!-- Tourlist -->
						<div class="column">
						 
						  <div class="portlet">
						    <div class="portlet-header" style="text-align: center;">TourList</div>
						    <div class="portlet-content">
						    	<ul id="sortable2" class="connectedSortable sortable2 ui-helper-reset ui-helper-clearfix">
								  
								</ul>
							    
						    </div>
						  </div>

						</div>
						<!-- //Tourlist -->
							
						<!-- Finished -->
						<div class="column02">
						 <button class="btn" id="finished-Btn" type="button" data-toggle="collapse" data-target="#finish-slide">Finished</button>
						  <div  id="finish-slide" class="collapse" style="width:98%;">
						    <div class="ui-widget-content ui-state-default"  id="finish" style="background-color:#e9e9e9">
						    <ul></ul>
						    </div>
						  </div>
						</div>
						<!-- //Finished -->
					</div>
				</section>
			</div>
		</div>
	</div>	
 <script>
 /* 화면left-contnet 사이즈 조정 시작 */
		$(document).ready(function() {
				function toggleSidebar(side) {
						if (side !== "left" && side !== "right") {
								return false;
						}
						var left = $("#sidebar-left")
						var content = $("#content")
						var openSidebarsCount = 0
						var contentClass = "";

						// toggle sidebar
						if (side === "left") {
							left.toggleClass("collapsed");
						} else if (side === "content") {
							content.toggleClass("collapsed");
						}

						// determine number of open sidebars
						if (!left.hasClass("collapsed")) {
							openSidebarsCount += 1;
						}
						
						// determine appropriate content class
						if (openSidebarsCount === 0) {
							contentClass = "col-md-12";
						} else if (openSidebarsCount === 1) {
							contentClass = "col-md-8";
						}

						// apply class to content
						content.removeClass("col-md-12 col-md-8").addClass(contentClass);
						}
							$(".toggle-sidebar-left").click(function() {
								toggleSidebar("left");
								return false;
							});
						});
		 /* 화면left-contnet 사이즈 조정 끝 */
	</script>
		<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%-- <%@include file="footer.jsp"%> --%>
	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
            <footer id="footer">
                <div class="container">
                    <div class="col-md-8">
                        <p class="copyright">Copyright: <span>2016</span> . Design and Developed by <a href="#">VeryVery</a></p>
                    </div>
                    <div class="col-md-4">
                        <!-- Social Media -->
                        <ul class="social">
                            <li>
                                <a href="#" class="Facebook">
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Twitter">
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Linkedin">
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Google Plus">
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </footer> <!-- /#footer -->
 
</body>
</html>