<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">

</head>

<body>
	<%@ include file="Header.jsp"%>

	<section>
		<article class="topimage">
			<div class="info_crew">
				<span class="screen_out">셀</span><span class="txt_cell">팀 소개
					페이지</span> <span class="screen_out">크루명</span><span class="txt_name">이승현</span>
			</div>
		</article>
	</section>
	
	<!-- 상단 이미지 삽입 -->
	<section id="krew_content" class="wrap_view">
		<div class="wrap_subject working_story">
			<h4 class="tit_subject">프로젝트</h4>
			<div class="cont_subject">
				<strong class="emph_subject">벤치마킹이 최고다</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">지금까지 배운 html과 css를 활용하여, 각 팀별로 선택한 주제에
							맞게 기획한 웹페이지를 제작하는 프로젝트입니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">가장 마지막 페이지인 팀 소개 페이지와 세부 페이지를 담당하였습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">블럭이 자꾸 사라지거나 안움직이네요.</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">구상한 디자인으로 요소들을 위치시킬때, 생각한대로 위치하지 않고,
							중구난방으로 움직이는게 힘들었습니다.</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">div블럭이나 section, article등의 시멘틱 요소를 활용해서
							브릭화 시켜 요소들을 단순화 시켜서 해결했습니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">css에 아직 익히지 못한 다양한 마크업 언어들이 존재하니, 그것들을
							활용하면 좀더 쉽게 구현될거라 생각됩니다. 또 자바스크립트등의 언어를 배우면, 다양한 기능을 지금보다 편하게 구현할
							수 있을 것 같습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">한강에서 자전거타면서 다이어트 중입니다.</strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">게임제작 개발쪽을 가기 위해서 열심히 공부중입니다.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">혼자서 하는 작업이 아니라 팀으로 작업하니 의사소통이 원활하고 협조적인
							분들이 함께할때 더 좋은 결과를 낼 수 있다고 생각해서 말이 잘 통하는 분들과 함께하고 싶습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		
	</section>
	

	<%@ include file="Footer.jsp"%>
</body>
</html>