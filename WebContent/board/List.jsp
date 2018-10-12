<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
request.setCharacterEncoding("utf-8"); //한글 변환
%>

<%!
int pageSize=10;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<%
String pageNum=request.getParameter("pageNum");
if(pageNum==null){pageNum="1";};//넘어온 페이지넘버 값이 없으면 1페이지로
int currentPage=Integer.parseInt(pageNum); //현재페이지

int startRow=(currentPage-1)*pageSize+1;//시작페이지

int endRow=currentPage*pageSize;//미지막 페이지

int count=0; //글 갯수
int number=0;//글 번호

/* List list=null;

BoardDAO dao=BoardDAO.getDao(); */
/* count=dao.getCount(); */


%>


<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body bgcolor="cyan">
<%-- <center><b><h1>글목록(전체글):<%=count %></h1></b></center> --%>
<table width="700" align="center">

   <tr>
      <td align="right">
         <a href="WriteForm.jsp"><h3>새글쓰기</h3></a>
      </td>
   </tr>

</table>
<%-- 
<%
if(count==0){//글이 없으면
%>
   <table width="700" border=1>
      <tr>
         <td align="center">
         게시판에 저장된 글이 없습니다.
         </td>
      </tr>
   </table>

<%
}else{//글이 있으면
%>
   <table width="700" border="1" cellpadding="3" align="center">
   
      <tr>
         <td align="center" width="50">번호</td>
         <td align="center" width="200">제목</td>
         <td align="center" width="100">작성자</td>
         <td align="center" width="200">작성일</td>
         <td align="center" width="50">조회수</td>
         <td align="center" width="100">ip</td>
      </tr> --%>