<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id = "user" class = "user.User" scope="page"/>
<jsp:setProperty name = "user" property="user_id" />
<jsp:setProperty name = "user" property="user_pw" />
<jsp:setProperty name = "user" property="user_name" />
<jsp:setProperty name = "user" property="user_gender" />
<jsp:setProperty name = "user" property="user_email" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	//현재세션 상태 체크
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String)session.getAttribute("user_id");
	}
	if(user_id != null){
		PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('이미 로그인 되어 있습니다.')");
    	script.println("location.href='main.jsp'");
    	script.println("</script>");
	}

	if(user.getUser_id() == null || user.getUser_pw() ==null ||
	user.getUser_gender()== null || user.getUser_email() ==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다')");
	script.println("history.back()");
	script.println("</script>");
	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			session.setAttribute("user_id", user.getUser_id());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 완료.')");
			script.println("location.href='main.jsp");
			script.println("</script>");
		}
	}
	%>

</body>
</html>