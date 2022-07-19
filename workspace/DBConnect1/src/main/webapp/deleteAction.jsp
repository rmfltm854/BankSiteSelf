<%@page import="java.io.PrintWriter"%>
<%@page import="BBS.bbsDAO"%>
<%@page import = "BBS.bbs" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>

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
	}
	int bbsID = 0;
	if(request.getParameter("bbsID")!=null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('유효하지않은글입니다.')");
    	script.println("location.href='bbs.jsp'");
    	script.println("</script>");	
	}
	//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다.
	bbs BBS = new bbsDAO().getBbs(bbsID);
	if(!userID.equals(BBS.getUserID())){
		PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('권한이없습니다.')");
    	script.println("location.href='bbs.jsp'");
    	script.println("</script>");	
	}else{
			//글삭제 로직 수행
			bbsDAO BBSDAO = new bbsDAO();
			int result = BBSDAO.delete(bbsID);
			
			//데이터베이스 오류인 경우
			if(result == -1){
				PrintWriter script = response.getWriter();
		    	script.println("<script>");
		    	script.println("alert('글 삭제하기에 실패했습니다.')");
		    	script.println("history.back()");
		    	script.println("</script>");
		    	//글 수정이 정상적으로 실행되면 알림창을 띄우고 게시판에 메인으로 이동
			}else{
				PrintWriter script = response.getWriter();
		    	script.println("<script>");
		    	script.println("alert('글 삭제 성공')");
		    	script.println("location.href='bbs.jsp'");
		    	script.println("</script>");
			}
		}
%>

</body>
</html>