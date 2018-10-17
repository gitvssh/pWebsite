<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무벤져스의 영화갤러리</title>
<link rel="stylesheet" type="text/css" href="css/style03.css" />
<link rel="stylesheet" type="text/css" href="css/headerfooter.css" />
<link rel="stylesheet" type="text/css" href="css/style_board.css"/>
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
}else if(flag.equals("content")){
		%>
		<%@ include file="board/Content.jsp"%>
	<%	
}else if(flag.equals("write")){
	%>
		<%@ include file="board/WriteForm.jsp"%>
	<%	
}else if(flag.equals("update")){
	%>
		<%@ include file="board/UpdateForm.jsp"%>
	<%	
}else if(flag.equals("delete")){
	%>
		<%@ include file="board/DeleteForm.jsp"%>
		
	<%
}else if(flag.equals("writepro")){
	%>
		<%@ include file="board/WritePro.jsp" %>
	<%

}else if(flag.equals("deletepro")){
	%>
	<%@ include file="board/DeletePro.jsp" %>
	<%
}else if(flag.equals("updatepro")){
	%>
		<jsp:include page="board/UpdatePro.jsp"/>
		<%
}
	%>
	
	
</div>
	
	<%@ include file="Footer.jsp"%>
</body>
</html>