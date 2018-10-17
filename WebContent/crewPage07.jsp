<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무벤저스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style_crewpage7.css">
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
								<h2>게시판</h2>
							</td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
						<tr>
							<td>
								<h1>강현석</h1>
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
				<strong class="emph_subject">알수록 빠져드는 자바</strong>
				<ul class="list_question">
					<li>Q. 이번 프로젝트는 어떤 프로젝트 인가요?
						<p class="desc_answer">HTML/CSS/Jquery/jsp 등 문법을 활용하여 주제에 맞는 웹을 만드는 프로젝트 입니다.</p>
					</li>
					<li>Q. 담당 파트는 무엇인가요?
						<p class="desc_answer">글을 볼 수 있는 게시판을 담당하였습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject ability_story">
			<h4 class="tit_subject">개발 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">사람은 로봇이 아니다.</strong>
				<ul class="list_question">
					<li>Q. 프로젝트 진행시 가장 힘들었던게 무엇인가요?
						<p class="desc_answer">머릿속에 구현된 기능들을 마음대로 활용을 못할때, 같은 실수를 반복하게 될때</p>
					</li>
					<li>Q. 해당 문제를 어떻게 해결하셨나요?
						<p class="desc_answer">틀릴 때마다 고쳐나가면서 반복적인 수행으로 문제를 해결하였습니다.</p>
					</li>
					<li>Q. 다음 프로젝트때는 어떻게 하면 더 나아질까요?
						<p class="desc_answer">다양한 기능들을 배우고 반복적으로  코딩을 하면 익숙해지면서 기능을 활용할 수 있을것 같습니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrap_subject my_story">
			<h4 class="tit_subject">나의 이야기</h4>
			<div class="cont_subject">
				<strong class="emph_subject">실패는 성공의어머니이다. </strong>
				<ul class="list_question">
					<li>Q. 나중에 어떤 일을 하고싶나요?
						<p class="desc_answer">다양한 문법을 자유자재로 활용할 수 있는 개발자가 되고싶습니다.</p>
					</li>
					<li>Q. 팀에 누군가 들어온다면 어떤 사람과 같이 일하고 싶은가요?
						<p class="desc_answer">상부상조 할 수 있는 사람과 같이 일하고 싶습니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>