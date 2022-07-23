<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
								<h1> 회원가입 진행 </h1>
	<form action = "joinaction.jsp" method = "post">
		하고싶은 아이디: <input type = "text" name = "iD"><br/>
		하고싶은 비밀번호 : <input type = "text" name = "pW"><br/>
		이름  : <input type = "text" name = "userName"><br/>
		남자 <input type = "radio" value = "남자" name = "gender">
		여자 <input type = "radio" value = "여자" name = "gender"><br/>
		이메일<input type = "text" name = "email"><br/>
		<input type = "submit" name = "제출">
	</form>

</body>
</html>