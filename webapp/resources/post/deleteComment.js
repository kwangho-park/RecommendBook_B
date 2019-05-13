



/* 댓글 삭제 버튼 클릭시 동작하는 logic */   
function deleteComment(){
	 
 
  var input = confirm("해당 댓글을 삭제하시겠습니까?");
                
  
  if(input){
    
  	alert("댓글이 삭제되었습니다!");
  	return true;
  	
  }else{
	alert("취소 되었습니다!")
	return false;
  }
  
}// deleteCommentBtn() END