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
	<div id="main_container" class="main_container">
		<div id="main1" class="main1">
			<div id="main_img" class="main_box"></div>
			<div id="main_txt" class="main_box">
				<h2>Venom</h2>
				<em>October</em>
				<p>Venom is a movie starring Tom Hardy, Michelle Williams, and
					Jenny Slate. When Eddie Brock acquires the powers of a symbiote, he
					will have to release his alter-ego "Venom" to save his life.</p>

				<div class="m4_ico_wrap cf">
					<ul class="m4_ico1 cf">
						<li id="1530693534" class="good_off"
							onclick="javascript:goodon('1530693534');"><a
							href="javascript:goodon('1530693534');"><span class="skip">good
									off</span><span id="count_1530693534" style="font-size: 14px;">1,277</span></a></li>
					</ul>
					<ul class="m4_btn cf">
						<li><a href="https://www.imdb.com/title/tt1270797/"
							target="_blank" title="READ MORE">READ MORE</a></li>
						<li><a href="/movie4dx/movie4dx.php?num=1530693534#find"
							class="1530693534" onclick="tickets('1530693534');">GET
								TICKETS</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>


	<%@ include file="Footer.jsp"%>
</body>
</html>