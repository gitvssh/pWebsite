<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tools.Init" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%! tools.Init inita=new tools.Init();  %>
<%

if(inita.createBoard()){
	out.print("01.Board 생성 성공<br>");
}else{
	out.print("01.Board 생성 실패<br>");
}
if(inita.createMember()){
	out.print("02.Member 생성 성공<br>");
}else{
	out.print("02.Member 생성 실패<br>");
}
if(inita.createEvent()){
	out.print("03.Event 생성 성공<br>");
}else{
	out.print("03.Event 생성 실패<br>");
}
if(inita.createEventApply()){
	out.print("EventApply 생성 성공<br>");
}else{
	out.print("EventApply 생성 실패<br>");
}
if(inita.createEventWin()){
	out.print("EventWin 생성 성공<br>");
}else{
	out.print("EventWin 생성 실패<br>");
}
if(inita.createGenre()){
	out.print("Genre 생성 성공<br>");
}else{
	out.print("Genre 생성 실패<br>");
}
if(inita.createMovieInfo()){
	out.print("MovieInfo 생성 성공<br>");
}else{
	out.print("MovieInfo 생성 실패<br>");
}
if(inita.createMovieReview()){
	out.print("MovieReview 생성 성공<br>");
}else{
	out.print("MovieReview 생성 실패<br>");
}

%>
</head>
<body>

</body>
</html>