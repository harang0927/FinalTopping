<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My QnA</title>
</head>
<body>
	<h2>MyQnA 리스트</h2><p>
	<table border="1" width="650" cellpadding="2">
	<tr>
		<th width="10%">번 호</th>
		<th width="50%">제 목</th>
		<th width="15%">답변자</th>
		<th width="15%">작성일</th>
	</tr>
	<!-- @@@@@이 부분 반드시 수정 @@@@-->
		<c:forEach var="qvo" items="${requestScope.list}">
		<tr>
			<td>${qvo.qnaNo}</td>
			<td><a href="qna.do?command=showQnA&&qnaNo=${qvo.qnaNo}">${qvo.title}</a></td>
			<td>${qvo.admin}</td>
			<td>${qvo.writeDate}</td>	
		</tr>
	</c:forEach>
</table><p>

<c:if test="${sessionScope.mvo.checkAdmin==1||sessionScope.mvo.checkAdmin==0}">
	<a href="write_qna.jsp">글쓰기</a>
</c:if>
<a href="index.jsp"> 홈으로 돌아가기</a>
<p>

</body>
</html>