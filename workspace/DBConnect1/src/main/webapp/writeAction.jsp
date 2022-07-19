<%@page import="java.io.PrintWriter"%>
<%@page import="BBS.bbsDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id = "bbs" class = "BBS.bbs" scope="page" />
<jsp:setProperty name = "bbs" property="bbsTitle" />
<jsp:setProperty name = "bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	//현재세션 상태 체크
	String userID = null;
	if(session.getAttribute("user_id") != null){
		userID = (String)session.getAttribute("user_id");
	}
	//로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다.
	if(userID == null){
		PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('로그인하세요')");
    	script.println("location.href='login.jsp'");
    	script.println("</script>");
	}else{
			//입력이 안 된 부분이 있는지 체크한다.
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다')");
		script.println("history.back()");
		script.println("</script>");
		}else{
			//정살적으로 입력이 되었다면 글쓰기 로직을 수행한다.
			bbsDAO BBSDAO = new bbsDAO();
			int result = BBSDAO.write(bbs.getBbsTitle(),userID, bbs.getBbsContent());
			//데이터베이스 오류 인 경우
			if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			//글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동.
			}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 성공!')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	}
}
%>

</body>
</html>