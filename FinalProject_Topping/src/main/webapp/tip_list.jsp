<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>Tip List</title>
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
<!-- tip_list css -->
<link rel="stylesheet" href="css/tip_list.css">
<!-- Template Javascript Files
        ================================================== -->

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script src="js/owl.carousel.min.js"></script>



<script src="js/wow.min.js"></script>

<script src="js/slider.js"></script>
<script src="js/jquery.fancybox.js"></script>

<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- <script src="js/bootstrap-select.min.js"></script> -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->
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
		$(window).scroll(function() {
			if ($(this).scrollTop() > 450) {
				$('#page-top').fadeIn();
			} else {
				$('#page-top').fadeOut();
			}
		});

	});
	$(function() {
		$('#titleBox').keyup(function(e) {
			if (e.which == 13)
				$('#search_detail').trigger('click');
		});

		var list = new Array();
		<c:forEach items='${requestScope.tlvo.tipList}' var='tvo'>
		$.ajax({
			type : "POST",
			url : "tip.do",
			data : "command=clipWhetherCheck&tipNo=${tvo.tipNo}",

			success : function(data) {
				var map = data.resMap;
				var checkpath = "";
				if (map.status == true) {
					checkpath = "./images/clip_0.png";
				} else {
					checkpath = "./images/clip_1.png";
				}
				$('#clipimage_' + map.tipNo).attr('src', checkpath);
			}
		});
		</c:forEach>
	});

	$(function() {
		var num = 0;
		$('#detatilBtn').click(function() {
			if (num == 0) {
				$('#accordion').css('display', 'block');
				num = 1;
			} else {
				//$('#ss').remove();			  			
				$('#accordion').css('display', 'none');
				num = 0;
			}
		}); //click

		/* Search */
		var type = [];
		var search_title = "";
		function search(pageNo) {
			console.log("search :: " + pageNo);
			var command = "command=getTipBoardSearchList";
			search_title = $('#titleBox').val();
			type = [];
			$('input[type=checkbox]:checked').each(function() {
				type.push(this.value);
			});
			if (search_title != "")
				command += "&title=" + search_title;
			if (type != null && type.length != 0)
				command += "&type=" + type;
			if (pageNo != null && pageNo != "")
				command += "&pageNo=" + pageNo;
			console.log("title :: " + search_title);
			console.log("type :: " + type);
			console.log("command :: " + command);

			$
					.ajax({
						type : "POST",
						url : "tip.do",
						data : command,
						success : function(data) {
							var content = "";
							var list = data.list.tipList;
							var paging = data.list.pagingBean;

							console.log("command2 :: " + command);
							console.log("list.tipList:: " + list.length);
							if (list.length != 0) {
								for (var i = 0; i < list.length; i++) {
									console.log("i :: " + i);
									console.log("list :: " + list[i].tipNo);
									content += '<table class="table tip-list-table" style="border-spacing: 0px!important;border-style: none!important;padding:0px!important">';
									content += '<tr>';
									console.log("list :: " + list[i]);
									if (list[i].img.length == 0) {
										console.log("이미지 없음!");
										content += '<td rowspan=3 class="pic" width="25%" style="text-align: right;border-spacing: 0px!important;border-style: none!important;padding:0px!important">';
										content += '<img src="./images/tipimg.jpg" width="130px" height="130px"></td>';
									} else {
										console.log("이미지 있음!");
										content += '<td rowspan=3 class="pic" width="25%" style="text-align: right;border-spacing: 0px!important;border-style: none!important;padding:0px!important">';
										content += '<img src="./tip_upload/'+list[i].img[0].newName+'" width="130px" height="130px"></td>';
									}
									content += '<td colspan="2" style="background-color: #f5f5f5;border-bottom: 2px solid #333;" id="title">';
									content += '<a href="tip.do?command=showTipByNo&&tipNo='
											+ list[i].tipNo
											+ '"><h4>&nbsp;'
											+ list[i].title + '</h4></a></td>';
									content += '<td style="background-color: #f5f5f5;border-bottom: 2px solid #333;vertical-align:middle;text-align: right;padding-right:20px;">';
									content += '<img id="clipimage_'+list[i].tipNo+'" src="">&nbsp;'
											+ list[i].clipCount
											+ '</span></td></tr>';
									$
											.ajax({
												type : "POST",
												url : "tip.do",
												data : "command=clipWhetherCheck&tipNo="
														+ list[i].tipNo,

												success : function(data) {
													console
															.log(data.resMap.tipNo);
													var map = data.resMap;
													var checkpath = "";
													if (map.status == true) {
														checkpath = "./images/topping_0.png";
													} else {
														checkpath = "./images/topping_1.png";
													}

													$('#clipimage_' + map.tipNo)
															.attr('src',
																	checkpath);
												}
											});
									content += '<tr style="background-color: #f5f5f5;">';
									content += '<td width="30%">NickName&nbsp;&nbsp;|&nbsp;&nbsp;'
											+ list[i].memberVO.nickName
											+ '</td>';
									content += '<td width="15%">Date&nbsp;&nbsp;|&nbsp;&nbsp;'
											+ list[i].writeDate + '</td>';
									content += '<td width="15%">Type&nbsp;&nbsp;|&nbsp;&nbsp;'
											+ list[i].type + '</td></tr>';
									content += '<tr style="background-color: #f5f5f5;">';
									content += '<td colspan="3" style="overflow:hidden;"><div>'
											+ list[i].content.substring(0, 5)
											+ '</div></td></tr>';
									content += '</table><hr style="border:1px solid #fff">';
									console.log("i+ :: " + i);
								}//for
								content += '<div id="tip-list-footer"><div id="tip-list-paging" class="col-md-8">';
								if (paging.previousPageGroup == true) {
									content += '<a id="pagingNumber" style="cursor:pointer;" value="'+paging.startPageOfPageGroup-1+'">&nbsp;&nbsp;';
								}
								for (var j = paging.startPageOfPageGroup; j <= paging.endPageOfPageGroup; j++) {
									if (paging.nowPage != j) {
										content += '<a id="pagingNumber" style="cursor:pointer;" value="'+j+'">'
												+ j + '&nbsp</a>';
									} else {
										content += j;
									}
									content += "&nbsp;&nbsp;&nbsp;&nbsp;";
								}
								content += '&nbsp;&nbsp;';
								if (paging.nextPageGroup == true) {
									content += '<a id="pagingNumber" style="cursor:pointer;" value="'+paging.endPageOfPageGroup+1+'"></a>';
								}
								content += '</div></div>';
								console.log("i++ :: " + i);
								content += '<div class="col-md-4"><div id="tip-writeBtn"><a href="write_tip.jsp">Write</a></div></div>';

							} else {
								content += "<h5 style='text-align:center;'>No Matching Search</h5>";
							}
							$('#tipAppend').html(content);
						}//success
					});//ajax
		}

		$('#search_detail').click(function() {
			search();
			$('#accordion').css('display', 'none');
			$('#titleBox').val("");

		});
		$(document).on('click', 'a#pagingNumber', function() {
			console.log("pagingNumber Click! > " + $(this).attr('value'));
			search($(this).attr('value'));

		});

	});
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

