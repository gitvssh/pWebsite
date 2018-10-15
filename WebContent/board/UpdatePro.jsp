<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="boardmysql.*"%>
<%-- updatePro.jsp --%>

<%
request.setCharacterEncoding("utf-8");
%>

<%-- setter 작업 --%>

<jsp:useBean id="dto" class="boardmysql.BoardDTO">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
String pageNum=request.getParameter("pageNum");
BoardDAO dao=BoardDAO.getDao();//dao 객체 얻기
int check=dao.updateArticle(dto);//dao 메서드 호출
//check=1 정상수정
//check=0 암호틀림

if(check==1){//정상 수정
		response.sendRedirect("List.jsp?pageNum=" +pageNum);
}else{//수정 실패
%>
	<script>
	 	alert("비밀번호가 틀립니다.");
	 	history.back();
	</script>
<%
}//else end
%>