<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="boardmysql.*" %>
<%
int event_id=0;
int totalRecord=0;
BoardDAO dao=BoardDAO.getDao();
List<EventDTO> evlist=null;
evlist=dao.eventList(event_id);
totalRecord=evlist.size();

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=totalRecord %>
</body>
</html>