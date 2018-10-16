<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--modify.jsp --%>
    
<%@ page import ="member.*"%>
<%@ page import ="admin.*"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style_member.css" />
<%	request.setCharacterEncoding("utf-8"); %>
</head>
<body>



<table cellpadding=3 width="500" align="center" bgcolor="#f9fafb">
	<tr height="50" >
		<td colspan="2" valign="middle" align="center">
		<font size="+2"><b> 회원수정, 회원탈퇴</b></font>
		</td>
	</tr>
	
	
	<tr>
	<td colspan=2 align="center" valign="middle">
	<input type="button" value="회원수정" onClick="window.location='ModifyForm.jsp'" class="btn2">
	<input type="button" value="회원탈퇴" onClick="window.location='DeleteForm.jsp'" class="btn3">
	</td>
	</tr>


</table>

<!-- 
<p>
<a href="ModifyForm.jsp">정보수정</a>
<a href="DeleteForm.jsp">탈퇴</a>
 -->
</body>
</html>