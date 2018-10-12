<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardmysql.*" %>


<%-- updateForm.jsp--%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");

BoardDAO dao=BoardDAO.getDao();//dao 객체 얻기
BoardDTO dto=dao.updateGetArticle(num);//dao메서드 호출

%>
<body >
<center><b><font size="+2">글 수정</font></b></center>

<form name="writeForm" method="post" action="UpdatePro.jsp?pageNum=<%=pageNum %>">
	<table width="400" border="1" cellpadding="5"  align="center">
	
	<tr>
		<td width="70"  align="center">이름</td>
		<td width="330">
			<input type="text" name="writer" id="writer" size="10" value="<%=dto.getId() %>">
			<input type="hidden" name="num" value="<%=num %>">
		</td>
	</tr>
	
	<tr>
		<td  align="center">제목</td>
		<td>
		<input type="text" name="subject" id="subject" size=40 value="<%=dto.getSubject() %>">
		</td>
	</tr>
	
	<tr>
		<td  align="center">이메일</td>
		<td>
		<input type="text" name="email" id="email" size="30" value="<%=dto.getEmail() %>">
		</td>
	</tr>
	
	<tr>
		<td  align="center">글내용</td>
		<td>
		<textarea name="content" id="content" rows="10" cols="40"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	
	<tr>
		<td  align="center">암호</td>
		<td>
		<input type="password" name="passwd" id="passwd" size=8>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="글수정">
		<input type="reset" value="다시수정">
		<input type="button" value="글목록보기"	onClick="document.location='List.jsp?pageNum=<%=pageNum %>'">
		</td>
	</tr>
	</table>

</form>
</body>
</html>
