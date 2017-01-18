<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pass Search</title>
</head>
<body>
<center><h2>비밀번호 변경하기</h2></center><p>
<form name="passsearchForm" action="member.do" method="post">
<input type="hidden" name="command" value="passsearchMember">
EMAIL :<input type="text" name="email"><br><br>
passQuestion
<select name="passQuestion">
	<option value="where">가고싶은곳?</option>
	<option value="eat">먹고싶은거?</option>
	<option value="lotto">로또번호?</option>
</select><br><br>
passAnswer <input type="text" name="passAnswer"><br><br>
<input type="submit" value="비밀번호찾기">
</form>
</body>
</html>







