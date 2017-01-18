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
<title>Notice</title>
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
<!-- notice css -->
<link rel="stylesheet" href="css/notice.css">
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

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<div class="col-sm-12">
	<section class="col-sm-1"></section>
	<section id="main-content" class="col-sm-10">
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#notice">Notice</a></li>
	    <li><a data-toggle="tab" href="#qna">QnA</a></li>
	  </ul>
	  <div class="tab-content">
	  
	  <!-- notice.jsp 내용들 -->
	    <div id="notice" class="tab-pane fade in active">
	      <section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-lg-12">
							<ol class="breadcrumb">
								<li>Home</li>
								<li>How?</li>
								<li>Notice</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->
					<!-- 테이블-->
					<div class="row">
						<div class="col-lg-12">
							<section class="panel">
								<table class="table table-hover notice-table">
									<thead>
										<tr>
											<th width="10%">No</th>
											<th width="50%">Title</th>
											<th width="15%">Name</th>
											<th width="15%">Date</th>
											<th width="10%">Hits</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="nvo" items="${requestScope.lvo.list}">
											<tr>
												<td>${nvo.noticeNo}</td>
												<td class="notice-title"><a href="notice.do?command=showNotice&&noticeNo=${nvo.noticeNo}">${nvo.title}</a></td>
												<td>${nvo.memberVO.nickName}</td>
												<td>${nvo.writeDate}</td>
												<td>${nvo.hits}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- 글쓰기&페이징 -->
								<div id="notice-footer">
									<div id="notice-paging" class="col-sm-8">
										<!-- 페이징처리 -->
										<%-- 이전 페이지 그룹이 있으면 이미지 보여준다.--%>
										<c:if test="${requestScope.lvo.pagingBean.previousPageGroup}">
											<a href="notice.do?command=getNoticeList&pageNo=${requestScope.lvo.pagingBean.startPageOfPageGroup-1}">
											◀<!-- <img src="../img/left_arrow_btn.gif"> --></a>
										</c:if>
										&nbsp;&nbsp;
										<%-- PagingBean 을 이용해서 현재 페이지에 해당되는 페이지그룹의 시작페이지~~마지막페이지까지 화면에 보여준다.--%>
										<c:forEach var="i"
											begin="${requestScope.lvo.pagingBean.startPageOfPageGroup}"
											end="${requestScope.lvo.pagingBean.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${requestScope.lvo.pagingBean.nowPage!=i}">
													<a href="notice.do?command=getNoticeList&pageNo=${i}">${i}&nbsp</a>
												</c:when>
												<c:otherwise>${i}&nbsp;</c:otherwise>
											</c:choose>
	
										</c:forEach>
										&nbsp;&nbsp;
										<%-- 다음 페이지 그룹이 있으면 화살표 이미지를 보여준다. --%>
										<c:if test="${requestScope.lvo.pagingBean.nextPageGroup}">
											<a href="notice.do?command=getNoticeList&pageNo=${requestScope.lvo.pagingBean.endPageOfPageGroup+1}">
												<!-- <img src="../img/right_arrow_btn.gif"> --> ▶
											</a>
										</c:if>
									</div>
									
									<div id="notice-writeBtn" class="col-sm-4">
										<c:if test="${sessionScope.mvo.checkAdmin==2}">
											<a href="notice_write.jsp">Write</a>
										</c:if>
									</div>
								</div>
								<!-- //글쓰기&페이징 -->
							</section>
						</div>
					</div>
					<!-- //테이블-->
				</section>
	    </div>
	    <!-- //notice.jsp 내용들 -->
	    
	    
	    
	    <!-- qna.jsp 내용들 -->
	    <div id="qna" class="tab-pane fade">
			<section class="wrapper">
					<!-- 테이블경로 -->
					<div class="row">
						<div class="col-lg-12">
							<ol class="breadcrumb">
								<li>Home</li>
								<li>How?</li>
								<li>QnA</li>
							</ol>
						</div>
					</div>
					<!-- //테이블경로 -->
	
					<!-- 테이블-->
					<div class="row">
						<div class="col-lg-12">
							<section class="col-sm-2"></section>
							<section class="col-sm-8" id="wirtenotice">
							<form action="qna.do" method="post" name="qna_form" onsubmit="return qna_content_submit()">
								<input type="hidden" name="command" value="writeQuestion"> 
								<table class="table qna-table">
									<tr>
										<th width="20%">E-Mail&nbsp;&nbsp;|&nbsp;&nbsp;</th>
										<th width="80%"><input class="qna-write-input" type="text" name="memberVO.email" id="email" value="${sessionScope.mvo.email}" readonly="readonly" style="width:90%;"></th>
									</tr>
									<tr>
										<th width="20%">Title&nbsp;&nbsp;|&nbsp;&nbsp;</th>
										<th width="80%"><input class="qna-write-input" type="text" name="title" id="title" maxlength="50" style="width:90%;"></th>
									</tr>
										<tr>
										<td colspan="2">
											<textarea class="col-sm-12 qna-write-input" rows="15" name="content" id="content"></textarea>
										</td>
									</tr>
									<tr align="right">
										<td colspan="2">
											<input type="submit" value="Send">
										</td>
									</tr>
								</table>
							</form>
							<section class="col-sm-2"></section>
						</section>	
						</div>
					</div>
					<!-- //테이블-->
				</section>
	    </div>
	    <!-- //qna.jsp 내용들 -->
	  </div>
	</section>
<section class="col-sm-1"></section>
</div>


	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>