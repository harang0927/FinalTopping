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
<title>Notice Write</title>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- notice_write css -->
<link rel="stylesheet" href="css/notice_write.css">

<!-- Template Javascript Files
        ================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	.color05{
	color:red; 
	}
</style>
<script type="text/javascript">
function content_submit(){
	var f=document.write_form;
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

$(function(){
	$(".notice-write-input").focus(function(){
		/* $(this).css('background-color','#D3D3D3').css('border','1px solid #02bdd5'); */
		$(this).css('background-color','#D3D3D3');
	});
	$(".notice-write-input").blur(function(){
		/* $(this).css('background-color','#f5f5f5').css('border','1px solid #ccc'); */
		$(this).css('background-color','#f5f5f5');
	});
});
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
<div class="col-lg-12">
	<section class="col-md-2"></section>
	<section class="col-md-8" id="wirtenotice">
		<h3><span class="glyphicon glyphicon-option-vertical color05"></span>Notice</h3>
		<form action="notice.do" method="post" name="write_form" onsubmit="return content_submit()">
			<input type="hidden" name="command" value="writeNotice"> 
			<input type="hidden" name="email" value="${sessionScope.mvo.email}">
			<table class="table notice-write-table">
				<tr>
					<th width="20%">Title<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
					<th width="80%"><input class="notice-write-input" type="text" name="title" maxlength="50" style="width:90%;" required="required"></th>
				</tr>
				<tr>
					<th width="20%">Name<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
					<th width="80%">${sessionScope.mvo.nickName}</th>
				</tr>
				<tr>
					<td colspan="2">
						<textarea class="col-md-12 notice-write-input" rows="15" name="noticeContent" style="width: 100%" required="required"></textarea>
					</td>
				</tr>
				<tr align="right">
					<td colspan="2">
						<input type="submit" value="Complete">
						<a class="notice-write-cancel" style="padding:7px" href="notice.do?command=getNoticeList&&page=1">Cancel</a> 
					</td>
				</tr>
			</table>
		</form>
		<section class="col-md-2"></section>
	</section>
</div>
	<!--================//글쓰기폼====================-->

	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>