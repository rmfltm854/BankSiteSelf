<%@page import="java.io.PrintWriter"%>
<%@page import="User.userDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "user" class = "User.user" scope="page" />
<jsp:setProperty name = "user" property="iD" />
<jsp:setProperty name = "user" property="pW" />
<jsp:setProperty name = "user" property="userName" />
<jsp:setProperty name = "user" property="gender" /> 
<jsp:setProperty name = "user" property="email" /> 
<% request.setCharacterEncoding("utf-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	userDAO userDAO = new userDAO();
	int result = userDAO.join(user);
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입실패.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입성공.')");
		script.println("location.href='User.jsp'");
		script.println("</script>");
	}


%>



</body>
</html>