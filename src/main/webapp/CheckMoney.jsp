<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Captain.CaptainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CaptainDAO dao = new CaptainDAO();
	List<Integer> money = new ArrayList<Integer>();
	money = dao.TotalMoney();
	int result = 0;
	for(int i : money){
		result += i;
		System.out.println(result);
	}
	
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			총금액<%=result %>
	<form action = "CaptainMenu.jsp" method = post>
	<input type = "submit" value = 메뉴로돌아가기> 
	</form> 

</body>
</html>