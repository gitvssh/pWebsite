<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="member.*" %>
    <%@ page import ="java.util.ArrayList" %>
    
<%
request.setCharacterEncoding("utf-8");//post요청 한글 처리
member.MemberDAO dao=member.MemberDAO.getInstance();//dao 객체 얻기

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

<table style="width:80%">
		<tr style="background-color: cyan">
			<th>아이디</th><th>회원명</th><th>이메일</th><th>전화</th><th>수정</th>
		</tr>

	<%
		ArrayList<MemberDTO> list = dao.getMemberAll();
		for(MemberDTO dto : list){
	%>

			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getJob() %></td>
				<td><a href="javascript:admin_modify_member('<%=dto.getId() %>')">수정하기</a></td>
			</tr>

	<%
		}
	%>
	</table>	


<form method="post" name="modifyForm" action="../member/ModifyForm.jsp">
<input type="hidden" name="id">
</form>


<%@ include file="../Footer.jsp" %>
</body>
</html> 