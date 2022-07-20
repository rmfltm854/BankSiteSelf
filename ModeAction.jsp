

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   request.setCharacterEncoding("UTF-8");
   String Mode = request.getParameter("mode");
   
   
   if(Mode.contains("손님")){
	   response.sendRedirect("User.jsp");
   }else{
	   response.sendRedirect("Captain.jsp");
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