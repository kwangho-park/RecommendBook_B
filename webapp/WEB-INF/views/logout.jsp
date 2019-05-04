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
    <div class="unit-5 overlay" style="background-image: url('images/hero_bg_2.jpg');">
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

					<input type="button" onclick="logoutBtn()" value="로그아웃"  class="btn btn-primary  py-2 px-4"><br>
						
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