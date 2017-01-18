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
<title>Write QnA</title>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- Write QnA css -->
<link rel="stylesheet" href="css/write_qna.css">

<!-- Template Javascript Files
        ================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	.check01{
	color:#333333;
	}
	
	.check02{
		color:#cccccc;
	}
	
	.color01{
		color:orange;
	}
</style>
<script type="text/javascript">
function qna_content_submit(){
	var f=document.qna_form;
	if(f.title.value==""){
		alert("Please fill out the title");
		f.title.focus();
		return false; 
	}else if(f.content.value==""){
		alert("Please fill out the content");
		f.content.focus();
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
	    <li><a href="notice.do?command=getNoticeList&&page=1" class="check02">Notice</a></li>
	    <li><a href="write_qna.jsp" class="check01"><span class="glyphicon glyphicon-option-vertical color01"></span>QnA</a></li>
	    <c:if test="${sessionScope.mvo!=null}">
			<c:if test="${sessionScope.mvo.checkAdmin==2}">
				<li><a href="qna.do?command=qnaAdminList&&page=1" class="check02">QnA-Answer</a></li>
			</c:if>
		</c:if>
	  </ul>
	</div>
	    <!-- qna.jsp 내용들 -->
	    <div id="qna">
			<section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><span class="glyphicon glyphicon-home"></span>&nbsp;Home</li>
								<li>How?</li>
								<li>QnA</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->
	
					<!-- 테이블-->
					<div class="row">
						<div class="col-md-12">
							<section class="col-md-2"></section>
							<section class="col-md-8" id="wirtenotice">
							<form action="qna.do" method="post" name="qna_form" onsubmit="return qna_content_submit()">
								<input type="hidden" name="command" value="writeQuestion"> 
								<table class="table qna-table">
									<tr>
										<th width="20%">E-Mail<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
										<th width="80%"><input class="qna-write-input" type="text" name="memberVO.email" id="email" value="${sessionScope.mvo.email}" readonly="readonly" style="width:90%;"></th>
									</tr>
									<tr>
										<th width="20%">Title<span class="color01">&nbsp;&nbsp;|&nbsp;&nbsp;</span></th>
										<th width="80%"><input class="qna-write-input" type="text" name="title" id="title" maxlength="50" style="width:90%;" required="required"></th>
									</tr>
										<tr>
										<td colspan="2">
											<textarea style="width: 100%;resize:none" class="col-sm-12 qna-write-input" rows="15" name="content" id="content" required="required"></textarea>
										</td>
									</tr>
									<tr align="right">
										<td colspan="2">
											<input type="submit" value="Send">
										</td>
									</tr>
								</table>
							</form>
							<section class="col-md-2"></section>
						</section>	
						</div>
					</div>
					<!-- //테이블-->
				</section>
	    </div>
	    <!-- //qna.jsp 내용들 -->

	</section>
<section class="col-md-1"></section>
</div>


	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>