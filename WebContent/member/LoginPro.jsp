<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
 <%@ page import="member.*" %>
 
 <%--LoginPro.jsp --%>
 
 <%
 request.setCharacterEncoding("utf-8");
 String id=request.getParameter("id");
 String passwd=request.getParameter("passwd");
 
 member.MemberDAO dao=member.MemberDAO.getInstance();
 int check=dao.userCheck(id, passwd);
 
 if(check==1){
	 session.setAttribute("memId", id);
	 response.sendRedirect("Main.jsp");
 }else if(check==0){
	 %>
	 <script>
	 alert("비밀번호가 다릅니다");
	 history.back();
	 </script>
	 <%
 }else if(check==-1){
	 %>
	 <script>
	 alert("아이디가 맞지 않습니다");
	 history.bakc();
	 </script>
	 <%
 }//else end
 
 %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insert title here</title>
	</head>
	<body>
	
	</body>
</html>	