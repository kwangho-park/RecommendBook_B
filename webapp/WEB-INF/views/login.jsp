<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- [bootstrap] link -->
	<%@ include file="/WEB-INF/views/common/link.jspf"%>

</head>
  
  
  
  
<%-- 로그인 필터링 결과를 경고창으로 출력 --%>
<c:choose>
	<c:when test="${requestScope.loginFilterFlag == true}">
		<script>alert("로그인 성공!")</script>
	</c:when>
	<c:when test="${requestScope.loginFilterFlag == false}">
		<script>alert("아이디 또는 비밀번호가 일치하지 않습니다!")</script>
	</c:when>
</c:choose>



  
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
        <h2 class="mb-0">Login</h2>
      </div>
    </div>

    <!-- login -->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
       
          <div class="col-md-12 col-lg-8 mb-5">    

    	  <form name = "loginClient" method = "post" action="<c:url value = '/login/filter'/>" onsubmit= "return login()">
    		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="id"> 아 이 디 </label>
    	         <input type="text" name="id"id="id" class="form-control">
           		</div>
    		 </div>
    		 
     		 <div class="row form-group">		
          		<div class="col-md-6">		
	             <label class="font-weight-bold" for="pw"> 비 밀 번 호 </label>
    	         <input type="password" name="pw"id="pw" class="form-control">
           		</div>
    		 </div>
    		 
    		 <!-- 일반/kakao 로그인 버튼 -->
    		 <div class="row form-inline">
			  	<div class="form-group">
				   	<input type="submit" value="로그인" class="btn btn-primary  py-2 px-4"> &nbsp;&nbsp;&nbsp;
				   	
				   	<a href='javascript:loginKakao()'>
					<img src="<c:url value='/images/login.png'/>" >
					</a>
						
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
  
  
    <!-- kakao open API link -->
  <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>

  <!-- web page loading 시 초기화 로직 -->
  <script src="<c:url value='/login/initLogin.js'/>"></script>
  
  <!-- 로그인 유효성 검사 로직  --> 
  <script src="<c:url value='/login/loginValidation.js'/>"></script>

  <!-- 카카오 로그인 로직 -->
  <script src="/RecommendBook_B/login/loginKakao.js"></script>


  

</body>
</html>