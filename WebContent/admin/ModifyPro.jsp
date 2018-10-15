<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.*" %>
<%@ page import="admin.*" %>
    <%--modifyPro.jsp--%>
    
<%
request.setCharacterEncoding("utf-8");//post요청 한글 처리
%>

<jsp:useBean id="dto" class="member.MemberDTO">
	<jsp:setProperty name="dto" property="*"/>	
</jsp:useBean>

<html>
<body>
<%
String id = request.getParameter("id");
dto.setId(id);//setter작업

MemberDAO dao=MemberDAO.getInstance();//dao객체얻기
dao.updateAdminMember(dto);//dao메서드 호출
%>

<script>
	alert("회원정보 수정되었습니다");
	location.href="../Gallery.jsp";
</script>

</body>
</html>