<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="modify comment" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- [bootstrap] link -->
	<%@ include file="/WEB-INF/views/common/link.jspf"%>

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



    <!-- 배경//////변경예쩡 -->
    <div class="unit-5 overlay" style="background-image: url('/RecommendBook_B/images/hero_bg_2.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">Comment</h2>
      </div>
    </div>

    <!-- comment -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">    
													  
    	  <form name = "comment" method = "post" action="<c:url value = '/comment/save'/>" onsubmit= "return commentValidation()">
    		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="id"> 이 름 </label>
    	         <input type="text" name="userName"id="userName" class="form-control" value="${requestScope.comment.userName}">
           		</div>
    		 </div>
    		 
     		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="pw"> 비 밀 번 호 </label>
    	         <input type="text" name="pw"id="pw" class="form-control" value="${requestScope.comment.pw }">
           		</div>
    		 </div>
    		 
     		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="pw"> 내 용 </label>
    	         <input type="text" name="content"id="content" class="form-control" value="${requestScope.comment.content }">
           		</div>
    		 </div>    		 
    		 
    		 <!-- [추후] 변경예정 -->
		     <!-- [hidden] 게시글/댓글 num값을 보관 -->
       	  	 <input type="hidden" name="commentNum" value="${requestScope.comment.commentNum}">
       	  	 <input type="hidden" name="postNum" value="${requestScope.comment.postNum}">
       	  	 
    		 
    		 <!-- 댓글 수정 버튼 -->
    		 <div class="row form-inline">
			  	<div class="form-group">
				   	<input type="submit" value="댓글 수정완료" class="btn bg-warning text-white  py-2 px-4">
			  	</div>
			 </div>
    	  </form>
    	  
    	  
    		 
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