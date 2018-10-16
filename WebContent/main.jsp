<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무벤저스의 영화갤러리</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">

<script type="text/javascript" src="js/prefixfree.min.js"></script>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<script type="text/javascript">
	/* 	var show = false;
		function video_show() {
			if (show) {
				document.getElementByClass("main_video").style.display = "none";
				show = false;
			} else {
				document.getElementByClass("main_video").style.display = "block";
				show = true;
			}
		} */
		function video_show() {
			document.getElementById("video_1").style.display = "block";
		}
		function video_hide() {
			document.getElementById("video_1").style.display = "none";
		}
	</script>
	<div id="main_container" class="main_container">
		<div id="main1" class="main1">
			<iframe id="video_1" class="main_video" width="75%" height="850" position="absolute"
				src="https://www.youtube.com/embed/xLCn88bfW1o?autoplay=1">
			</iframe>

			<div id="main_img" class="main_box" onclick="video_show()"></div>
			<div id="main_txt" class="main_box">
				<h2>베놈(Venom)</h2>
				<em>2018.10.03</em>
				<p>영웅인가, 악당인가 진실을 위해서라면 몸을 사리지 않는 정의로운 열혈 기자 '에디 브록' 거대 기업 라이프
					파운데이션의 뒤를 쫓던 그는 이들의 사무실에 잠입했다가 실험실에서 외계 생물체 '심비오트'의 기습 공격을 받게 된다.

					'심비오트'와 공생하게 된 '에디 브록'은 마침내 한층 강력한 '베놈'으로 거듭나고, 악한 존재만을 상대하려는 '에디
					브록'의 의지와 달리 '베놈'은 난폭한 힘을 주체하지 못하는데…! 지배할 것인가, 지배당할 것인가</p>

				<div class="main_sub">
					<ul class="check_star">
						<li><span style="font-size: 14px;">1,277</span></li>
					</ul>
					<ul class="main_sub_more">
						<li><a href="https://www.imdb.com/title/tt1270797/"
							target="_blank" title="READ MORE">영화정보 더 보기</a></li>
						<li><a
							href="http://ticket.movie.naver.com/Ticket/Reserve.aspx?m_id=M000065399&t_tab=1"
							target="_blank" class="1530693534">영화 예매하기</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>


	<%@ include file="Footer.jsp"%>
</body>
</html>