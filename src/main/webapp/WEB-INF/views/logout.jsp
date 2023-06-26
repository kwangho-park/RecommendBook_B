<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- [bootstrap] link -->
	<%@ include file="/WEB-INF/views/common/cssLink.jspf"%>

</head>
  
  
  
<body>
  
	<!-- .site-mobile-menu (우측 슬라이드)-->
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
        <h2 class="mb-0">Logout</h2>
      </div>
    </div>


    <!-- logout -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
       
    		 
    		 <!-- 로그아웃 버튼 -->
    		 <div class="form-inline">
			  	<div class="form-group">

					<input type="button" onclick="logoutBtn()" value="로그아웃"  class="btn bg-warning text-white  py-2 px-4"><br>
						
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
  
 
  <!-- 로그아웃 버튼 로직 -->
  <script src="<c:url value='/logout/logoutBtn.js'/>"></script>
  

</body>
</html>