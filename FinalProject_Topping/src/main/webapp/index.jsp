<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function logout() {
		var f = confirm("로그아웃 하시겠습니까?");
		if (f)
			location.href = "member.do?command=logout";
	}
	function updateConfirm() {
		var f = confirm("회원정보를 수정페이지로 가시겠습니까?");
		if (f)
			location.href = "member.do?command=updateMemberView&&email=" + $
		{
			sessionScope.mvo.email
		}
		;
	}
	function deleteConfirm() {
		var f = confirm("정말 탈퇴하시겠습니까?");
		if (f)
			location.href = "member.do?command=deleteMember&&email=" + $
		{
			sessionScope.mvo.email
		}
		;
	}
</script>
</head>
<body>

	<!-- 로그인 상태 여부에 따라서 보여지는 내용을 달리 가져갈 것이다. -->
	<c:choose>
		<c:when test="${sessionScope.mvo==null}">
			<a href="register.jsp">회원 가입 하기</a>
			<br>
			<br>
			<a href="login.jsp">로그인 하기</a>
			<br>
			<br>
			<a href="passearch.jsp">비밀번호찾기</a>
			<br>
			<br>
			<a href="notice.do?command=getNoticeList">공지사항 게시판</a>
			<br>
			<br>


		</c:when>
		<c:otherwise>
		${sessionScope.mvo.nickName}님, 로그인 상태입니다.^^<p>
				<br> <a href="javascript:logout()">로그 아웃 하기</a><br>
				<br> <a href="javascript:updateConfirm()">회원정보수정</a><br>
				<br> <a href="javascript:deleteConfirm()">회원탈퇴</a><br>
				<br> <a href="notice.do?command=getNoticeList">공지사항 게시판</a><br>
				<br> <a href="createactivity.jsp">Activity 생성 하러가기</a><br>
				<br> <a href="activity.do?command=getActivityList">목록 보러가기</a><br>
				<br>
				<c:if test="${sessionScope.mvo.checkAdmin==2}">
					<a href="qna.do?command=qnaAdminList">QnA 게시판 관리자용</a>
					<br>
					<br>
				</c:if>
				<br><a href="qna.do?command=qnaMyList">QnA 게시판</a><br>
				<br><a href="freeboard.do?command=getFreeBoardList">자유게시판</a><br>
				<br><a href="freeboard.do?command=getTipBoardList">Tip 게시판</a><br>
		</c:otherwise>

	</c:choose>

</body>
</html>
