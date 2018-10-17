

<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardmysql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>


<%-- list.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>

<%!
int nowPage=0;//현재 페이지
int nowBlock=0;// 현재 블럭

int totalRecord=0;// 전체 글 갯수
int numPerPage=10;//페이지당 글 갯수, 1페이지에 10개씩
int totalPage=0;//전체 페이지 수

int totalBlock=0;//전체 블럭수
int pagePerBlock=10;// 블럭당 페이지 수 10개
int beginPerPage=0;// 시작 페이지( 페이지의 시작)

String keyField="";
String keyWord="";
SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");

BoardDAO dao=BoardDAO.getDao();//dao객체 얻기
Vector<BoardDTO> vec=null;

%>



<%
String pageNum=request.getParameter("pageNum");
if(pageNum==null){pageNum="1";};
int currentPage=Integer.parseInt(pageNum);

int startRow=(currentPage-1)*numPerPage+1;
int endRow=currentPage*numPerPage;


int count=0;//글 갯수
int number=0;//글 번호
List list=null;

BoardDAO dao=BoardDAO.getDao();//dao객체 얻기
count=dao.getArticleCount();//dao메서드 호출하여, 글 갯수 얻기



number=count-(currentPage-1)*numPerPage;//보여질 글번호

String im=request.getParameter("keyWord");

if(request.getParameter("keyWord")!=null){
	keyWord=request.getParameter("keyWord");
	keyField=request.getParameter("keyField");
	list=dao.getBoardList(keyField, keyWord);//dao메서드 호출
	count=list.size();//총 글갯수
}
if(request.getParameter("keyWord")==null){
		keyWord="";
		keyField="";
	if(count>0){//글이 존재하면
		list=dao.getList(startRow, numPerPage);//dao메서드 호출
	}//시작위치, 개수
}
%>


<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
function check(){
	if(document.searchForm.keyWord.value==''){
		alert("검색어를 입력하시오");
		document.searchForm.keyWord.focus();
		return false;
	}
	document.searchForm.submit(); //List.jsp로 간다
}
function list(){
	document.listForm.action="Community.jsp";
	document.listForm.submit(); 
}

</script>
</head>
<body>
<center><b><h1 id="free">자유게시판</h1></b></center>

<%
if(count==0){//글이 없으면
%>
   <table width="700" border=1 align="center">
      <tr>
         <td align="center">
         게시판에 저장된 글이 없습니다.
         </td>
         <input type="button" value="글쓰기" onclick="window.location='Community.jsp?&flag=write'">
      </tr>
      
   </table>

<%
}else{//글이 있으면
%>
   <table width="700" border="1" cellpadding="3" align="center" class="tb">
   
      <tr class="t1">
         <td align="center" width="50">글번호</td>
         <td align="center" width="200">제목 </td>
         <td align="center" width="100">작성자</td>
         <td align="center" width="200">작성일</td>
         <td align="center" width="50">조회수</td>
         
      </tr>
   <%
   for(int i=0;i<list.size();i++){
      BoardDTO dto=(BoardDTO)list.get(i);
      
      if(dto.getCategory()!=0){
    	  continue;
      } 
    	  
      %>
      <tr height="30">
          <td align="center"> <%=count-(currentPage-1)*numPerPage-i %></td> 
         <td>
         <%-- 답글 들여쓰기 --%>
         <%
         int wid=0;
         if(dto.getRe_level()>0){//답글이면
            wid=5*(dto.getRe_level());
         %>
        	<img src="img/level.gif" width="<%=wid %>" height="16">
         	<img src="img/re.gif">
         <%
         }else{//원글
            %>
           
            <%
         }//답글 이미지,들여쓰기
         %>
         
         <%--글제목 --%>
         <a href="Community.jsp?num=<%=dto.getNum() %>&flag=content&pageNum=<%=nowPage %>&conNum=<%=count-(currentPage-1)*numPerPage-i %>">
           <%=dto.getSubject() %>
         </a>
         
         </td>
         
         <%--글쓴이 --%>
         <td align="center">
            <a href="mailto:<%=dto.getEmail() %>">
               <%=dto.getId() %>/총글개수:<%=count %>
            </a>
         </td>
         
         <td align=center><%=sdf.format(dto.getRegdate())%></td>
         <td align=center><%=dto.getReadcount() %></td>
         
      </tr>
      <%
   }//for
   %>
   </table>
<%
}//if(count==0)
%>

<%------------------------블럭처리, 페이지 처리--------------------%>
	<%
if(count>0){
%>
<table border="1" width="700" align="center" class="tb">
   <tr>
      <td align="center">
         <%
         int pageCount=count/numPerPage+(totalRecord%numPerPage==0?0:1);
         //int pagecount=(int)(Math.ceil(count/pageSize));
         
         int pageBlock=10;//블럭당 페이지 수 10개
         int startPage=(int)(nowPage/pageBlock)*10+1;//시작페이지
         /* (1/10)*10+1=1
         (5/10)*10+1=1
         (9/10)*10+1=1
         
         (11/10)*10+1=11
         (15/10)*10+1=11
         (19/10)*10+1=11
         
         (21/10)*10+1=21
         (25/10)*10+1=21
         (29/10)*10+1=21
          */
          int endPage=startPage+pageBlock-1;//끝페이지
          /* 1+10-1=10
          11+10-1=20
          21+10-1=30 */
          
          if(endPage > pageCount){//에러방지를 위해
             endPage = pageCount;
          }
          
          //이전블럭
          if(startPage > 10){
             %>
             <a href="Community.jsp?pageNum=<%=startPage - 10%>">[이전블럭]</a>
             <%
          }//if
         %>
         <%
         //page처리
         for(int i=startPage; i<=endPage; i++){
            %>
            <a href="Community.jsp?pageNum=<%=i%>">[<%=i %>]</a>
            <%
         }//for
         %>
         <%
         //다음블럭
         if(endPage < pageCount){
            %>
            <a href="Community.jsp?pageNum=<%=startPage + 10%>">[다음블럭]</a>
            <%
         }//if
         %>
      </td>
   </tr>
</table>

<form name="searchForm" method="post" action="Community.jsp">
	<table bgcolor="margenta" width="700" border=1 align=center cellpadding=4 cellspacing=0 class="tb">
	<tr>
		<td align=center valign=bottom>
			<select name="keyField">
				<option value="subject">제목</option>
				<option value="id">이름</option>
				<option value="content">글내용</option>
			</select>
		
			<input type="text" name="keyWord" size=16>
			<input type="hidden" name="page" value="0">
			<input type="button" value="찾기" onClick="check()">
			&nbsp;&nbsp;
			
			<a href="javascript:list()" >[리스트 처음으로]</a>
			 &nbsp;&nbsp;<a href="Community.jsp?&flag=write" ><b>새글쓰기</b></a>
			
		</td>
			
			
		</tr>
	
	
	</table> 
</form>
<form name="listForm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="page" value="0">
	<input type="hidden" name="nowBlock" value="0">
</form>
<%
}
%>

</body>
</html>