<%@page import="java.io.PrintWriter"%>
<%@page import="Captain.CaptainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String PW = request.getParameter("PW");
	int pw = Integer.parseInt(PW);
	CaptainDAO dao = new CaptainDAO();
	int result = dao.ChangeCaptainPW(pw,id);
	
	if(result == 1){
		response.sendRedirect("Captain.jsp");
		
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 변경 실패.')");
		script.println("history.back()");
		script.println("</script>");
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