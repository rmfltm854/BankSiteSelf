<%@page import="Money.moneyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%
String Banknum = request.getParameter("banknumber");
%>

    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
moneyDAO dao = new moneyDAO();
int result = dao.findMoney(Banknum);
%>
잔액은 : <%= result %><br/>
<form action = "main.jsp">
	<input type = "submit" value = "메뉴">
</form>

</body>
</html>