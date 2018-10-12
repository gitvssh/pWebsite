<%@page import="tools.Sha256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
 <%@ page import="tools.*" %>
<%--deletePro.jsp--%>

<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("memId");
String passwd=Sha256.encrypt(request.getParameter("passwd"));

MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기
int check=dao.deleteMember(id, passwd);//dao메서드 호출
//check=1 정상 탈퇴
//check=-1 암호틀릴때
//check=0 존재하지 않은 id

if(check==1){//삭제완료
	session.invalidate();//세션 무효화
%>
	<body>
	<form name="userForm" method="post" action="../Gallery.jsp">
	<table width="270" cellpadding="5" align="center">
		<tr>
		<td height="40" align="center">
		<font size="2"><b>회원정보가 삭제 되었습니다</b></font>
		</td>
		</tr>
		
		<tr>
		<td align="center">
		<p>Good Bye 잘가요
		<meta http-equiv="Refresh" content="3;url=../Gallery.jsp">
		</td>
		</tr>
		
		<tr>
		<td align="center">
		<input type="submit" value="확인">
		</td>
		</tr>
		
		</table>
	</form>
	</body>
<%
}else if(check==-1){//암호틀림
%>
	<script>
	alert("암호가 틀립니다");
	history.back();
	</script>
<%	
}else if(check==0){//존재하지 않음
%>
	<script>
	alert("존재하지 않음");
	history.back();
	</script>
<%	
}//else if end
%>