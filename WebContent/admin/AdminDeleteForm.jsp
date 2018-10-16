<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="member.*"%>
<%@ page import ="admin.*"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style_admin.css" />

<jsp:useBean id="dto" class="member.MemberDTO"/>
<%	request.setCharacterEncoding("utf-8"); %>


<%
String id = request.getParameter("id");
MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기
dto =  dao.getMember(id);//dao메서드 호출
%>
</head>
<body>

<form name="deleteForm" method="post" action="AdminDeletePro.jsp" >
<table cellpadding=3 width="500" align="center" bgcolor="#f9fafb">
	<tr height="50" >
		<td colspan="2" valign="middle" align="center">
		<font size="+2"><%=dto.getId() %><b> 회원 삭제 하시겠습니까?</b></font>
		</td>
	</tr>
	
	
	<tr>
	<td colspan=2 align="center" valign="middle">
	<input type="submit" value="삭제" class="btn">
	<input type="reset" value="취소" onClick="window.location='MemberManager.jsp'" class="btn2">
	</td>
	</tr>


</table>

</form>

</body>
</html>