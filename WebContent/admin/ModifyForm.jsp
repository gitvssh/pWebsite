<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="member.*"%>
<%@ page import ="admin.*"%>

<%--modifyForm.jsp--%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="member.MemberDTO"/>


<%
String id = request.getParameter("id");
MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기
dto =  dao.getMember(id);//dao메서드 호출
%>

<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>



</head>

<body>
<form name="userForm" action="ModifyPro.jsp" >

<table width="600"  border="1" cellpadding="1" align="center">
	<tr>
		<td colspan="2" height="30" align="center">
		<b><font size="5">(^.^)회원정보 수정(^.^)</font></b>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		회원정보 수정 합니다
		</td>
	</tr>
	
	<tr>
		<td width="200"><b>패스워드입력</b></td>
		<td width="400">&nbsp;</td>
	</tr>
	
	<tr>
		<td>사용자 ID</td>
		<td><%=dto.getId() %></td>
	</tr>

	<tr>
		<td>암호</td>
		<td><%=dto.getPasswd() %></td>
	</tr>
	
	<tr>
		<td>암호확인</td>
		<td><%=dto.getPasswd() %></td>
	</tr>
	

	<tr>
		<td>사용자이름</td>
		<td><%=dto.getName()%></td>
	</tr>
	
	<tr>
		<td>주민번호</td>
		<td><%=dto.getJumin1() %>-<%=dto.getJumin2() %></td>
		</tr>
		
		<tr>
		<td>Email</td>
		<td><%=dto.getEmail() %></td>
	</tr>
	
	<tr>
		<td>우편번호</td>
		<td><%=dto.getZipcode() %></td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td><%=dto.getAddr() %></td>
	</tr>
	
	<tr>
		<td>직업</td>
		<td><%=dto.getJob() %></td>
	</tr>
	
	<tr>
		<td>레벨</td>
		<td>
		
		<select name="level">
		<%
			out.println("<option value='0'>선택하시오</option>");
		%>
		<option value="1">정상</option>
		<option value="2">블랙리스트</option>
		<option value="9">관리자</option>
		</select>
	
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="수정">
		<input type="button" value="취소" onClick="javaScript:location='../Gallery.jsp'">
		</td>
	</tr>
	
	
</table>



</form>

</body>
</html>