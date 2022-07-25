<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Money.money"%>
<%@page import="User.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	String ID = request.getParameter("NAME");
    	userDAO dao = new userDAO();
    	money MONEY = new money();
    	List<money> list = new ArrayList<money>();
    	
    	list = dao.CheckNumber(ID);
    	for(money result : list){
    		out.println(result);
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