<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--영화 정보 페이지, gallery에서 영화정보 클릭하면 영화정보DB number값 가져와서,
영화DB에서 해당자료정보 가져와서 정보 표시함
리뷰에서도 영화DB number에 맞는 리뷰정보 가져와서 표시해줌  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탐정:리턴즈</title>
<link rel="stylesheet" type="text/css" href="css/style_movieinfo.css" />
<link rel="stylesheet" type="text/css" href="css/headerfooter.css" />
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="Header.jsp" %>
<div id="page">
<div id="title">
영화상세
</div>
<div id="frame">
<div id="main">
<img alt="탐정" src="img/info.jpg" id="info">
<h2>
<strong>
탐정:리턴즈
</strong>
<span>현재상영중</span>
</h2>
<div id="underline">
The Accidental Detective 2: In Action<br>
<br>
예매율 17.4%
(실관람객 : 22,193명)
</div>
<p><strong>
감독 : 이언희 / 프로듀서 : 모일영 / 배우 : 권상우, 성동일, 이광수<br>
장르 : 코미디, 범죄 / 기본 15세 이상, 116분, 한국<br>
개봉 : 2018.06.13
</strong>
</p>
<a href="http://www.cgv.co.kr/ticket/?MOVIE_CD=20016249&MOVIE_CD_GROUP=20016249">
<img alt="예매" src="img/print.png">
</a>
</div>
<br>
<div id="infomenu">
<ul>

<img alt="좌-리본" src="img/ribon_left.png" id="left">
<a href="#" style="color:white"><li class="first">주요정보</li></a>
<a href="#" style="color:white" class="ribon"><li class="first">트레일러</li></a>
<a href="#" style="color:white" class="ribon"><li class="first">스틸컷</li></a>
<a href="#" style="color:white" class="ribon"><li class="first">평점/리뷰</li></a>
<a href="#" style="color:white" class="ribon"><li class="first">상영시간표</li></a>
<img alt="우-리본" src="img/ribon_right.png">
</ul>
</div>
<div>
<p id="ment01">
대한민국 최초 탐정사무소 신!장!개!업!<br> 
전 국민을 웃긴 추리 콤비 ‘혹’ 달고 돌아왔다!
</p>
<p class="ment02">
역대급 미제사건을 해결한 추리 콤비, 셜록 덕후 만화방 주인 ‘강대만’(권상우)과 광역수사대 레전드 형사 ‘노태수’(성동일)! 드디어 대한민국 최초 탐정사무소를 개업하고, 전직 사이버 수사대 에이스 ‘여치’(이광수)까지 영입하며 탐정으로서의 첫 발을 내딛는다.<br>
  
하지만 꿈과 현실은 다른 법! 기다리는 사건 대신 파리만 날리고, 생활비 압박에 결국 경찰서까지 찾아가 몰래 영업을 뛰기 시작한다.<br>
  
드디어 기다림 끝에 찾아온 첫 의뢰인. 게다가 성공보수는 무려 5천만 원! 자신만만하게 사건을 받아 든 세 사람은 파헤칠수록 꼬리에 꼬리를 무는 의심스러운 증거들로 혼란에 빠지기 시작하는데… </p>
<p class="ment02">
"우리가 가는 길 미제사건이란 없다"<br>
6월,최강 트리플 콤비의 본격 추리가 시작된다!
</p>
</div>
</div>
</div>
<%@ include file="Footer.jsp" %>
</body>
</html>