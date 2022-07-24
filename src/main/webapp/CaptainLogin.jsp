<%@page import="java.io.PrintWriter"%>
<%@page import="Captain.CaptainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%  
  	request.setCharacterEncoding("utf-8");
  	response.setCharacterEncoding("utf-8");
  	String ID = request.getParameter("cid");
    String PW = request.getParameter("cpw");
    int pw = Integer.parseInt(PW);
    
    CaptainDAO dao = new CaptainDAO();
    int result = dao.CaptainOK(pw,ID);
    if(result == 1){
    	response.sendRedirect("CaptainMenu.jsp");
    }else if(result == -1){
    	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지않습니다.')");
		script.println("history.back()");
		script.println("</script>");
    }else{
    	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스오류.')");
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