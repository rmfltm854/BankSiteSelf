<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 사이트</title>
</head>
<body>
<form action = "login.jsp" method = post>
	ID : <input type = "text" name = "ID" ><br/>
	PW : <input type = "password" name = "PW" ><br/>
	 <input type = "submit" value = 로그인 > 
	 </form>
    <a href = "join.jsp">회원가입</a>
</body>
</html>