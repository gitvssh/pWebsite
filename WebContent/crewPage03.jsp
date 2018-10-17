<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage3.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="upperDiv">
		<table class="innerTable">
			<tr>
				<td class="cha_img">
				</td>
				<td class="innerEmpty">
					<p></p>
				</td>
				<td>
					<table>
						<tr>
							<td>
								<h2>전체적 디자인</h2>
							</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<h1>손현배</h1>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<!-- 상단 이미지 삽입 -->
	<section id="krew_content" class="wrap_view">
		<div class="wrap_subject working_story">
			<h4 class="tit_subject">프로젝트</h4>
			<div class="cont_subject">
				<strong class="emph_subject">영화갤러리 만들었습니다.</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">자바스크립트 없이 HTML5 배운거를 써먹어보는 프로젝트입니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">핀터레스트를 참조하여 영화갤러리 레이아웃과 CGV를 참조하여 영화소개
							페이지를 만들었습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">참조 홈페이지의 소스를 잘 베끼는것이 중요합니다.</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">사진을 찍고 제 얼굴을 보는게 제일 힘들었습니다.</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">적당히 타협해서 비슷하거나 아주 유사한 느낌이 들게끔 만들었습니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">자바스크립트를 배운 이후일테니 구현하기가 훨씬 쉬워질거라 예상됩니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">안되면 참조하라.</strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">게임을 만들고 싶지만 힘들다고 하니 시스템 구축쪽을 일단 고려중입니다.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">잘하는 사람이 최고지만 안된다면 말이 잘 통하는사람.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>