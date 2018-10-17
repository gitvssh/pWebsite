<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage4.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<section>
		<article class="topimage">
			<div class="info_crew">
				<span class="screen_out">셀</span><span class="txt_cell">회원 가입/수정/삭제, 관리자 페이지(회원 수정/탈퇴)</span> <span class="screen_out">크루명</span><span class="txt_name">노연정</span>
			</div>
		</article>
	</section>
	<!-- 상단 이미지 삽입 -->
	<section id="krew_content" class="wrap_view">
		<div class="wrap_subject working_story">
			<h4 class="tit_subject">프로젝트</h4>
			<div class="cont_subject">
				<strong class="emph_subject">자바를 잡아라</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">JQuery, CSS, 등 자바를 활용하여 만들어보는 프로젝트입니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">회원, 관리자등의 정보를 관리할 수 있는 페이지를 만들었습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">막힐때는 처음부터</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">아직 미숙한 부분이 많아 오류가 날때가 가장 힘들었습니다.</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">다시 기초를 다잡으며 처음부터 해결해나갔습니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">계속해서 배워나간다면 더 나아질 것이라고 생각합니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject"> 안하고 후회할 바에 하고 후회하자</strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">자바를 이용해 시스템들을 만드는 자바개발자가 되고싶습니당.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">팀으로 하는 작업이니 말이 잘통하는 사람과 같이 일하고 싶습니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>