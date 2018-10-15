<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardmysql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>


<%--content.jsp--%>
<%-- num:<%=request.getParameter("num")%><br>
pageNum:<%=request.getParameter("pageNum")%> --%>

<html>
   <head>
      <link href="style.css" rel="stylesheet" type="text/css">
   </head>
   <%
      int num = Integer.parseInt(request.getParameter("num"));
      String pageNum = request.getParameter("pageNum");
      int conNum = Integer.parseInt(request.getParameter("conNum"));
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   
      BoardDAO dao = BoardDAO.getDao();
      BoardDTO dto = dao.getArticle(num);
    
      
   
      int ref = dto.getRef();
      int re_step = dto.getRe_step();
      int re_level = dto.getRe_level();
   %>
   <body>
      <center><h1>글내용보기</h1></center>
 
  
      <table width="500" border="1" cellpadding="3" align="center">
         <tr height="30">
            <td align="center" width="125" >글번호</td>
            <td align="center" width="125"><%=conNum %></td>
            <td align="center" width="125" >조회수</td>
            <td align="center" width="125"><%=dto.getReadcount() %></td>
            
            
         </tr>
         <tr height="30">
            <td align="center" width="125" >작성자</td>
            <td align="center" width="125"><%=dto.getId() %></td>
            
            <td align="center" width="125" >작성일</td>
            <td align="center" width="125"><%=sdf.format(dto.getRegdate()) %></td>
         </tr>
         <tr height="30">
            <td align="center" width="125" >카테고리</td>
            <td align="center" width="375" colspan="3"><%=dto.getCategory() %></td>
         </tr>
         <tr height="30">
            <td align="center" width="125" >글제목</td>
            <td align="center" width="375" colspan="3"><%=dto.getSubject() %></td>
         </tr>
         <tr height="30">
            <td align="center" width="125" >글내용</td>
            <td align="center" width="375" colspan="3">
            <%
               String im = dto.getContent();
               im=im.replace("\n", "<br>");
               %>
               <%=im %>
    
               
            </td>
         </tr>
         <tr height="30">
            <td colspan="4"  align="right">
               <input type="button" value="글수정" onClick="document.location.href='UpdateForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'" >
               <input type="button" value="글삭제" onClick="document.location.href='DeleteForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
               <input type="button" value="답글쓰기" onClick="document.location.href='WriteForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
               <input type="button" value="리스트" onClick="document.location.href='List.jsp?pageNum=<%=pageNum%>'">
            </td>
         </tr>
      </table>
   </body>
</html>