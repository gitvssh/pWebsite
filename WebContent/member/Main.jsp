<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
 <%--Main.jsp --%>
 
<html>
	<head>
	<script type="text/javascript">
	
	function focus(){
		document.inform.id.focus();
	}//focus() end---------------

	function check(){
		inputForm=eval(document.inform);
		
		$(!inputForm.id.value){
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
			
		}
			$(!inputForm.passwd.value){
				alert("비밀번호를 입력하세요");
				inputForm.passwd.focus();
				return false;
				
			
		}
	}//check end----------
	</script>
	</head>
	<body>
	<%if(session.getAttribute("memId")==null){//로그인 x
		%>
	
	<form name="inform" method="post" action="LoginPro.jsp" onSubmit="return check()">
	
	<table width="300" align="center" border="1">
		<tr> 
		<td width="100" align="right">
			아이디</td>
			
			<td width="100" >
			<input type="text" name="id" size="16">
			</td>
		</tr>
		
		<tr>
		<td align="right">
		비밀번호</td>
		<td>
		<input type="password" name="passwd" size="20">
		</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onClick="javaScript:location='InputForm.jsp'">
			</td>
			</tr>
	
	</table>
	
	</form>
	
		
		<%
	}else{//로그인o()
		%>
			<table width="250" height="70" align="center" border="1" >
		<tr>
		<td width="40%" colspan="2" >
		<%
		String memId=(String)session.getAttribute("memId");
		%>
		<%=session.getAttribute("memId") %>님의 방문을 환영합니다<br>
		
		<form method="post" action="Logout.jsp">
			<input type="submit" value="로그아웃">
			<input type="button" value="회원정보변경" onClick="javaScript:location='Modify.jsp'">
		</form>
		
		</td>
		</tr>
		
	</table>	
		
		
		<%
	}//else end

	
	%>
	</body>
</html>	