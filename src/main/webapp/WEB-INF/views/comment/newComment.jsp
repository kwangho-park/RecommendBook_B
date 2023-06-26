<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="new comment" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- [bootstrap] link -->
	<%@ include file="/WEB-INF/views/common/cssLink.jspf"%>

</head>
  
  
 

  
<body>
  
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
        <h2 class="mb-0">New Comment</h2>
      </div>
    </div>
    



    <!-- comment -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8 mb-5">    
					
		  <div class="p-5 bg-white">								  
    	  <form name = "comment" method = "post" action="<c:url value = '/comment/newSave'/>" onsubmit= "return commentValidation()">
    		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="id"> 이 름 </label>
    	         <input type="text" name="userName" id="userName" class="form-control">
           		</div>
    		 </div>
    		 
     		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="pw"> 비 밀 번 호 </label>
    	         <input type="text" name="pw" id="pw" class="form-control">
           		</div>
    		 </div>
    		 
     		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="pw"> 내 용 </label>
    	         <input type="text" name="content"id="content" class="form-control">
           		</div>
    		 </div>    		 
    		 
    		 <!-- [추후] 변경예정 -->
		     <!-- [hidden] 게시글 num값을 보관 -->
       	  	 <input type="hidden" name="postNum" value="${requestScope.postNum}">
       	  	 
    		 
    		 <!-- 댓글 수정 버튼 -->
    		 <div class="row form-inline">
			  	<div class="form-group">
				   	<input type="submit" value="댓글 작성완료" class="btn bg-warning text-white  py-2 px-4">
			  	</div>
			 </div>
    	  </form>
    	  </div>
    	  
    	  
    		 
    	  </div>
    	  
        </div>
      </div>
    </div>

    
  <footer class="site-footer">
    <%@ include file="/WEB-INF/views/common/footer.jspf"%>
  </footer>


 
  <!-- [bootstrap] javascript link -->
  <%@ include file="/WEB-INF/views/common/jsLink.jspf"%>
  
  <script src="/RecommendBook_B/comment/commentValidation.js"></script>

  

</body>
</html>