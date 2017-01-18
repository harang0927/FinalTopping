<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
	
	function updatecheck() {
		if(confirm("정말로 수정하시겠습니까?")){
			document.updateFrm.submit;
		}
	}

</script>
<body>
<form action="member.do" method="post" name="updateFrm">
<input type="hidden" name="command" value="updateMember">
email : <input type="text" name="email" value="${requestScope.mvo.email}" readonly="readonly"> <p>
nickName : <input type="text" name="nickName" value="${requestScope.mvo.nickName}"><p>	
password :  <input type="password" name="password" value="${requestScope.mvo.password}"><p>	
passQuestion : <input type="text" name="passQuestion" value="${requestScope.mvo.passQuestion}" readonly="readonly"><p>
passAnswer : <input type="text" name="passAnswer" value="${requestScope.mvo.passAnswer}" readonly="readonly"><p>	
<%-- gender : <input type="text" name="gender" value="${requestScope.mvo.gender}" readonly="readonly"><p>  --%>
imgUrl : <input type="text" name="imgUrl" value="${requestScope.mvo.imgUrl}" ><p>	
address :  <input type="text" name="address" value="${requestScope.mvo.address}"><p>	
selfIntroduce : <textarea name="selfIntroduce" >${requestScope.mvo.selfIntroduce}</textarea>
<input type="submit" value="수정하기" onclick="updatecheck()"> 
</form>
</body>
</html>






























