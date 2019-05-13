<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--  추후 업데이트 : 이메일 인증 -->

<!DOCTYPE html>

<html>
<head>
    <title>Recommend Book &mdash; for you</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
	<!-- bootstrap link -->
	<%@ include file="/WEB-INF/views/common/link.jspf"%>

    
</head>


<%-- 회원가입 필터링 결과를 경고창으로 출력 --%>
<c:choose>
	<c:when test="${requestScope.signUpFilterResult == true}">
		<script>alert("회원가입 성공!")</script>
	</c:when>
	<c:when test="${requestScope.signUpFilterResult == false}">
		<script>alert("중복된 아이디가 존재합니다")</script>
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
    
    
    
	<!-- 배경///////// 변경예정 -->
	<!-- unit-5 class CSS -->
    <div class="unit-5 overlay" style="background-image: url('images/hero_bg_2.jpg');">
      <div class="container text-center">
        <h2 class="mb-0">Sign up</h2>
      </div>
    </div>

    
	<!---------------- -section --------------------->
    <div class="site-section bg-light">			
      <div class="container">
        <div class="row">						<!-- row 제어-->
          <div class="col-md-12 col-lg-8 mb-5"> <!-- column 제어 -->
            
          	<!-- 회원가입 양식 -->
            <form name="signUpClient" method="post" action="<c:url value='/signUp/filter'/>" onsubmit="return signUpValidation()" class="p-5 bg-white">
            
               <!-- 아이디 -->
               <div class="form-group">   <!-- from-group : margin-bottom -->
               
                 <div class="form-row">
                   <label class="font-weight-bold" for="id">아 이 디</label>
               	 </div>
                 <div class="form-row">
                   <div class="col-md-6">                  
                     <input type="text" name="id" id="id" class="form-control">
                   </div>
                </div>
                
              </div>
              



              <!-- 비밀번호 -->
              <div class="form-group">
              
                <div class="form-row">
                  <label class="font-weight-bold" for="pw">비 밀 번 호</label>
                </div>
                <div class="form-row">
                  <div class="col-md-6">                
                    <input type="password" name="pw" id="pw" class="form-control" >
                  </div>
                </div>
                
              </div>
			  
              
             
              <!-- 이름 -->
              <div class="form-group">
              
                <div class="form-row">
                  <label class="font-weight-bold" for="name">이 름</label>
                </div>
                <div class="form-row">
                  <div class="col-md-6">			
                    <input type="text" name="name" id="name" class="form-control">
                  </div>
                </div>
                
              </div>
              

              
              <!-- 생년월일 -->
              <div class="form-group">
              
                <div class="form-row">
                    <label class="font-weight-bold" for="birthday"> 생 년 월 일 </label>
                </div>

                <div class="form-row">
                  <div class="col-md-6">		
    	            <input type="date" name="birthday" id="birthday" class="form-control">
              	  </div>
                </div>
                
              </div>

              
               <!-- 이메일 -->
			  <div class="form-group">
			  	
			    <div class="form-row">
			      <label class="font-weight-bold" for="email01">이 메 일</label>
			    </div>
			    
			    <div class="form-row">
			  	   <div class="col-md-3">	
 	                 <input type="text" name="email01" id="email01" class="form-control">
 	               </div>
 	               
					  @ <!-- 이미지로 변경해야할 듯??-->
					  
 	               <div class="col-md-3">
 	                 <input type="text" name="email02" id="email02" class="form-control">
 	               </div>
 				 
 						
 				   <div class="col-md-4">	
					<select name="selectEmail" id="selectEmail" class="form-control">
						<option value="1" selected>직접입력</option> <option value="naver.com">naver.com</option> 
						<option value="hanmail.net">hanmail.net</option> <option value="hotmail.com">hotmail.com</option> 
						<option value="nate.com">nate.com</option> <option value="yahoo.co.kr">yahoo.co.kr</option> 
						<option value="empas.com">empas.com</option> <option value="dreamwiz.com">dreamwiz.com</option> 
						<option value="freechal.com">freechal.com</option> <option value="lycos.co.kr">lycos.co.kr</option> 
						<option value="korea.com">korea.com</option> <option value="gmail.com">gmail.com</option> 
						<option value="hanmir.com">hanmir.com</option> <option value="paran.com">paran.com</option> 
					</select>
 	               </div>
 	               
 	               
 	              </div>
 	            </div>
 
        
        
               <!-- 주소 -->
			  <div class="form-group">
			  
			    <div class="form-row">
			      <label class="font-weight-bold" for="postCode">주 소</label>
			    </div>
			   
			    
			    <div class="form-row form-group">
			      <div class="col-md-4">
			        <input type="text" name="postCode" id="postCode" class="form-control" placeholder="우편번호">
			      </div>
			      <div class="col-md-4">
			        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"  class="btn bg-warning text-white  py-2 px-4">
			      </div>
			    </div>
				      

			    <div class="form-row form-group">
			      <div class="col-md-4">
			        <input type="text" name="roadAddress" id="roadAddress" class="form-control" placeholder="도로명주소">
			      </div>
			      <div class="col-md-4">
			        <input type="text" name="jibunAddress" id="jibunAddress"  class="form-control" placeholder="지번주소">
			      </div>
			      <div class="col-md-4">
			        <input type="text" name="extraAddress" id="extraAddress"  class="form-control" placeholder="참고항목">
			      </div>			      
			    </div>
			    

			    <div class="form-row form-group">
			      <div class="col-md-12">
			        <input type="text" name="detailAddress" id="detailAddress"  class="form-control" placeholder="상세주소">
			      </div>
			    </div>
			    
              </div>
              
              
  			<br>
			<!-- 회원가입 버튼 -->
              <div class="row">
                <div class="col-md-12" style="text-align:center">
                  <input type="submit" value="회원가입" class="btn bg-warning text-white  py-2 px-4">
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

    
    
	<!-- javascript link -->
  	<%@ include file="/WEB-INF/views/common/jsLink.jspf"%>
  	
  	<!-- daum post service (open API)-->
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  	
  	
  	
  	<!-- web page loading 시 초기화 로직 -->
    <script src="<c:url value='/signUp/initSignUp.js'/>"> </script>
  	
    <!-- 입력한 회원가입 정보의 유효성 검사 -->
    <script src="<c:url value='/signUp/signUpValidation.js'/>"> </script>
   

    <!--  다음 주소검색 로직 -->
    <script src="<c:url value='/signUp/postCode.js'/>"> </script>
  
    <!-- event email -->
    <script src="<c:url value='/signUp/email.js'/>"> </script>  	
  
  
    
</body>
</html>