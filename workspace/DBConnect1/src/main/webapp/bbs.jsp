<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "BBS.bbsDAO" %>
<%@ page import = "BBS.bbs" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel = "stylesheet" href="css/bootstrap.css">
<link rel = "stylesheet" href="css/custom.css">
<title>JSP게시판 웹사이트</title>
</head>
<body>

	<%
	//메인페이지로 이동했을때 세션에 값이 담겨있는지 체크
	String user_id = null;
	if(session.getAttribute("user_id") != null){
		user_id = (String)session.getAttribute("user_id");
	}
	int pageNumber = 1;//기본은 1페이지를 할당
	//만약 파라미터로 넘어온 오브젝트 타입"pageNumber"가 존재한다면
	//"int" 타입으로 캐스팅을 해주고 그값을 "pageNumber"변수에 저장
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>

<nav class="navbar-default"> <!--  네비게이션 -->
		<div class="navbar-header">
		
		<button type = "button" class="navbar-togglecollapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expander="false">
				
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
		</button>
		<!-- 상단 바에 제목이 나타나고 클릭하면  main페이지로 이동 -->
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		
		<!--  게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div  class="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a><li>
				<li class = "active"><a href="bbs.jsp">게시판</a><li>
				</ul>
				<%
					//로그인 하지 않았을떄 보여지는 화면
					if(user_id == null){
				%>
				<!-- 헤더우측에 나타나는 드랍다운영역 -->
				<ul class="nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expander="false">접속하기<span class="caret"></span></a>
								<!-- 드랍다운 아이템 영역 -->
								<ul class= "dropdown-menu">
										<li><a href="login.jsp">로그인</a></li>
										<li><a href = "join.jsp">회원가입</a>
								
								</ul>
						</li>
				</ul>
				<%
					//로그인이 되어있는 상태에서 보여주는 화면
					}else{				
				%>
				<!-- 헤더우측에나타나는 드랍다운영역 -->
				<ul class="nav navbar-nav navbar-right">
						<li class = "dropdown">
								<a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expander="false">회원관리<span class="caret"></span></a>
								<!-- 드랍다운 아이템 영역 -->
								<ul class= "dropdown-menu">
										<li><a href="logoutAction.jsp">로그아웃</a></li>
								
								</ul>
						</li>
				</ul>
				<%
					}
				%>
		</div>
		
	</nav>
	<!--  네비게이션 영역 끝 -->
	
	<!--  게시판메인영역 -->
	<div class = "container">
		<div class = "row">
			<table class="table table-striped" style="text-allign:center; border : 1px solid #dddddd">
					<thead>
						<tr>
								<th style = "background-color : #eeeee ; text-allign: center;">번호
								</th>
								<th style = "background-color : #eeeee ; text-allign: center;">제목
								</th>
								<th style = "background-color : #eeeee ; text-allign: center;"> 작성자
								</th>
								<th style = "background-color : #eeeee ; text-allign: center;"> 작성일
								</th>
							</tr>
						</thead>
						<tbody>
							<%
								bbsDAO bbsDAO = new bbsDAO();//인스턴스 생성
								ArrayList<bbs> list = bbsDAO.getList(pageNumber);
								for(int i = 0; i< list.size();i++){
							
							%>
							<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<!--  게시글 제목누르면 해당들을 볼수있도록 링크를 건다 -->
							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
								<%= list.get(i).getBbsTitle().replaceAll
						(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+ "시" + list.get(i).getBbsDate().substring(14,16) + "분" %>
							</td>
											</tr>
											<%
								}
											%>
						</tbody>
					</table>
					
					<!--  페이징 처리 영역 -->
					<%
							if(pageNumber != 1){
					%>
							<a href = "bbs.jsp?pageNumber=<%=pageNumber - 1 %>"
										class="btn btn-seccess btn-arraw-left">이전</a>
					<%
							}if(bbsDAO.nextPage(pageNumber + 1)){
					%>
					
							<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>"
									class="btn btn-success btn-arraw-left">다음</a>
					<%
							}
					%>
					<!-- 글쓰기 버튼 생성 -->
					<a href = "write.jsp" class = "btn btn-primary pull-right">글쓰기</a>
				</div>
			</div>
			
			<!-- 게시판 메인 페이지 영역 끝 -->
			
			<!-- 부트스트랩 참조 영역 -->
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>