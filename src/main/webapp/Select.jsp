<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>민수 Bank</title>
</head>
<body>
	모드를 선택해주세요<br/>
	<form action = "ModeAction.jsp" method = post>
	손님<input type = "radio" name = "mode" value = "손님"><br/>
	사장님<input type = "radio" name = "mode" value = "사장님"><br/>
	<input type = "submit" name = "접속">
	</form>

	
	 

</body>
</html>