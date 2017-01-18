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
<title>Show Notice</title>

<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Template CSS Files
        ================================================== -->
<!-- shownotice css -->
<link rel="stylesheet" href="css/shownotice.css">

<!-- Template Javascript Files
        ================================================== -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>
<style type="text/css">
	.color05{
	color:red; 
	}
</style>
</head>
<script type="text/javascript">
	function deleteNotice() {
		if(confirm("Are you sure you want to delete it?")){
			//확인을 선택하면 이곳에서 페이지를 이동
			location.href="notice.do?command=deleteNotice&&noticeNo=${nvo.noticeNo}";
		}
	}//
	
	function updateNotice() {
		if(confirm("Do you really want to modify it?")){
			//확인을 선택하면 이곳에서 페이지를 이동
			location.href="notice.do?command=updateNoticeView&&noticeNo=${nvo.noticeNo}";
		}
	}

</script>
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
		<div id="shownotice-wrap" class="col-lg-12">
			<section class="col-md-2"></section>
			<section class="col-md-8" id="shownotice">
			<h3><span class="glyphicon glyphicon-option-vertical color05"></span>Notice</h3>
				<table id="shownotice-table" class="table">
					<tr>
						<th width="20%">No<span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span>${requestScope.nvo.noticeNo}</th>
						<th width="80%" colspan="2">Title<span class="color05"><span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></span>${requestScope.nvo.title}</th>
					</tr>
					<tr>
						<th width="20%">Name<span class="color05"><span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></span>${requestScope.nvo.memberVO.nickName}</th>
						<th width="50%">Date<span class="color05"><span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></span>${requestScope.nvo.writeDate}</th>
						<th width="30%">Hits<span class="color05"><span class="color05">&nbsp;&nbsp;|&nbsp;&nbsp;</span></span>${requestScope.nvo.hits}</th>
					</tr>
		 			<tr>
						<td colspan="3">
							<textarea rows="15" style="resize:none;width:100%;border:none;">${requestScope.nvo.noticeContent}</textarea>
						</td>
					</tr>
					<tr>
						<td valign="middle" colspan="3">
							<div id="noticeshowBtn">
							<a href="notice.do?command=getNoticeList&&page=1">List</a> 
							<c:if test="${sessionScope.mvo.checkAdmin==2}">
								<a onclick="updateNotice()">Modify</a>
								<a onclick="deleteNotice()">Delete</a>
							</c:if>
							</div>
						</td>
					</tr>
				</table>
			</section>
			<section class="col-md-2"></section>
		</div>
	</div>
	<!--================//글쓰기폼====================-->

	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<%@include file="footer.jsp"%>
</body>
</html>






























