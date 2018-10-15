<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="boardmysql.*"%>

<%-- deletePro.jsp--%>

<%
request.setCharacterEncoding("utf-8");

int num=Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
String passwd=request.getParameter("passwd");

BoardDAO dao=BoardDAO.getDao();//dao 객체 얻기
int check=dao.deleteArticle(num, passwd);//dao메서드 호출

if(check==1){//정상적으로 삭제
		response.sendRedirect("List.jsp?pageNum="+pageNum);
}else{//삭제실패
	%>
	<script>
		alert("비밀번호가맞지 않습니다.");
		history.back();
	</script>
	<%
	
}
%>