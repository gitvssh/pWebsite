
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
BoardDAO dao=BoardDAO.getDao();//dao객체 얻기
Vector<BoardDTO> vec=null;

%>

<%

String im=request.getParameter("keyWord");

if(request.getParameter("keyWord")!=null){
	keyWord=request.getParameter("keyWord");
	keyField=request.getParameter("keyField");
}
if(request.getParameter("reload")!=null){
	if(request.getParameter("reload").equals("true")){
		keyWord="";
		keyField="";
	}
}

%>

<%!

SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<%

vec=dao.getBoardList(keyField, keyWord);//dao메서드 호출

totalRecord=vec.size();//총 글갯수

if(request.getParameter("page")!=null){
	nowPage=Integer.parseInt(request.getParameter("page"));//현재 페이지
}

beginPerPage=nowPage * numPerPage; //시작 페이지 계산
		// 0 * 10 = 0 	0 ~ 9		//해당페이지의 시작
		// 1 * 10 = 10	10 ~ 19
		// 2 * 10 = 20	20 ~ 29
		// 3 * 10 = 30	30 ~ 39
		// 4 * 10 = 40	40 ~ 49
		
		
totalPage=(int)Math.ceil((double)totalRecord/numPerPage); //Math.ceil()=>올림값
totalBlock=(int)Math.ceil((double)totalPage/pagePerBlock);//전체 블럭계산
		// 예를 글갯수 32개라면 : 4개의 페이지 나오도록 한다
		//totalPage=(int)Math.ceil((double)32/10);
if(request.getParameter("nowBlock")!=null){
	nowBlock=Integer.parseInt(request.getParameter("nowBlock"));//현재 블럭을 얻는다
}
		
%>

 <%-- <%
int pageSize=10;
vec=dao.getBoardList(keyField, keyWord);
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
	}//넘어온 페이지넘버 값이 없으면 1페이지로
int currentPage=Integer.parseInt(pageNum);

int startRow=(currentPage-1)*pageSize+1;
/* (1-1)*10+1=1
(2-1)*10+1=11
(3-1)*10+1=21
(4-1)*10+1=31
(5-1)*10+1=41 */
int endRow=currentPage*pageSize;
/* 1*10=10
2*10=20
3*10=30
4*10=40
5*10=50 */

int count=0;//글 갯수
int number=0;//글 번호



count=dao.getArticleCount();//dao메서드 호출하여, 글 갯수 얻기

if(count>0){//글이 존재하면
   vec=dao.getBoardList(keyField, keyWord);//dao메서드 호출
}//시작위치, 개수

number=count-(currentPage-1)*pageSize;//보여질 글번호
//37-(3-1)*10=17

//1페이지 1~10
//2페이지 11~20
//3 페이지 21~30
//4페이지 31~37
%>  --%>

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
	document.listForm.action="List.jsp";
	document.listForm.submit(); 
}

</script>
</head>
<body >

<center><b><h1>자유게시판</h1></b></center>
<table width="700" align="center">

   <tr>
      <td align="right" >
         <a href="WriteForm.jsp"><h3>새글쓰기</h3></a>
      </td>
   </tr>

</table>

<%
if(totalRecord==0){//글이 없으면
%>
   <table width="700" border=1 align="center">
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
         <td align="center" width="50">글번호</td>
         <td align="center" width="200">제목 </td>
         <td align="center" width="100">작성자</td>
         <td align="center" width="200">작성일</td>
         <td align="center" width="50">조회수</td>
         
      </tr>
   <%
   for(int i=0;i<vec.size();i++){
      BoardDTO dto=(BoardDTO)vec.get(i);
      
      if(dto.getCategory()!=0){
    	  continue;
      } 
    	  
      %>
      <tr height="30">
          <td align="center"> <%=totalRecord-i %></td> 
         <td>
         <%-- 답글 들여쓰기 --%>
         <%
         int wid=0;
         if(dto.getRe_level()>0){//답글이면
            wid=5*(dto.getRe_level());
         %>
        
         <%
         }else{//원글
            %>
           
            <%
         }//답글 이미지,들여쓰기
         %>
         
         <%--글제목 --%>
         <a href="Content.jsp?num=<%=dto.getNum() %>&pageNum=<%=nowPage %>&conNum=<%=totalRecord-i %>">
           <%=dto.getSubject() %>
         </a>
         <%
         if(dto.getReadcount()>20){//조회수가 20번 이상이면 hot.gif 표시
         %>
         <img src="../imgs/hot.gif" height="10" border="0">
         <%   
         }//조회수 hot.gif
         %>
         </td>
         
         <%--글쓴이 --%>
         <td align="center">
            <a href="mailto:<%=dto.getEmail() %>">
               <%=dto.getId() %>
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
if(totalPage>0){
%>
<table border="1" width="700" align="center">
   <tr>
      <td align="center">
         <%
         int pageCount=totalPage/numPerPage+(totalRecord%numPerPage==0?0:1);
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
             <a href="List.jsp?pageNum=<%=startPage - 10%>">[이전블럭]</a>
             <%
          }//if
         %>
         <%
         //page처리
         for(int i=startPage; i<=endPage; i++){
            %>
            <a href="List.jsp?pageNum=<%=i%>">[<%=i %>]</a>
            <%
         }//for
         %>
         <%
         //다음블럭
         if(endPage < pageCount){
            %>
            <a href="List.jsp?pageNum=<%=startPage + 10%>">[다음블럭]</a>
            <%
         }//if
         %>
      </td>
   </tr>
</table>

<form name="searchForm" method="post" action="List.jsp">
	<table bgcolor="margenta" width="700" border=1 align=center cellpadding=4 cellspacing=0>
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
			<a href="javascript:list()">[리스트 처음으로]</a>
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