
<%@page import="java.awt.Event"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="boardmysql.*" %>
    <%@ page import="java.util.*" %>
<%
int event_id=Integer.parseInt(request.getParameter("event_id"));
BoardDAO dao=BoardDAO.getDao();
EventDTO edto=dao.getEvent(event_id);

%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>무벤저스의 영화갤러리</title>
		<link rel="stylesheet" type="text/css" href="css/style_event.css">
		<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
		<script type="text/javascript" src="js/prefixfree.min.js"></script>
	</head>

	<body><!-- 시사회 페이지 -->
<header style="position:relative">
			<nav>
				<ul>
					<li><a href="index02.html">시사회/이벤트</a></li>
					<li><a href="index03.html">영화 갤러리</a></li>
					<li><a href="crewlist.html">팀 소개</a></li>
				</ul>
			</nav>
		</header>

	<div id="container">
	
		<div id="main_pic" >
			<div>
				<span>회원 여러분들께 </span>			
				<span>각종 시사회와 이벤트를</span>			
				<span>전해드립니다. 놓치지마세요!</span>			
			</div>
		</div>
	
		<div id="d01">
			<div id="d01_label">시사회 / 이벤트</div>
			<div id="movie_header"> 
				<h1><%=edto.getEvent_title() %></h1>
				<ul>
					<li><%=edto.getId() %></li>
					<li>조회 수 : 1171</li>
					<li>추천 수  : 16</li>
					<li>댓글 수 : 0</li>
					<li>2018.06.17 15:50</li>
				</ul>
				
				<div id="pic"></div>
				<img alt="m2" src="img/<%=edto.getEvent_img() %>" width="600" height="900" />
				<pre><%=edto.getEvent_info() %></pre>
				
				
				
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
<!-- 푸터 -->
<footer class="inner_footer">
	<div class="footer_info">
		<small class="txt_copyright">Copyright © <a href="http://localhost:8181/webpage/index03.html">Team Movengers</a> All rights reserved.</small>
	</div>
</footer>
</body>
</html>