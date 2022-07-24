<%@page import="Money.money"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Captain.CaptainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
CaptainDAO dao = new CaptainDAO();
money MONEY = new money();
List<money> user = new ArrayList<money>();
user = dao.CheckUser();
for(money USER : user){
	out.println(USER);
	out.println();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>