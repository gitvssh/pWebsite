<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="boardmysql.*" %>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="boardmysql.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>




<%
dto.setIp(request.getRemoteAddr());

BoardDAO dao=BoardDAO.getDao();
dao.insertContent(dto);
response.sendRedirect("List.jsp");
%>
