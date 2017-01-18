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
<title>Answer_QnA</title>

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
<!-- notice_write css -->
<link rel="stylesheet" href="css/answer_qna.css">
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
	.color01{
		color:BlueViolet;
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
	<!--================글쓰기폼====================-->
<div class="col-sm-12">
	<section class="col-sm-2"></section>
	<section class="col-sm-8" id="answerqna">
		<h3><span class="glyphicon glyphicon-option-vertical color01"></span>QnA-Answer</h3>
		<form action="qna.do" method="post">
			<input type="hidden" name="command" value="answerForUserQnA"> 
			<table class="table qna-answer-table">
				<tr>
					<th width="40%">Receiver<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input class="qna-send-input2" type="text" name="memberVO.email" id="memberVO.email" value="${param.email}" readonly="readonly"></th>
					<th width="60%">Admin<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input class="qna-send-input2" type="text" name="admin" id="admin" value="${sessionScope.mvo.nickName}" readonly="readonly"></th>
				</tr>
				<tr>
					<th width="40%">QuestionNo<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input class="qna-send-input2" type="text" name="questionNo" id="questionNo" value="${param.questionNo}" readonly="readonly"></th>
					<th width="60%">Title<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span><input class="qna-send-input" type="text" name="title" id="title" value="RE:[${param.title}] 답변입니다." style="width:90%;" required="required"></th>
				</tr>
				<tr>
					<td colspan="3">
						<textarea class="col-sm-12 qna-send-input" rows="15" name="content" id="content" required="required"></textarea>
					</td>
				</tr>
				<tr align="right">
					<td colspan="3">
						<input type="submit" value="Send">
						<a class="qna-answer-cancel" style="padding:7px" href="qna.do?command=qnaAdminList&&page=1">Cancel</a> 
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


</form>
</body>
</html>