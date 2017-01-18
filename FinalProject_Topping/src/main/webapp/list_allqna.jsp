<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/png" href="images/favicon.png">
<title>List All QnA</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- list_allqna css -->
<link rel="stylesheet" href="css/list_allqna.css">

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
		color:BlueViolet ;
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
	<div class="col-lg-12">
	<section class="col-md-1"></section>
	<section id="main-content" class="col-md-10">
	<div id="how-tabs">
	  <ul>
	    <li><a href="notice.do?command=getNoticeList&&page=1" class="check02">Notice</a></li>
	    <li><a href="write_qna.jsp" class="check02">QnA</a></li>
	    <c:if test="${sessionScope.mvo!=null}">
			<c:if test="${sessionScope.mvo.checkAdmin==2}">
				<li><a href="qna.do?command=qnaAdminList&&page=1" class="check01"><span class="glyphicon glyphicon-option-vertical color01"></span>QnA-Answer</a></li>
			</c:if>
		</c:if>
	  </ul>
	</div>

	  <!-- list_allqna.jsp 내용들 -->
	    <div id="notice">
	      <section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-md-12">
							<ol class="breadcrumb">
								<li><span class="glyphicon glyphicon-home"></span>&nbsp;Home</li>
								<li>How?</li>
								<li>QnA-Answer</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->
					<!-- 테이블-->
					<div class="row">
						<div class="col-md-12">
							<section>
							
							</section>
							<section class="panel">
								<table class="table table-hover qna-list-table">
									<thead>
										<tr>
											<th width="10%">No</th>
											<th width="35%">Title</th>
											<th width="15%">Questioner</th>
											<th width="15%">Respondent</th>
											<th width="10%">QuestionerNum</th>
											<th width="15%">Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="qlvo" items="${requestScope.qlvo.list}">
											<tr>
												<td>${qlvo.qnaNo}</td>
												<td><a id="QnABtn" href="qna.do?command=showQnA&&qnaNo=${qlvo.qnaNo}">${qlvo.title}</a></td>
												<td>${qlvo.memberVO.email}</td>
												<td>${qlvo.admin}</td>
												<td>${qlvo.questionNo }
												<td>${qlvo.writeDate}</td>	
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- 페이징 -->
								<div id="qna-list-footer">
									<div id="qna-list-paging" class="col-md-8">
										<!-- 페이징처리 -->
										<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.--%>
										<c:if test="${requestScope.qlvo.pagingBean.previousPageGroup}">
											<a href="qna.do?command=qnaAdminList&pageNo=${requestScope.qlvo.pagingBean.startPageOfPageGroup-1}">
											◀<!-- <img src="../img/left_arrow_btn.gif"> --></a>
										</c:if>
										&nbsp;&nbsp;
										<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의 시작페이지~~마지막페이지까지 화면에 보여준다.--%>
										<c:forEach var="i"
											begin="${requestScope.qlvo.pagingBean.startPageOfPageGroup}"
											end="${requestScope.qlvo.pagingBean.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${requestScope.qlvo.pagingBean.nowPage!=i}">
													<a href="qna.do?command=qnaAdminList&pageNo=${i}">${i}&nbsp</a>
												</c:when>
												<c:otherwise>${i}&nbsp;</c:otherwise>
											</c:choose>
	
										</c:forEach>
										&nbsp;&nbsp;
										<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다. --%>
										<c:if test="${requestScope.qlvo.pagingBean.nextPageGroup}">
											<a href="qna.do?command=qnaAdminList&pageNo=${requestScope.qlvo.pagingBean.endPageOfPageGroup+1}">
												<!-- <img src="../img/right_arrow_btn.gif"> --> ▶
											</a>
										</c:if>
									</div>
								</div>
								<!-- //페이징 -->
							</section>
						</div>
					</div>
					<!-- //테이블-->
				</section>
	    </div>
	    <!-- //list_allqna.jsp 내용들 -->
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