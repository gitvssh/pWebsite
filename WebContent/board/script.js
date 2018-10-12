function writeSave(){
 //script.js		   
	if($("#writer").val()==''){
	   alert("이름을 입력 하시요 ");
	   $("#writser").focus();
	   return false;
   }
   if($("#subject").val()==''){
	   alert("글제목을 입력 하시요 ");
	   $("#subject").focus();
	   return false;
   }
   if($("#content").val()==''){
	   alert("글내용을 입력 하시요 ");
	   $("#content").focus();
	   return false;
   }
  
   return true;
   }//writeSave() end
	 
function Search(){
	if($("#KeyWord").val()==''){
		alert("검색어를 입력하시오");
		$("#KeyWord").focus();
	
		return false;
	}
	return true;
	
}
