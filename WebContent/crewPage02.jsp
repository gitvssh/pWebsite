<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage2.css">
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
								<h2>Intro/시사회/이벤트</h2>
							</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<h1>이민하</h1>
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
				<strong class="emph_subject">html은 너무 쉽습니다.</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">이번에 우리가 html과 css에 대해 배우게 되어 그 둘을 활용한
							홈페이지 제작을 하게 되었습니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">영화예고편 페이지, 시사회/이벤트 페이지를 제작했습니다. 영화예고편은
							메인으로 활용할 예정이었으나 바뀌게 되어 홈 화면 우측에 사이드바로 표시하였습니다. 화제의 예고편 영상 썸네일을
							누르면 바로 전체화면으로 오토플레이가 될 수 있도록 하였습니다. 시사회/이벤트 페이지는 홈페이지의 전체적인 포맷을
							따라가려 노력했고 결과는 훌륭합니다 ㅎㅎ</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">스트레스 받지말고 꾸준히 하는게 중요합니다.</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">html수업이 급박하게 진행되는 동안 많은 지식을 흡수해야 했어서 그
							부분이 힘들었습니다.</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">여러번 반복해보고 수업내용에 안주하지 말고 이것저것 해봐야합니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">좀 더 부지런하게 하면 충분히 좋은 결과를 나타낼 수 있을것 같습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">이야 java 재밌다 ! html 재밌다!</strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">좋은 어플을 만들어 일확천금을 노리는 중입니다.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">돈이 많아서 밥과 술을 잘 사주는 사람과 일하고 싶습니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>