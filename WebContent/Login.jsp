<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>무벤저스의 영화갤러리</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<link rel="stylesheet" type="text/css" href="css/headerfooter.css">
		<script type="text/javascript" src="js/prefixfree.min.js"></script>
	</head>
	<body>
		<%@ include file="Header.jsp" %>

<%-- 로그인 시작 --%>
		<div id="login_tab" style="display: none">
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
						<td><input type="password" name="passwd" size="20"></td>
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
		</div>
		<%-- 로그인 끝 --%>
		
		<%@ include file="Footer.jsp" %>
	</body>
</html>