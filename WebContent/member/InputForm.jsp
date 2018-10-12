<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
 <%--InputForm.jsp --%>
 
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function openDaumPostcode(){
	//alert("A")
	new daum.Postcode({
		oncomplete:function(data){
			document.getElementById('zipcode').value=data.postcode1+"-"+data.postcode2;
			document.getElementById('addr').value=data.address;
 		}
		
	}).open();
}//openDaumPostcode()---
</script>

<script type="text/javascript">
function check(){//데이터 유효성 체크 하기 위한 함수
	if($('#id').val()==''){
		alert("ID를 입력하시오");
		$('#id').focus();
		return false;
	}
	if($('#passwd').val()==''){
		alert("비밀번호를 입력하시오");
		$('#passwd').focus();
		return false;
	}
	if($('#passwd2').val()==''){
		alert("비밀번호 확인을 입력하시오");
		$('#spasswd2').focus();
		return false;
	}
	if($('#passwd').val()!=$('#passwd2').val()){
		alert("비밀번호가 일치하지 않습니다");
		$('#passwd').focus();
		return false;
	}
	if($('#name').val()==''){
		alert("이름을 입력하시오");
		$('#name').focus();
		return false;
	}
	return true;
}// check() end-----------------------------

function confirmIDCheck(){
	//alert($('#id').val());
	//alert("aaa");
	if($('#id').val()==''){
		alert("id를 입력하시오");
		$('#id').focus();
	}else{
		$.ajax({
			type:"POST",
			url:"confirmId.jsp",
			data:"id="+$('#id').val(),
			dataType:"JSON",
			success:function(data){
				//alert(data.check);//1 또는 -1	
				
				if(data.check==1){
					alert("사용중인 id 입니다");
					$('#id').val("").focus();
				}else{
					alert("사용 가능한 id 입니다");
					$('#passwd').focus();
				}//else--------
			}//success end
		});//$.ajax() end
		
	}//else end
		
}//confirmIDCheck() end-------------------------------
</script>
</head>
<body>
<form method="post" name="">
<table>


</table>

</form>
	
</body>
</html>	