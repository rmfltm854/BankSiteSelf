
<%@page import="User.user"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="User.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

 

    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String ID = request.getParameter("ID");
String PW = request.getParameter("PW");
System.out.println(ID);
	userDAO USERDAO = new userDAO();
	user User = new user();
	int result = USERDAO.login(ID,PW);
	
		if(result == 1){
	    	session.setAttribute("UserName",User.getuserName());
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('로그인성공')");
	    	script.println("location.href='main.jsp'");
	    	script.println("</script>");
	    }else if(result == 0){
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('비밀번호가 틀립니다.')");
	    	script.println("history.back()");
	    	script.println("</script>");
	    }else if(result == -1){
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('존재하지않는 아이디입니다.')");
	    	script.println("history.back()");
	    	script.println("</script>");
	    }else if(result == -2){
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("alert('데이터베이스오류 입니다.')");
	    	script.println("history.back()");
	    	script.println("</script>");
	    }


%>

</body>
</html>