<%@page import="java.io.PrintWriter"%>
<%@page import="Money.money"%>
<%@page import="Money.moneyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "money" class = "Money.money" scope="page" />
<jsp:setProperty name = "money" property="bankNumber"  />
<jsp:setProperty name = "money" property="money"  />


<% request.setCharacterEncoding("utf-8");%>


    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

	moneyDAO dao = new moneyDAO();
	int result = dao.Inputmoney(money);
	
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입금완료')");
		script.println("location.href='select.jsp'");
		script.println("</script>");
	}else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입금실패')");
		script.println("history.back()");
		script.println("</script>");
		
	}
	
%>

</body>
</html>