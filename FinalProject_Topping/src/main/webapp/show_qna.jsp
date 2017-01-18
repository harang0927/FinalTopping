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
<title>Show QnA</title>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- show_qna css -->
<link rel="stylesheet" href="css/show_qna.css">

<!-- Template Javascript Files
        ================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	.color01{
		color:orange;
	}
	.color02{
		color:purple;
	}
	
	input[type=button]:hover, #qnashowBtn a:hover{
		background-color: #f5f5f5!important;
		color : #23527c!important;
		border: 1px solid #23527c!important;
		cursor: pointer!important;
	}
</style>
<script type="text/javascript">
	function deleteQnA() {
		if(confirm("Are you sure you want to delete it?")){
		//확인을 선택하면 이곳에서 페이지를 이동
			location.href="qna.do?command=deleteQnA&&qnaNo=${qnavo.qnaNo}";
		}			
	}
	
	function answerQnA() {
		if(confirm("Do you want to answer?")){
			//확인을 선택하면 이곳에서 페이지를 이동
			location.href="answer_qna.jsp?questionNo=${qnavo.qnaNo}&&title=${qnavo.title}&&email=${qnavo.memberVO.email}";
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
	<div class="col-md-12">
			<section class="col-md-2"></section>
			<section class="col-md-8" id="showqna">
			<c:choose>
				<c:when test="${sessionScope.mvo.checkAdmin==2}">
					<h3><span class="glyphicon glyphicon-option-vertical color02"></span>QnA</h3>
				</c:when>
				<c:otherwise>
					<h3><span class="glyphicon glyphicon-option-vertical color01"></span>QnA</h3>
				</c:otherwise>
			</c:choose>
			
				<table id="showqna-table" class="table">
					
						<c:choose>
							<c:when test="${sessionScope.mvo.checkAdmin==2}">
								<tr>
									<th width="30%">QuestionNo<span class="color02">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.questionNo}</th>
									<th width="70%">Title<span class="color02">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.title}</th>
								</tr>
								<tr>
									<th width="30%">E-Mail<span class="color02">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.memberVO.email}</th>
									<th width="70%">Date<span class="color02">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.writeDate}</th>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th width="100%" colspan="2">Title<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.title}</th>
								</tr>
								<tr>
									<th width="30%">E-Mail<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.memberVO.email}</th>
									<th width="70%">Date<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${qnavo.writeDate}</th>
								</tr>	
							</c:otherwise>
						</c:choose>
					
		 			<tr>
						<td colspan="2">
							<textarea rows="15" style="resize:none;width:100%;border:none;">${qnavo.content}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						Thank you for your interest. You can get answers from Mypage.
						</td>
					</tr>
					<tr>
						<td valign="middle" colspan="2">
							<div id="qnashowBtn">
								<c:if test="${qnavo.admin==null }">
									<c:choose>
										<c:when test="${sessionScope.mvo.checkAdmin==2}">
											<input type="button" value="Answer" onclick="answerQnA()">
											<a style="padding:7px" href="qna.do?command=qnaAdminList&&page=1">List</a>
										</c:when>
										<c:otherwise>
										<c:if test="${sessionScope.mvo.email==qnavo.memberVO.email}">
											<c:if test="${qnavo.admin==null}">
												<a href="write_qna.jsp" style="padding: 6px;">Confirm</a> 
												<input type="button" value="Delete" onclick="deleteQnA()">
											</c:if>
										</c:if>	
										</c:otherwise>
									</c:choose>
								</c:if> 
							</div>
						</td>
					</tr>
				</table>
			</section>
			<section class="col-md-2"></section>
	</div>
	<!--================//글쓰기폼====================-->

	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>