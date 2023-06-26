<!-- 게시글 조회 페이지 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>

    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<!-- bootstrap link -->
	<%@ include file="/WEB-INF/views/common/cssLink.jspf"%>

    
</head>

<c:if test="${requestScope.modifyFlag == true}">
	<script> alert("댓글이 저장되었습니다")</script>
</c:if>

<body>

  <div class="site-wrap">
  
	<!-- .site-mobile-menu -->
    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> 
    
    <!-- navigation -->   
    <header class="site-navbar py-1" role="banner">
		<%@ include file="/WEB-INF/views/common/menuBar.jspf"%>
    </header>

	<!-- [장기적 고민] -->
	<!-- chasing 문제로 추정 : 그러나 로컬서버에서 실행시는 해결되지않았으며, AWS hosting서버에서는 해결됨-->
	<!-- 마치.. 로컬에 자원을 사용하지못하고 과거에 캐쉬메모리에 저장된 이미지자원을 사용하는것처럼 느껴짐 -->
    <div class="unit-5 overlay" style="background-image: url('/RecommendBook_B/images/book1.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">View Post</h2>
      </div>
    </div>

    
    
    <!-- ---------------section-------------- -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8 mb-5">
          
            
          <!-------------- 게시글 양식 --------------->
  		  <div class="p-5 bg-white">
              <!-- 도서명 -->
              <div class="form-group">
              	<div class="form-row">
                  <label class="font-weight-bold" for="bookName">도 서 명</label>
              	</div>
              	<div class="form-row">
                  <div class="col-md-6 mb-3 mb-md-0">
                    ${requestScope.dto.bookName }
                  </div>
              	</div>
              </div>
  
  
			  <!-- 작가명 -->
              <div class="form-group mb-5">
                <div class="form-row">
                  <label class="font-weight-bold" for="writer">작 가 명</label>
                </div>
   				<div class="form-row">
   				  <div class="col-md-6 mb-3 mb-md-0">
                    ${requestScope.dto.writer }
                  </div>
   				</div>             
              </div>
  
  
  
			  <!-- 제목 -->
              <div class="form-group mb-4">
                <div class="form-row">
                  <div class="col-md-12"><h3>제 목</h3></div>
                </div>
                <div class="form-row">
                  <div class="col-md-12 mb-3 mb-md-0">
                    ${requestScope.dto.title }
                  </div>
                </div>
              </div>


			  <!-- 내용 -->
              <div class="form-group">
                <div class="form-row">
                  <div class="col-md-12"><h3>내 용</h3></div>
                </div>
                <div class="form-row">
                  <div class="col-md-12 mb-3 mb-md-0">
                    ${requestScope.dto.content }
                  </div>
                </div>
              </div>
			  <br>
			  
			  
			 <!-- 도서 취향정보 -->
			 <div class="form-group">
			   <div class="form-row">
			     <label class="font-weight-bold" for="bookType">도 서 &nbsp;&nbsp;정 보</label>
			   </div>

			   <div class="form-row">
				<!-- 분류 -->
				분류 : ${requestScope.dto.bookType}, &nbsp;&nbsp;

 				<!--취향 -->
				취향 : ${requestScope.dto.favorite }, &nbsp;&nbsp;
                      
                <!-- 난이도 -->
				난이도 : ${requestScope.dto.bookLevel}
               </div>
            </div>
     
			 
            <!-- 추천 점수 -->
            <div class="form-group">
              <div class="form-row">
                <label class="font-weight-bold" for="score">추 천 &nbsp;&nbsp;점 수</label>
              </div>
              <div class="form-row">
                <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
				 	${requestScope.dto.score }
                </div>
              </div>  
            </div>


 

            <!-- 게시글 삭제 / 수정 버튼 -->
            <!-- 댓글 작성 버튼 -->    
    		<div class="row form-inline">
			  	<div class="form-group">
					<input type="button" value="게시글 수정" id="modifyPostBtn" onclick="location.href='/RecommendBook_B/post/modifyPost?postNum=${requestScope.dto.postNum}'" class="btn bg-warning text-white py-2 px-5">

	               	<form name="deletePost" action="/RecommendBook_B/post/deletePost" onsubmit="return deletePostBtn()" method="post"> &nbsp;&nbsp;
    	            
          			  <!-- [추후] 변경예정 -->
	      			  <!-- [hidden] 게시글 삭제를 위한 DB table의 num값을 보관 -->
       	  			  <input type="hidden" name="postNum" value="${requestScope.dto.postNum}">

                	  <input type="submit" value="게시글 삭제" id="deletePostBtn"  class="btn bg-warning text-white py-2 px-5">  &nbsp;&nbsp;
                	  
               		</form>				   	
					<input type="button" value="댓글 작성" id="newCommentBtn" onclick="location.href='/RecommendBook_B/comment/newComment?postNum=${requestScope.dto.postNum}' " class="btn bg-warning text-white py-2 px-5">

			  	</div>
			  </div>

			</div>
            <!-------------- 게시글 양식 END--------------->

			<br>




            <!------------------ 댓글 양식(bootstrap CDN) ---------------->
            <c:if test="${requestScope.commentList != null}">
            <c:forEach var="comment" items="${requestScope.commentList }" >			  
			<div class="p-5 bg-white">

  					<div class="form-row">
    					<div class="form-group col-md-6">
      						<label>Name</label><br>
      						${comment.userName}
    					</div>
    				    <div class="form-group col-md-6">
				            <label>Password</label><br>
      						**** 
    					</div>
  				    </div>
  				    <div class="form-row">
  						<div class="form-group">
	    					<label>Comment</label><br>
    						${comment.content}
  						</div>
					</div>
					
					
					<!-- 추후 댓글의 아이디/pw 필터링 후 수정/삭제 -->
 					<!-- 댓글 삭제 / 수정 버튼 -->    
	    			<div class="row form-inline">
					  	<div class="form-group">
			  			
				  		  	<input type="button" value="댓글 수정" id="modifyCommentBtn" onclick="location.href='/RecommendBook_B/comment/modify?commentNum=${comment.commentNum}'" class="btn bg-warning text-white py-2 px-5"> &nbsp;&nbsp;
			  	  	
				  	  		<!-- [궁금증] onsubmit 의 function과 tag의 id를 동일한 이름으로 지정시 function이 동작하지않는 이유는?-->
	    	           		<form name="deleteComment" action="/RecommendBook_B/comment/delete" onsubmit="return deleteComment()" method="post">
            	    	  		<input type="submit" value="댓글 삭제" id="CommentCommentBtn"  class="btn bg-warning text-white py-2 px-5">

                		  		<!-- [추후] 변경예정 -->
								<!-- [hidden] 댓글 삭제를 위한 댓글 번호 보관-->
								<input type="hidden" name="commentNum" value="${comment.commentNum}">
								
								<!-- [추후] 변경예정 -->
	      			  			<!-- [hidden] 게시글 조회 위한 DB table의 num값을 보관 -->
	       	  			  		<input type="hidden" name="postNum" value="${requestScope.dto.postNum}">

    	           			</form>

				  		</div>
					</div>
				</div>
            	</c:forEach>
            	</c:if>			
            	<!------------------ 댓글 양식 END ---------------->  

          </div>

        </div>
      </div>
    </div>
  </div>



	<%--		  
			<!------------------ 댓글 양식(수정부분) ---------------->
			<div class="p-5 bg-white">
				<form>
  					<div class="form-row">
    					<div class="form-group col-md-6">
      						<label for="inputEmail4">Name</label>
      						<input type="email" class="form-control" id="inputEmail4" placeholder="이름">
    					</div>
    				    <div class="form-group col-md-6">
				            <label for="inputPassword4">Password</label>
      						<input type="password" class="form-control" id="inputPassword4" placeholder="비밀번호">
    					</div>
  				    </div>
  					<div class="form-group">
    					<label for="inputAddress">content</label>
    					<input type="text" class="form-control" id="inputAddress" placeholder="댓글을 작성해주세요">
  					</div>


					<button type="submit" class="btn btn-primary">댓글 수정</button>
  					<button type="submit" class="btn btn-primary">댓글 삭제</button>
				</form>
			</div>
			<!------------------ 댓글 양식 END ---------------->
 --%>



  
     <footer class="site-footer">
     	<%@ include file="/WEB-INF/views/common/footer.jspf"%>
     </footer>
  
  
  <!-- javascript link -->
  <%@ include file="/WEB-INF/views/common/jsLink.jspf"%>
  
  
  
  <!-- 게시글 삭제 로직  --> 
  <script src="<c:url value='/post/deletePostBtn.js'/>"></script>
    
  <script src="<c:url value='/post/deleteComment.js'/>"></script>
  
  <script src="<c:url value='/post/postValidation.js'/>"></script>
  
    
  </body>
</html>