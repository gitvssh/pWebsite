<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무벤져스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style03.css" />
<link rel="stylesheet" type="text/css" href="css/headerfooter.css" />
<link rel="stylesheet" type="text/css" href="css/style_board.css"/>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="List">
<%
String flag=request.getParameter("flag");
if(flag==null){
%>

	<%@ include file="board/List.jsp"%>

<%	
}else if(flag=="content"){
		%>
		<%@ include file="board/Content.jsp"%>
	<%	
}else if(flag=="write"){
	%>
		<%@ include file="board/WriteForm.jsp"%>
	<%	
}else if(flag=="update"){
	%>
		<%@ include file="board/UpdateForm.jsp"%>
	<%	
}else if(flag=="delete"){
	%>
		<%@ include file="board/DeleteForm.jsp"%>
		
	<%	
}
%>	
</div>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>