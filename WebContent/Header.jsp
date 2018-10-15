<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header id="header" class="header">
	<h1>
		<a href="main.jsp"> <img src="img/mainlogo.png">
		</a>
	</h1>
	<nav id="nav" class="nav">
		<ul>
			<li><a href="EventMain.jsp">Notice</a></li>
			<li><a href="Community.jsp">Community</a></li>
			<li><a href="Community.jsp">Download</a></li>
			<li><a href="Gallery.jsp">Movie Gallery</a></li>
			<li><a href="crewlist.jsp">About us</a></li>




		</ul>





	</nav>

	<div id="side_menu" class="search_menu">
		<button id="btn_login" class="btn_login" onclick="login_menu_show()">
			<img src="img/login_icon.jpg" alt="login">
		</button>
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

<!--------------------로그인 창 만들기-------------->
<div class="login_menu" id="login_tab" style="display: none">
	<nav>
		<button class="close_btn" onclick="login_menu_show()">
			<span class="skip">close navigation</span>
		</button>
		<%-- 로그인 시작 --%>
		<li>
			<%
				if (session.getAttribute("memId") == null) {//로그인 x
			%>

			<form  name="inform" method="post" action="member/LoginPro.jsp"
				onSubmit="return check()">

				<table class="login_tb" width="300" align="center" border="1">
					<tr>
						<td width="100" align="right">아이디</td>

						<td width="100"><input type="text" name="id" size="24" placeholder="아이디를 입력해주세요.">
						</td>
					</tr>

					<tr>
						<td align="right">비밀번호</td>
						<td><input type="password" name="passwd" size="24" placeholder="비밀번호를 입력해주세요."></td>
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
		<%-- 로그인 끝 --%>
	
	</nav>
</div>

<!-----------------------로그인 창 끝-------------------->



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
		<button class="close_btn" onclick="sub_menu_show()">
			<span class="skip">close navigation</span>
		</button>
		<dl class="sub_menu_little">
			<dt>Notice</dt>
			<dd>
				<a href="Community.jsp">공지사항</a>
			</dd>
			<dd>
				<a href="Community.jsp">시사회</a>
			</dd>
			<dd>
				<a href="Community.jsp">이벤트</a>
			</dd>
			<dd>
				<a href="Community.jsp">당첨자 발표</a>
			</dd>
		</dl>
		<dl class="sub_menu_little">
			<dt>Community</dt>
			<dd>
				<a href="Community.jsp">영화이야기</a>
			</dd>
			<dd>
				<a href="Community.jsp">자유게시판</a>
			</dd>
			<dd>
				<a href="Community.jsp">홍보게시판</a>
			</dd>
			<dd>
				<a href="Community.jsp">모임게시판</a>
			</dd>
			<dd>
				<a href="Community.jsp">질문게시판</a>
			</dd>
		</dl>
		<dl class="sub_menu_little">
			<dt>Download</dt>
			<dd>
				<a href="Community.jsp">자료요청 게시판</a>
			</dd>
			<dd>
				<a href="Community.jsp">영화 관련 자료</a>
			</dd>
			<dd>
				<a href="Community.jsp">시나리오 자료</a>
			</dd>
		</dl>
		<!-----------------------서브메뉴 끝-------------------->
		



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
		if (show) {
			document.getElementById("sub_menu").style.display = "none";
			show = false;
		} else {
			document.getElementById("sub_menu").style.display = "inline-block";
			show = true;
		}
	}
	
	function login_menu_show() {
		if (show) {
			document.getElementById("login_tab").style.display = "none";
			show = false;
		} else {
			document.getElementById("login_tab").style.display = "inline-block";
			show = true;
		}
	}
	
</script>
