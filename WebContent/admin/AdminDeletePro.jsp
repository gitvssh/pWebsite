<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="member.*" %>
     <%@ page import="tools.*" %>

    <%--AdminDeletePro.jsp --%>



<%
request.setCharacterEncoding("utf-8");//post요청 한글 처리
%>

<jsp:useBean id="dto" class="member.MemberDTO">
	<jsp:setProperty name="dto" property="*"/>	
</jsp:useBean>

<html>
<body>

<%
String id = request.getParameter("id");
dto.setId(id);//setter작업
String passwd = request.getParameter("passwd");
dto.setPasswd(passwd);
%>



<%
MemberDAO dao=MemberDAO.getInstance();//dao객체얻기
dao.deleteAdminMember(id, passwd);//dao메서드 호출
%>

<script>
	alert(<%=dto.getId()%>+" 회원삭제 되었습니다");
	location.href="MemberManager.jsp";
</script>

</body>
</html>










<%--
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = (String)request.getParameter("id");
	boolean b = dao.deleteData(id);
	if(b){
%>
		<script>
			alert("삭제 성공");
			location.href = "MemberManager.jsp";
		</script>	
<% } else { %>
		<script>
			alert("삭제 실패!\n");
			history.back();
		</script>	
<%
	}
%>

 --%>





<%--

<%	request.setCharacterEncoding("utf-8"); 
//String id=(String)session.getAttribute("Id");


String id=request.getParameter("id");
	MemberDAO dao=MemberDAO.getInstance();//dao객체얻기

int check=dao.deleteAdminMember(id);
if(check==1){//삭제완료
//	session.invalidate();//세션 무효화
%>
<body>
<script>
	alert("삭제되었습니다");
	location.href="MemberManager.jsp";
</script>
</body>

	
<%
}//if end
%>
 --%>
