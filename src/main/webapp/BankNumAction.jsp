<%@page import="java.io.PrintWriter"%>
<%@page import="Money.moneyDAO"%>
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
<% 
	String BankNumber = request.getParameter("BankNum");
	String UserName = request.getParameter("UserName");
%>
<%
	moneyDAO MONEYDAO = new moneyDAO();
	int result = MONEYDAO.CreateBankNum(BankNumber, UserName);
	
	if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('계좌개설실패.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('계좌개설성공.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}

%>

</body>
</html>