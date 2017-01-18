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
<title>Freeboard_Write</title>

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

<!-- posting css -->
<link rel="stylesheet" href="css/posting.css">
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

<script src="js/bootstrap-select.min.js"></script>


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

	#wirtefree{
	margin-top:120px;
}
.free-write-table{
	table-layout: fixed;
}

input[type=submit],.free-write-cancel{
	margin-right: 15px;
	padding: 5px 10px;
	background-color: #333;
	color : #f5f5f5;
	border-radius : 4px;
	border: 1px solid #333;
	text-align: right;
}

input[type=submit]:hover,.free-write-cancel:hover{
	background-color: #f5f5f5;
	color : #23527c;
	border: 1px solid #23527c;
	cursor: pointer;
}

textarea{
	resize:none;
	scrollbar-face-color:#333;
	scrollbar-arrow-color:#333;
}

.free-write-input{
	padding : 5px;
	font-size: 13px;
	line-height: 1.42857143;
	color: #333;
	word-break: break-word;
	word-wrap: break-word;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 4px;
}

table tr td{
	vertical-align: middle;
}

.color01{
	color:#02bdd5; 
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
	$(".free-write-input").focus(function(){
		/* $(this).css('background-color','#D3D3D3').css('border','1px solid #02bdd5'); */
		$(this).css('background-color','#D3D3D3');
	});
	$(".free-write-input").blur(function(){
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
<div class="col-sm-12">
	<section class="col-sm-2"></section>
	<section class="col-sm-8" id="wirtefree">
		<h3><span class="glyphicon glyphicon-option-vertical color01"></span>Free Board</h3>
		<form action="freeboard.do" method="post" name="write_form" onsubmit="return content_submit()">
			<input type="hidden" name="command" value="addPostingToFreeBoard"> 
			<%-- <input type="hidden" name="email" value="${sessionScope.mvo.email}"> --%>
			<table class="table free-write-table">
				<tr>
					<th width="10%">Title<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
					<th width="25%">
						<select name="postingHeader" style="width:100%">
							<option value="Request Guide">Request Guide</option>
							<option value="Posting">Posting</option>
						</select>		
					</th>
					<th width="65%"><input class="free-write-input" type="text" name="postingTitle" maxlength="100" style="width:90%;" required="required"></th>
				</tr>
				<tr>
					<th width="10%">Name<span class="check01">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
					<th width="90%" colspan="2">${sessionScope.mvo.nickName}</th>
				</tr>
				<tr>
					<td colspan="3">
						<textarea class="col-sm-12 free-write-input" rows="15" name="content" required="required"></textarea>
					</td>
				</tr>
				<tr align="right">
					<td colspan="3">
						<input type="submit" value="Complete"> 
						<a class="free-write-cancel" style="padding:7px" href="freeboard.do?command=getFreeBoardList&&page=1">Cancel</a>
					</td>
				</tr>
			</table>
		</form>
		<section class="col-sm-2"></section>
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