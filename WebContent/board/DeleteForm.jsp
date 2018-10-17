<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
   
<%--deleteForm --%>
<%
int num =Integer.parseInt(request.getParameter("num"));
String pageNum=request.getParameter("pageNum");
%>

<html>
<head>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript">
	function deleteSave(){
		if($('#passwd').val()==""){
			alert("암호를 입력하시오");
			$('#passwd').focus();
			return false;
		}//if
		
	}//function end
	
	</script>
	
</head>
<body >
<center><b><font size="+2">글 삭제</font></b></center>
<form method="post" name="delForm" action="Community.jsp?&flag=deletepro&pageNum=<%=pageNum %>" onSubmit="return deleteSave()">
	<table border="1" cellpadding="5" width="360" align="center">
		<tr height="30">
			<td align="center" >
			<b>암호를 입력하시오</b>
			</td>
		</tr>
		
		<tr height="30">
			<td align="center"> 비밀번호:
			<input type="password" name="passwd" id="passwd" size="8">
			<input type="hidden" name="num" value="<%= num %>">
			</td>
		</tr>
		
		<tr height="30">
			<td align="center" >
			<input type="submit" value="글삭제">
			<input type="button" value="글목록" onclick="document.location='Community.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	
	</table>

</form>


</body>
</html>
