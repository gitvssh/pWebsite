<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--deleteForm.jsp--%>

<html>
<head>
<script type="text/javascript">
	function begin(){
		//페이지 실행과 동시에 포커스 설정
		document.delForm.passwd.focus();
	}//begin() end
	
	function checkIt(){
		if(!document.delForm.passwd.value){
			alert("패스워드를 입력 하시오");
			document.delForm.passwd.focus();
			return false;
		}
	}//checkIt() end

</script>
</head>

<body onLoad="begin()">
<form name="delForm" method="post" action="DeletePro.jsp" onSubmit="return checkIt()">
<table border="1" cellpadding=3 width="260" align="center">
	<tr height="30">
		<td colspan="2" valign="middle" align="center">
		<font size="+2"><b>회원탈퇴</b></font>
		</td>
	</tr>
	
	<tr height="30">
		<td width="110" align="center">
		비밀번호
		</td>
		
		<td width="150">
		<input type="password" name="passwd" size="15">
		</td>
	</tr>
	
	<tr height="30">
	<td colspan=2 align="center" valign="middle">
	<input type="submit" value="회원탈퇴">
	<input type="reset" value="취소" onClick="window.location='../Gallery.jsp'">
	</td>
	</tr>


</table>

</form>

</body>
</html>