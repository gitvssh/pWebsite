<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav>
		<ul>
			<li><a href="/">공지사항</a></li>
			<li><a href="EventMain.jsp">시사회/이벤트</a></li>
			<li><a href="Gallery.jsp">영화 갤러리</a></li>
			<li><a href="crewlist.jsp">팀 소개</a></li>
		
		<%-- 로그인 시작 --%>
		<li>
	<%if(session.getAttribute("memId")==null){//로그인 x
		%>
	
	<form name="inform" method="post" action="member/LoginPro.jsp" onSubmit="return check()">
	
	<table width="300" align="center" border="1">
		<tr> 
		<td width="100" align="right">
			아이디</td>
			
			<td width="100" >
			<input type="text" name="id" size="16">
			</td>
		</tr>
		
		<tr>
		<td align="right">
		비밀번호</td>
		<td>
		<input type="password" name="passwd" size="20">
		</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="로그인"  onClick="javaScript:location='member/LoginPro.jsp'">
			<input type="button" value="회원가입" onClick="javaScript:location='member/InputForm.jsp'">
			</td>
			</tr>
	
	</table>
	
	</form>
	
		
		<%
	}else{//로그인o()
		%>
			<table width="250" height="70" align="center" border="1" >
		<tr>
		<td width="40%" colspan="2" >
		<%
		String memId=(String)session.getAttribute("memId");
		%>
		<%=session.getAttribute("memId") %>님의 방문을 환영합니다<br>
		
		<form method="post">
			<input type="submit" value="로그아웃"  onClick="javaScript:location='member/Logout.jsp'">
			<input type="button" value="회원정보변경" onClick="javaScript:location='member/Modify.jsp'">
		</form>
		
		</td>
		</tr>
		
	</table>	
		
		
		<%
	}//else end

	
	%>
	</li>
		
		
		
		<%-- 로그인 끝 --%>
		
		</ul>
		


 

	</nav>
</header>