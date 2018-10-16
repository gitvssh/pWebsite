<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.*" %>
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
String id=(String)session.getAttribute("memId");
dto.setId(id);//setter작업
String passwd=tools.Sha256.encrypt(request.getParameter("passwd"));
dto.setPasswd(passwd);//setter작업

MemberDAO dao=MemberDAO.getInstance();//dao객체얻기
dao.updateMember(dto);//dao메서드 호출
%>

<script>
	alert("회원정보 수정되었습니다");
	location.href="../Gallery.jsp";
</script>

</body>
</html>