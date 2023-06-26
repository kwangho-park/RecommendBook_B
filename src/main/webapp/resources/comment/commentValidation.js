

/*
 * 유효성검사의 종류 : 공백만 검사(임시)
 * (도서명, 작가명, 제목, 게시글, 추천점수)
 * bookType(분류), favorite(취향), level(난이도) 는 초기값이 주어지기 때문에 " "유효성검사를 안해도됨
 * */


/* 전역 함수 선언 및 정의 */
function commentValidation(){
	
	var result = false;
	
	
	var userNameDom = document.getElementById("userName");
	var pwDom = document.getElementById("pw");
	var contentDom = document.getElementById("content");
	
	
	/* dom객체에 저장된 사용자의 입력값 호출 */
	// 변수에 담아야 debugging 시 break point 사용가능 !!!
	var userName = userNameDom.value;
	var pw = pwDom.value;
	var content = contentDom.value;
	
	
	// filtering logic
	if(userName != ""){
		if(pw != ""){
			if(contemt !=""){
				
				alert("댓글이 수정되었습니다!");
				reult = true;
			}else{ alert("내용을 입력해주세요")}
		}else{ alert("비밀번호를 입력해주세요")}
	}else{ alert("이름을 입력해주세요"); }
	
	return result;
	
} // commentValidation() END


