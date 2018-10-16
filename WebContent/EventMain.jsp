<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boardmysql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	BoardDAO dao = BoardDAO.getDao();
	Vector<EventDTO> vec = dao.getAllEvent();
	EventDTO edto = null;
%>

<html>
<head>
<meta charset="UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_news.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
<script type="text/javascript" src="js/prefixfree.min.js"></script>
</head>
<body>

	<!-- 시사회 페이지 -->
	<%@ include file="Header.jsp"%>

	<div id="container">

		<div id="main_pic">
			<div>
				<span>회원 여러분들께 </span> <span>각종 시사회와 이벤트를</span> <span>전해드립니다.
					놓치지마세요!</span>
			</div>
		</div>
		<div id="d03" class="event_subtitle event_board">
			<a href="#">공지사항</a>
			<ul>
				<li><span><span>1</span></span> <span><a
						href="event_confirm1.html">공지1</a></span> <span>운영자 18.06.19</span></li>
				<li><span><span>2</span></span> <span><a
						href="event_confirm2.html">공지2</a></span> <span>운영자 18.06.18</span></li>
				<li><span><span>3</span></span> <span><a
						href="event_confirm3.html">공지3</a></span> <span>운영자 18.06.18</span></li>
				<li><span><span>4</span></span> <span><a
						href="event_confirm4.html">공지4</a></span> <span>운영자 18.06.15</span></li>
				<li><span><span>5</span></span> <span><a
						href="event_confirm5.html">공지5</a></span> <span>운영자 18.06.11</span></li>

			</ul>
		</div>
		<div id="d01" class="event_subtitle">

			<a href="#">시사회</a>
			<div id="movie">
		<%
            for(int i=0; i<vec.size();i++){
                edto=(EventDTO)vec.get(i);
            %>
                  <a href="Event.jsp?event_id=<%=edto.getEvent_id()%>"><div id="m_1" style="background-image: url(img/<%=edto.getEvent_img() %>);">
                        <span><%=edto.getEvent_title() %></span>
                    </div>
                    </a>
                    <%
            }
            %>
			</div>
		</div>

		<div id="d02" class="event_subtitle event_board">
			<a href="#">이벤트</a>
			<ul>
				<li><span><span>1</span></span> <span><a
						href="event_confirm1.html">'암수살인' 무대인사 안내</a></span> <span>운영자
						18.06.19</span></li>
				<li><span><span>2</span></span> <span><a
						href="event_confirm2.html">이벤트2</a></span> <span>운영자 18.06.18</span></li>
				<li><span><span>3</span></span> <span><a
						href="event_confirm3.html">이벤트3</a></span> <span>운영자 18.06.18</span></li>
				<li><span><span>4</span></span> <span><a
						href="event_confirm4.html">이벤트4</a></span> <span>운영자 18.06.15</span></li>
				<li><span><span>5</span></span> <span><a
						href="event_confirm5.html">이벤트5</a></span> <span>운영자 18.06.11</span></li>

			</ul>
		</div>

		<div id="d04" class="event_subtitle event_board">
			<a href="#">당첨자발표</a>
			<ul>
				<li><span><span>1</span></span> <span><a
						href="event_confirm1.html">'암수살인' 무료 시사회 이벤트 당첨자입니다.</a></span> <span>운영자
						18.06.19</span></li>
				<li><span><span>2</span></span> <span><a
						href="event_confirm2.html">'오 ! 루시!' 언론,배급 시사회 당첨자입니다.</a></span> <span>운영자
						18.06.18</span></li>
				<li><span><span>3</span></span> <span><a
						href="event_confirm3.html">'너와 극장에서' 시사회 당첨자입니다.</a></span> <span>운영자
						18.06.18</span></li>
				<li><span><span>4</span></span> <span><a
						href="event_confirm4.html">'파라독스' 언론, 배급 시사회 당첨자입니다.</a></span> <span>운영자
						18.06.15</span></li>
				<li><span><span>5</span></span> <span><a
						href="event_confirm5.html">'아직 끝나지 않았다' 언론,배급 시사회 당첨자입니다.</a></span> <span>운영자
						18.06.11</span></li>

			</ul>
		</div>

	</div>


	<%@ include file="Footer.jsp"%>
</body>
</html>
