<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage5.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<section>
		<article class="topimage">
			<div class="info_crew">
				<span class="screen_out">셀</span><span class="txt_cell">게시판, 이벤트 페이지 수정</span> <span class="screen_out">크루명</span><span class="txt_name">방민욱</span>
			</div>
		</article>
	</section>
	<!-- 상단 이미지 삽입 -->
	<section id="krew_content" class="wrap_view">
		<div class="wrap_subject working_story">
			<h4 class="tit_subject">프로젝트</h4>
			<div class="cont_subject">
				<strong class="emph_subject">JSP는 어렵네요.</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">JSP를 활용한 영화 사이트를 제작하는 일입니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">게시판 부분을 강현석 crew와 같이 담당하였고, 중간중간 다른 파트 디자인 부분 수정을 담당했습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">활용의 중요성!</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">단지 알고있다고 생각했던 것들을 직접 제작하면서 어려운 부분이 많았습니다.</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">전에 수업했던 자료들을 참고하였고, 잘 모르는 부분이나 오류가 생기면 팀원들에게 물어보고, google에서 검색해서 하나하나 해결했습니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">앞으로도 계속 어려운 부분이 생길거라 생각하지만 주변 좋은 사람들에게 많이 배우고 찾아보면서 공부하다보면 분명 나아질 것입니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">느리더라도 한발짝식 꾸준하게</strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">web쪽 뿐만 아니라 android나 기초 개발 부분까지 다양한 멀티플레이어가 되고 싶습니다.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">저를 가르쳐줄 수 있는 사람과 함께 하고 싶습니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>