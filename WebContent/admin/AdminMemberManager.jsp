<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="member.*" %>
    <%@ page import ="java.util.*" %>
    
<%
request.setCharacterEncoding("utf-8");//post요청 한글 처리
String id=(String)session.getAttribute("memId");//****************
MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기
MemberDTO dto=dao.getMember(id);//dao메서드 호출
%>
<jsp:useBean id="membermanager" class="member.MemberDTO">
	<jsp:setProperty name="dto" property="*"/>	
</jsp:useBean>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="script.js"></script>

<script type="text/javascript">
function admin_modify_member(id){
	document.modifyForm.id.value=id;
	document.modifyForm.submit();
}
</script>
</head>

<body>

<%@ include file="../Header.jsp" %>

<h2>★관리자 전체 회원 관리★</h2>

<form method="post" name="modifyForm" action="member_modify_admin_form.jsp">
<table width="80%">
<tr>
<td>아이디</td>
<td><%=dto.getId() %></td>
</tr>

<tr>
<td>비밀번호</td>
<td><%=dto.getPasswd() %></td>
</tr>

<tr>
<td>이름</td>
<td><%=dto.getName() %></td>
</tr>

<tr>
<td>Email</td>
<td><%=dto.getEmail() %></td>
</tr>

<tr>
<td>우편번호</td>
<td><%=dto.getZipcode() %></td>
</tr>

<tr>
<td>주소</td>
<td><%=dto.getAddr() %></td>
</tr>

<tr>
<td>직업</td>
<td><%=dto.getJob() %></td>
</tr>




</table>
</form>





<%@ include file="../Footer.jsp" %>
</body>
</html>