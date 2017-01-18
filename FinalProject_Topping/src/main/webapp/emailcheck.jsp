<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function winClose(flag) {
		//새창에서 원래 창을 제어하려면?
		var of = opener.document.regForm; //이거 모르면 안된대이~~~
		if(flag){//true면 id를 사용할수 없다...아이디를 지우고/포커스는 다시 아이디에
			of.email.value="";
			of.email.focus();			
		}else{//false면 id를 사용할수 있다...password에 포커스를
			of.password.focus();
			of.emailFlag.value="ok";			
		}
		//반드시 해줘야 하는거...
		self.close();//현재 자신의 창을 닫는다.
	}
</script>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.flag}">
		${param.email}는 사용 불가!!
	</c:when>
	<c:otherwise>
		${param.email}는 사용 가능!!
	</c:otherwise>
</c:choose><br><br>
<input type="button" value="확인" onclick="winClose(${requestScope.flag})">
</body>
</html>

























