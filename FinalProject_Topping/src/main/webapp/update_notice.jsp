<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>Update Notice</title>

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
<!-- updatenotice css -->
<link rel="stylesheet" href="css/update_notice.css">
<!-- Template Javascript Files
        ================================================== -->
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<style type="text/css">
	.color05{
	color:red; 
	}
</style>
<script type="text/javascript">
$(function(){
	$(".notice-update-input").focus(function(){
		$(this).css('background-color','#D3D3D3');
	});
	$(".notice-update-input").blur(function(){
		$(this).css('background-color','#f5f5f5');
	});
});

function content_submit(){
	var f=document.update_form;
	if(f.title.value==""){
		alert("Please fill out the title");
		f.title.focus();
		return false; 
	}else if(f.noticeContent.value==""){
		alert("Please fill out the content");
		f.noticeContent.focus();
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
			<%@include file="header_before_login.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="header_after_login.jsp"%>
		</c:otherwise>
	</c:choose>
	<!--================글쓰기폼====================-->
	<div class="col-sm-12">
			<section class="col-sm-2"></section>
			<section class="col-sm-8" id="updatenotice">
			<h3><span class="glyphicon glyphicon-option-vertical color05"></span>Notice</h3>
				<form method="post" action="notice.do" name="update_form" onsubmit="return content_submit()">
					<input type="hidden" name="command" value="updateNotice">	
					<table class="table update-notice-table">
					<tr>
						<th width="20%">No<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input style="border:none;" type="text" name="noticeNo" value="${nvo.noticeNo}" readonly></th>
						<th width="80%" colspan="2">Title<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input class="notice-update-input" style="width:90%;" type="text" name="title" maxlength="50" value="${nvo.title}"></th>
					</tr>
					<tr>	
						<th width="20%">Name<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${nvo.memberVO.nickName}</th>
						<th width="50%">Date<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${nvo.writeDate}</th>	
						<th width="30%">Hits<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${nvo.hits}</th>	
					</tr>
					<tr align="center">
						<td colspan="3">
							<textarea class="col-sm-12 notice-update-input" rows="15" name="noticeContent">${nvo.noticeContent}</textarea>
						</td>
					</tr>
					<tr align="right">
						<td colspan="3">
							<input type="submit" value="Modify">
							<a class="notice-update-cancel" style="padding:7px" href="notice.do?command=getNoticeList&&page=1">Cancel</a> 			
						</td>
					</tr>
				  </table>
			  </form>
			</section>
			<section class="col-sm-2"></section>
	</div>
	<!--================//글쓰기폼====================-->

	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>