<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="member.*" %>
    <%@ page import="tools.*" %>
    <%--loginPro.jsp --%>
    
    <%
    request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String passwd=request.getParameter("passwd");
    
    member.MemberDAO dao=member.MemberDAO.getInstance();//dao객체 얻기
    int check=dao.userCheck(id,passwd);//dao메서드 호출
    
    if(check==1){//로그인 정상
    	session.setAttribute("memId", id);
    	response.sendRedirect("Gallery.jsp");
    }else if(check==0){//비밀번호가 다를때
    %>	
    	<script>
    	alert("비밀번호가 다릅니다");
    	history.back();
    	</script>
    <%
    }else if(check==-1){//아이디가 존재하지 않을때
    %>
    	<script>
    	alert("아이디가  맞지 않습니다");
    	history.back();
    	</script>
    <%	
    }//else end------------
    
    %>
    