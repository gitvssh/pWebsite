<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무벤저스의 영화갤러리</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/headerfooter.css">

<script type="text/javascript" src="js/prefixfree.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>

</head>
<body>
	<%@ include file="Header.jsp"%>
	<script type="text/javascript">
		function video_show() {
			document.getElementById("video_1").style.display = "block";
			document.getElementById("videoShow").style.display = "none";
			document.getElementById("videoHide").style.display = "block";
		}
		function video_hide() {
			document.getElementById("video_1").style.display = "none";
			document.getElementById("videoShow").style.display = "block";
			document.getElementById("videoHide").style.display = "none";
		}

		var videoList = [
				'https://www.youtube.com/embed/xLCn88bfW1o?autoplay=1',
				'https://www.youtube.com/embed/HbIBajyVjVs?autoplay=1',
				'https://www.youtube.com/embed/L1hMISimejs?autoplay=1',
				'https://www.youtube.com/embed/AAJ2LVVgqVo?autoplay=1',
				'https://www.youtube.com/embed/IQTPEL4nyz8?autoplay=1',
				'https://www.youtube.com/embed/3L2-JAbXIAM?autoplay=1',
				'https://www.youtube.com/embed/qHmQE93hVmA?autoplay=1', ];

		var subtitleList = [ '베놈(Venom)', '진격의거인2', '신비한 동물사전2', '프레데터(2018)',
				'물괴', '해리포터와 마법사의돌', '창궐' ];
		var firstrunList = [ '2018.10.03', '개봉예정작', '개봉예정작', '개봉예정작', '개봉예정작',
				'개봉예정작', '개봉예정작' ];

		var contentList = [ '1', '2', '3', '4', '5', '6', '7' ];

		var hd;
		var pos = 0;

		function ContentsMove(flg) {

			pos += flg;
			if (pos >= videoList.length)
				pos = 0;
			else if (pos < 0)
				pos = videoList.length - 1;

			var idp = pos;

			var a = document.getElementById("video_1");
			a.src = videoList[idp];

			document.getElementById("subtitle_1").innerText = subtitleList[idp];
			document.getElementById("firstrun_1").innerText = firstrunList[idp];
			document.getElementById("content_1").innerText = contentList[idp];

			idp++;

			if (inputNum >= videoList.length)
				inputNum = 0;
			else if (inputNum < 0)
				inputNum = videoList.length - 1;
		};
	</script>

	<div id="main_container" class="main_container">
		<div id="main2" class="main">

			<iframe id="video_1" class="main_video" width="75%" height="810"
				src="https://www.youtube.com/embed/xLCn88bfW1o?autoplay=1">
			</iframe>

			<div id="main_txt" class="main_box main_txt">
				<h2 id="subtitle_1">베놈(Venom)</h2>
				<em id="firstrun_1">2018.10.03</em>
				<p id="content_1">영웅인가, 악당인가 진실을 위해서라면 몸을 사리지 않는 정의로운 열혈 기자 '에디
					브록' 거대 기업 라이프 파운데이션의 뒤를 쫓던 그는 이들의 사무실에 잠입했다가 실험실에서 외계 생물체 '심비오트'의
					기습 공격을 받게 된다. '심비오트'와 공생하게 된 '에디 브록'은 마침내 한층 강력한 '베놈'으로 거듭나고, 악한
					존재만을 상대하려는 '에디 브록'의 의지와 달리 '베놈'은 난폭한 힘을 주체하지 못하는데…! 지배할 것인가, 지배당할
					것인가</p>

				<div class="main_sub">
					<ul class="check_star">
						<li><span style="font-size: 14px;">1,277</span></li>
					</ul>
					<ul class="main_sub_more">
						<li><a href="https://www.imdb.com/title/tt1270797/"
							target="_blank" title="READ MORE">영화정보 더 보기</a></li>
						<li id="videoShow"><a onclick="video_show()">예고편 ON</a></li>
						<li id="videoHide" style="display: none"><a
							onclick="video_hide()">예고편 OFF</a></li>
						<li><a
							href="http://ticket.movie.naver.com/Ticket/Reserve.aspx?m_id=M000065399&t_tab=1"
							target="_blank">영화 예매하기</a></li>
					</ul>
				</div>
			</div>
			<div class="swiper-container gallery-top">

				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image: url('img/main_img_1.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_2.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_3.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_4.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_5.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_6.jpg')"></div>
					<div class="swiper-slide"
						style="background-image: url('img/main_img_7.jpg')"></div>

				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next swiper-button-white"
					onclick="ContentsMove(1)"></div>
				<div class="swiper-button-prev swiper-button-white"
					onclick="ContentsMove(-1)"></div>
			</div>
			<div class="swiper-container gallery-thumbs">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="img/mm1.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm2.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm3.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm4.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm5.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm6.jpg" />
					</div>
					<div class="swiper-slide">
						<img src="img/mm7.jpg" />
					</div>

				</div>
			</div>

		</div>
		<!--main2 end -->

	</div>
	<!-- main_container end -->



	<!------------------------SWIPE START------------------------------>
	<script>
		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 7,
			loop : false,
			freeMode : true,
			loopedSlides : 10, //looped slides should be the same
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});
		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			loop : true,
			loopedSlides : 10, //looped slides should be the same
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			thumbs : {
				swiper : galleryThumbs,
			},
		});
	</script>

	<!------------------------SWIPE END------------------------------>

	<%@ include file="Footer.jsp"%>
</body>
</html>