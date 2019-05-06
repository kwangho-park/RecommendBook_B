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
	<%@ include file="/WEB-INF/views/common/link.jspf"%>

    
  </head>
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

	<!-- 배경//////변경예쩡 -->
    <div class="unit-5 overlay" style="background-image: url('/RecommendBook_B/images/hero_bg_2.jpg');">
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
    		 <div class="row form-inline">
			  	<div class="form-group">
	               	<form name="deletePost" action="/RecommendBook_B/post/deletePost" onsubmit="return deleteBtn()" method="post">
    	            
        	          <!-- [추후] 변경예정 -->
				      <!-- [hidden] 게시글 삭제를 위한 DB table의 num값을 보관 -->
                	  <input type="hidden" name="num" value="${requestScope.dto.num}">
                  
                	  <input type="submit" value="게시글 삭제" id="deletePostBtn"  class="btn btn-primary  py-2 px-5"> &nbsp;&nbsp;  
               		</form>				   	
					
					<input type="button" value="게시글 수정" id="modifyPostBtn" onclick="location.href='/RecommendBook_B/post/modifyPost?num=${requestScope.dto.num}'" class="btn btn-primary  py-2 px-5">

			  	</div>
			 </div>


            <!-------------- 게시글 양식 END--------------->
          
          </div>

        </div>
      </div>
    </div>
  </div>



           <!------------------ 댓글 양식 ---------------->
<!--           
<div class="panel panel-default">
  <div class="panel-heading">Panel heading without title</div>
  <div class="panel-body">
    Panel content
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div>           
 -->

<!------------------ 댓글 양식 END ---------------->


  
     <footer class="site-footer">
     	<%@ include file="/WEB-INF/views/common/footer.jspf"%>
     </footer>
  
  
  <!-- javascript link -->
  <%@ include file="/WEB-INF/views/common/jsLink.jspf"%>
  
  
  
  <!-- 게시글 삭제 로직  --> 
  <script src="<c:url value='/post/deleteBtn.js'/>"></script>
    
  <script src="<c:url value='/post/postValidation.js'/>"></script>
  
    
  </body>
</html>