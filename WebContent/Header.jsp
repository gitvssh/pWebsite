<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="header" class="header">
	<h1>
		<a href="/"> <img src="img/mainlogo.png">
		</a>
	</h1>
	<nav id="nav" class="nav">
		<ul>
			<li><a href="/">공지사항</a></li>
			<li><a href="EventMain.jsp">시사회/이벤트</a></li>
			<li><a href="Gallery.jsp">영화 갤러리</a></li>
			<li><a href="crewlist.jsp">팀 소개</a></li>
		</ul>
	</nav>
	<div id="side_menu" class="side_menu">
		<button id="btn_search" style="display: inline-block"
			onclick="hide_on()";>
			<img src="img/search_icon.jpg" alt="search">
		</button>
		<button id="btn_search_close" style="display: none"
			onclick="hide_off()";>
			<img src="img/close_icon.jpg" alt="search_close">
		</button>
		<button id="btn_open_nav">
			<img src="img/menu_icon.jpg" alt="sidemenu open">
		</button>
	</div>

</header>
<div class="search_bar" id="search_bar" style="display: none">
	<form name="h_seach" action="검색어입력해서이동" method="post">
		<input type="hidden" name="search_type" />
		<div class="search_in">
			<input type="text" placeholder="검색어를 입력하세요" value="" name="search"
				required class="search_text">
		</div>
		<div class="search_btn">
			<input type="submit" value="검색" class="submit_search">
		</div>
	</form>
</div>
<script>
	function hide_off() {
		document.getElementById("btn_search").style.display = "inline-block";
		document.getElementById("btn_search_close").style.display = "none";
		document.getElementById("search_bar").style.display = "none";
	}
	function hide_on() {
		document.getElementById("btn_search").style.display = "none";
		document.getElementById("btn_search_close").style.display = "inline-block";
		document.getElementById("search_bar").style.display = "inline-block";
	}
</script>