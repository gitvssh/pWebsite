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
			<li><a href="Community.jsp">커뮤니티</a></li>
			<li><a href="crewlist.jsp">팀 소개</a></li>

			<%-- 로그인 시작 --%>
			
			<%-- 로그인 끝 --%>

		</ul>





	</nav>
	<div id="side_menu" class="side_menu">
		<button id="btn_search" style="display: inline-block"
			onclick="search_show()">
			<img src="img/search_icon.jpg" alt="search">
		</button>
		<button id="btn_search_close" style="display: none"
			onclick="search_show()">
			<img src="img/close_icon.jpg" alt="search_close">
		</button>
		<button id="btn_open_nav" onclick="sub_menu_show()">
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

<!--------------------서브메뉴 만들어버리기-------------->
<div class="sub_menu" id="sub_menu" style="display: none">
	<nav>
		<button class="close_dim" onclick="sub_menu_show()">
			<span class="skip" >close navigation</span>
		</button>
		<dl class="dl_nav ci_nav">
					<dt><a href="/corporate/corporate.php">커뮤니티</a></dt>
					<dd><a href="/corporate/corporate.php#hardware">자유게시판</a></dd>
					<dd><a href="/corporate/corporate.php#contents">Q&A</a></dd>
					<dd><a href="/corporate/corporate.php#software">게시판1</a></dd>
					<dd><a href="/corporate/corporate.php#oS">게시판2</a></dd>
					<dd><a href="/corporate/corporate.php#sR">게시판3</a></dd>
				</dl>
		<li>
				<%
					if (session.getAttribute("memId") == null) {//로그인 x
				%>

				<form name="inform" method="post" action="member/LoginPro.jsp"
					onSubmit="return check()">

					<table width="300" align="center" border="1">
						<tr>
							<td width="100" align="right">아이디</td>

							<td width="100"><input type="text" name="id" size="16">
							</td>
						</tr>

						<tr>
							<td align="right">비밀번호</td>
							<td><input type="password" name="passwd" size="20">
							</td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="로그인" onClick="javaScript:location='member/LoginPro.jsp'">
								<input type="button" value="회원가입"
								onClick="javaScript:location='member/InputForm.jsp'"></td>
						</tr>

					</table>

				</form> <%
 	} else {//로그인o()
 %>
				<table width="250" height="70" align="center" border="1">
					<tr>
						<td width="40%" colspan="2">
							<%
								String memId = (String) session.getAttribute("memId");
							%> <%=session.getAttribute("memId")%>님의 방문을 환영합니다<br>

							<form method="post">
								<input type="submit" value="로그아웃"
									onClick="javaScript:location='member/Logout.jsp'"> <input
									type="button" value="회원정보변경"
									onClick="javaScript:location='member/Modify.jsp'">
							</form>

						</td>
					</tr>

				</table> <%
 	}//else end
 %>
			</li>


		
		
	</nav>
</div>





<script type="text/javascript">
	var show = false;

	function search_show() {
		if (show) {
			document.getElementById("btn_search").style.display = "inline-block";
			document.getElementById("btn_search_close").style.display = "none";
			document.getElementById("search_bar").style.display = "none";
			show = false;
		} else {
			document.getElementById("btn_search").style.display = "none";
			document.getElementById("btn_search_close").style.display = "inline-block";
			document.getElementById("search_bar").style.display = "inline-block";
			show = true;
		}
	}

	function sub_menu_show() {
		if(show){
		document.getElementById("sub_menu").style.display = "none";
		show = false;
	} else{
		document.getElementById("sub_menu").style.display = "inline-block";
		show=true;
		
	}
		
	}
</script>