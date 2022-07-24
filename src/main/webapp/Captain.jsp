<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사장님 사이트</title>
</head>
<body>
사장님 으로 접속하시려면 로그인해주세요
	<form action = "CaptainLogin.jsp" method = post>
		<input type = "ID" name = "cid" placeholder = "아이디입력">
		<input type = "password" name = "cpw" placeholder = "비밀번호입력">
		<input type = "submit" value = "로그인">
	</form>

</body>
</html>