#page-top {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
	cursor: pointer;
}

#page-top a {
	text-decoration: none;
}

#page-top:hover {
	color: orange;
}

.img01 img {
	/* border:2px solid #f5f5f5!important; */
	/* border:2px solid #333333!important; */
	border: 1px solid #e5e5e5 !important;
	padding: 0px;
	margin: 0px;
}

/*상세검색*/
#accordion {
	display: none;
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
			<%@include file="header_before_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="header_after_login.jsp"%>
		</c:otherwise>
	</c:choose>
	<!--
        ==================================================
        Notice Board Table
        ================================================== -->
	<!--main content start-->
	<div class="col-md-12">
		<section class="col-md-1"></section>
		<section id="main-content" class="col-md-10">
			<div id="how-tabs">
				<ul>
					<li><a href="tip.do?command=getTipBoardList&&page=1"
						class="check01"><span
							class="glyphicon glyphicon-option-vertical"
							style="color: GreenYellow;"></span>&nbsp;TipBoard</a></li>
					<li><a href="freeboard.do?command=getFreeBoardList&&page=1"
						class="check02">FreeBoard</a></li>
				</ul>
			</div>
			<br>

			<!-- tip_list.jsp 내용들 -->
			<div id="Tip">
				<section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-lg-12">
							<ol class="breadcrumb"
								style="background-color: #333; color: #fff;">
								<li><span class="glyphicon glyphicon-home"
									style="color: #ffffff;"></span>&nbsp;Home</li>
								<li>Community</li>
								<li>TipBoard</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->
					<!-- 테이블-->
					<div class="row">
						<div class="col-lg-12">


							<!-- 상세검색 -->
							<!-- search form -->
							<div class="row" style="margin: 0 auto; margin-top: 50px;">
								<div class="col-xs-8 col-xs-offset-2">
									<div class="input-group" style="width: 100%;">
										<input type="hidden" name="search_param" value="all"
											id="search_param"> <input type="text" id="titleBox"
											class="form-control" name="x" style="height: 40px;"
											placeholder="Search Tip">
										<p>
										<div class="input-group-btn">
											<span><a href="#"><img id="search_detail"
													src="./images/search_icon.jpg" style="margin-right: 1px"
													onmouseover="this.src='./images/search_icon_on.jpg'"
													onmouseleave="this.src='./images/search_icon.jpg'"> ></a></span>
											<button type="button" class="btn btn-default" id="detatilBtn"
												style="border-radius: 0px; border-color: #cccccc; height: 40px;"
												id="createSection">Detail Search</button>
										</div>
									</div>
								</div>
							</div>

							<!--  detail Search -->
							<div id="accordion"
								style="margin: 0auto; margin-left: 10%; margin-top: 15px; width: 80%;">

								<div class="row"
									style="margin-left: 5%; margin-right: 5%; border-top: 2px solid #ececec; text-align: center;">
									<h3 align="center">Detail Search</h3>
									<form name="detailSelectBox" id="detailSelectBox">
										<span style="margin-right: 5px;"><img
											src="./images/type_icon.jpg"></span> <span><font
											style="color: #414141;"><b>Tip Board Type Select</b></font></span><br>
										<label class="checkbox-inline" style="margin-left: 10px;">
											<input type="checkbox" id="inlineCheckbox1" value="Tour">Tour
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox2" value="Party">Party
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox3" value="Shopping">Shopping
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox4" value="Music">Music
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox5" value="Movie">Movie
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox6" value="Art">Art
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox8" value="Beauty">Beauty
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox9" value="Sport">Sport
										</label> <label class="checkbox-inline"> <input
											type="checkbox" id="inlineCheckbox10" value="Food">Food
										</label>

										<p style="margin-bottom: 10px;"></p>
									</form>
								</div>
							</div>
							<hr style="border: 1px solid #ffffff;">
							<!-- //상세검색 -->


							<section class="col-lg-1"></section>

							<section id="tipAppend" class="panel col-lg-9">
								<c:forEach var="tvo" items="${requestScope.tlvo.tipList}">

									<table class="table tip-list-table"
										style="border-spacing: 0px !important; border-style: none !important; padding: 0px !important">
										<tr>
											<c:choose>
												<c:when test="${tvo.img[0].newName==null}">
													<td class="img01" rowspan=3 class="pic" width="25%"
														style="text-align: right; border-spacing: 0px !important; border-style: none !important; padding: 0px !important">
														<img src="./images/tipimg.jpg" width="130px"
														height="130px">
													</td>
												</c:when>
												<c:otherwise>
													<td class="img01" rowspan=3 class="pic" width="25%"
														style="text-align: right; border-spacing: 0px !important; border-style: none !important; padding: 0px !important">
														<img src="./tip_upload/${tvo.img[0].newName}"
														width="130px" height="130px">
													</td>
												</c:otherwise>
											</c:choose>
											<td colspan="2"
												style="background-color: #f5f5f5; border-bottom: 2px solid #333;"
												id="title"><a
												href="tip.do?command=showTipByNo&&tipNo=${tvo.tipNo}"><h4>&nbsp;${fn:substring(tvo.title,0,55)}</h4></a>
											</td>
											<td
												style="background-color: #f5f5f5; border-bottom: 2px solid #333; vertical-align: middle; text-align: right; padding-right: 20px;">
												<img id="clipimage_${tvo.tipNo}" src="">&nbsp;<span
												id="clipCount">${tvo.clipCount}</span>
											</td>
										</tr>
										<tr style="background-color: #f5f5f5;">
											<td width="30%">NickName&nbsp;&nbsp;|&nbsp;&nbsp;<a
												onclick="window.open('MyPage.jsp?email=${tvo.memberVO.email}','MyPage', 'width=760, height=620, menubar=no, location=no, status=no, fullscreen=no, toolbar=no, top=0')"
												target="_blank" style="cursor: pointer;">${tvo.memberVO.nickName}</a></td>
											<td width="15%">Date&nbsp;&nbsp;|&nbsp;&nbsp;${tvo.writeDate}</td>
											<td width="15%">Type&nbsp;&nbsp;|&nbsp;&nbsp;${tvo.type}</td>
										</tr>
										<tr style="background-color: #f5f5f5;">
											<td colspan="3" style="overflow: hidden;">
												<div>${fn:substring(tvo.content,0,20)}...</div>
											</td>
										</tr>
									</table>
									<hr style="border: 1px solid #fff">

								</c:forEach>

								<!-- 페이징 -->
								<div id="tip-list-footer">
									<div id="tip-list-paging" class="col-md-8">
										<!-- 페이징처리 -->
										<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.--%>
										<c:if test="${requestScope.tlvo.pagingBean.previousPageGroup}">
											<a
												href="tip.do?command=getTipBoardList&pageNo=${requestScope.tlvo.pagingBean.startPageOfPageGroup-1}">
												◀<!-- <img src="../img/left_arrow_btn.gif"> -->
											</a>
										</c:if>
										&nbsp;&nbsp;
										<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의 시작페이지~~마지막페이지까지 화면에 보여준다.--%>
										<c:forEach var="i"
											begin="${requestScope.tlvo.pagingBean.startPageOfPageGroup}"
											end="${requestScope.tlvo.pagingBean.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${requestScope.tlvo.pagingBean.nowPage!=i}">
													<a href="tip.do?command=getTipBoardList&pageNo=${i}">${i}&nbsp</a>
												</c:when>
												<c:otherwise>${i}&nbsp;</c:otherwise>
											</c:choose>

										</c:forEach>
										&nbsp;&nbsp;
										<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다. --%>
										<c:if test="${requestScope.tlvo.pagingBean.nextPageGroup}">
											<a
												href="tip.do?command=getTipBoardList&pageNo=${requestScope.tlvo.pagingBean.endPageOfPageGroup+1}">
												<!-- <img src="../img/right_arrow_btn.gif"> --> ▶
											</a>
										</c:if>
									</div>
									<div class="col-md-4">
										<div id="tip-writeBtn">
											<a href="write_tip.jsp">Write</a>
										</div>
									</div>
								</div>
								<!-- //페이징 -->
							</section>
							<section class="col-lg-2"></section>
						</div>
					</div>
				</section>
			</div>
		</section>
		<section class="col-md-1"></section>
	</div>

	<!-- ==================================================
            Scroll Top
            ================================================== -->
	<div id="page-top">
		<span><img src="./images/top_1.png"></span>
	</div>
	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>