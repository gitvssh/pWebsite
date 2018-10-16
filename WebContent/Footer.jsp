<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="inner_footer">
	<div class="footer_info">
	<ul>
		<li>
		<small class="txt_copyright">Copyright © <a href="main.jsp">Team Movengers</a> All rights reserved.</small>
		</li>
		
		<li>
		<%
		if(session.getAttribute("admin_id")==null){
			%>
		<input type="button" value="Admin로그인" onClick="javaScript:location='admin/AdminLogin.jsp'">
			
			<%
		}else{
			%>
			<input type="button" value="회원관리" onClick="javaScript:location='admin/MemberManager.jsp'">
		<input type="button" value="Admin로그아웃" onClick="javaScript:location='admin/AdminLogout.jsp'">
			<%
		}
		%>
		</li>
	</ul>
	
	</div>
</footer>