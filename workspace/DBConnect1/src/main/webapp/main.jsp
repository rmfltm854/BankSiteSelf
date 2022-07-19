<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel = "stylesheet" href="css/bootstrap.css">
<!--  새로 파일을 만들어 작성한 'css'파일을 참조하는링크 -->
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
		
		
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		
		
		<div  class="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class =  "active"><a href="main.jsp">메인</a><li>
				<li><a href="bbs.jsp">게시판</a><li>
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
	
	<!-- 메인페이지영역 -->
<div class="container">
	<div class="jumbotron">
		<div class ="container">
			<h1>웹사이트 소개</h1>
			<p>이 웹사이트는 부트스트랩으로 만든 JSP 웹사이트입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다.
				디자인 템플릿으로는 부트스트랩을 이용했습니다.</p>
			<a class ="btn btn-primary btn-pull" href="#" role = "button">자세히 알아보기</a>
		</div>
	</div>
</div>
	
	
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>

</body>
</html>