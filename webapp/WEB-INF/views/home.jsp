<!-- home + search page -->


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
  
  

<%-- 로그인 필터링 결과를 경고창으로 출력 --%>
<c:choose>
	<c:when test="${requestScope.loginFilterFlag == true}">
		<script>alert("로그인 성공!")</script>
	</c:when>
	<c:when test="${requestScope.loginFilterFlag == false}">
		<script>alert("아이디 또는 비밀번호가 일치하지 않습니다!")</script>
	</c:when>
</c:choose>

<%-- 특정 게시글의 저장 결과를 출력 --%>
<c:if test="${requestScope.saveSuccess == true }">
	<script>alert("게시글이 등록되었습니다!")</script>
</c:if>

<%-- 특정 게시글의 삭제 결과를 출력--%>
<c:if test="${requestScope.deleteSuccess == true }">
	<script>alert("게시글이 삭제되었습니다!")</script>
</c:if>

<%-- 특정 게시글의 수정 결과를 출력--%>
<c:if test="${requestScope.modifySuccess == true }">
	<script>alert("게시글이 수정되었습니다! ")</script>
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
     



    <!-- 배경이미지 변경예정 /////// -->
    <!-- 적용되지 않는 이미지가 있음....(무료 다운한 것, 카카오로그인버튼 이미지는 가능) -->
	<div class="site-blocks-cover" style="background-image: url(/RecommendBook_B/images/book2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">

      <div class="container">
        <div class="row row-custom align-items-center">
          <div class="col-md-10">
            <h1 class="mb-2 text-white w-70"><span class="font-weight-bold">Recommend a book</span></h1>
            <h1>for you</h1>
            
            <!----- search bar ------>
            <div class="job-search">
              <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
              
                <li class="nav-item">
                  <a class="nav-link active py-3" id="pills-job-tab" data-toggle="pill" href="#pills-job" role="tab" aria-controls="pills-job" aria-selected="true">Search A Book</a>
                </li>
 
              </ul>
              
              <div class="tab-content bg-white p-4 rounded" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-job" role="tabpanel" aria-labelledby="pills-job-tab">
                
                  <!-- 도서 검색 정보 -->              
                  <form name="searchBook" action="<c:url value='/home/searchBook'/>" method="post">
                    <div class="row">

 					  <!-- 분류 -->
                      <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="select-wrap">
                          <span class="icon-keyboard_arrow_down arrow-down"></span>
                          <select name="bookType" id="" class="form-control">
                            <option value="">분류</option>
                            <option value="소설">소설</option>
                            
						<!-- 
		 					<option value = "에세이/시"> 에세이/시 </option>
	    					<option value = "인문학"> 인문학 </option>
	   	  					<option value = "경제경영"> 경제경영 </option>
	      					<option value = "자기계발"> 자기계발 </option>
	      					<option value = "자격증"> 자격증 </option>
	      					<option value = "대학/전공서적"> 대학/전공서적 </option>
	      					<option value = "취미/레저/여행/뷰티"> 취미/레저/여행/뷰티 </option>
	      					<option value = "아동/청소년"> 아동/청소년 </option>
	      					<option value = "만화"> 만화 </option>            
	    					<option value = "기타"> 기타 </option>
	    		 		-->
	    		 		
                          </select>
                        </div>
                      </div>
 
 
 					  <!--취향 -->
                      <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="select-wrap">
                          <span class="icon-keyboard_arrow_down arrow-down"></span>
                          <select name="favorite" id="" class="form-control">
                            <option value="">취향</option>
                            <option value="달달한 로맨스">달달한 로맨스</option>
                            <option value="유쾌한 코미디">유쾌한 코미디</option>
                            <option value="짜릿한 무협/액션">짜릿한 무협/액션</option>
                            <option value="뇌섹남의 공포/추리">뇌섹남의 공포/추리</option>
                            <option value="화려한 판타지/SF">화려한 판타지/SF</option>
                          </select>
                        </div>
                      </div>
                      
                      
                      <!-- 난이도 -->
					  <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="select-wrap">
                          <span class="icon-keyboard_arrow_down arrow-down"></span>
                          <select name="bookLevel" id="" class="form-control">
                            <option value="">난이도</option>
                            <option value="상">상</option>
                            <option value="중">중</option>
                            <option value="하">하</option>
                          </select>
                        </div>
                      </div>
                      
                   
                      <!-- [추후] 변경예정 -->
					  <!-- [hidden] 게시글 출력을 위한 pageNum값 보관 -->
					  <input type="hidden" name="num" value="${requestScope.pageNum}">
 	
 
                      <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                        <input type="submit" class="btn btn-primary btn-block" value="도서 검색">
                      </div>
    
                      
                    </div>
                  </form>
                  
                  
                  
                </div>       
              </div>
            </div>
            <!----- search bar END ------>
            
            
          </div>
        </div>
      </div>
    </div>  
    

	<!--------------------추천도서 검색 결과 리스트 ------------------------>
	<!-- ///////////////// 리스트 타입 변경예정 -->
	<!-- 검색결과에 순위 표기 (max 5개)-->
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-6" data-aos="fade" >
            <h2 class="text-black"> Recommend Book List </h2>
          </div>
        </div>
        
        <!-- 결과 리스트 -->
        <div class="row hosting">
        
        <c:if test="${searchList != null}">
          <c:forEach var="list" items="${searchList}"  begin="0" end="5" step="1" varStatus="status">
          
          <div class="col-md-6 col-lg-4 mb-5 mb-lg-4" data-aos="fade" data-aos-delay="100">
            <div class="unit-3 h-100 bg-white">
              <div class="d-flex align-items-center mb-3 unit-3-heading">
                <h2 class="h5">${status.index + 1 }. ${list.bookName }</h2>
              </div>
              
              <div class="unit-3-body">
                <p>  작가 : ${list.writer }  </p>
                <p>  평균 추천점수 : ${list.averageScore }  </p>
              </div>
            </div>
          </div>
          </c:forEach>
     	</c:if>
     
                    
        </div>
      </div>
    </div>
	
	
	
	
	
    <!------------ 게시글 리스트 ------------------->
    <div class="site-section bg-light">
      <div class="container">
      
        <div class="row justify-content-start text-left mb-5">
          <div class="col-md-9" data-aos="fade">
            <h2 class="font-weight-bold text-black">Recent post</h2>
          </div>
        </div>


		<!-- 게시글 frame -->
		<c:forEach var="dto" items="${requestScope.postList}">
		
        <div class="row" data-aos="fade">
         <div class="col-md-12">

           <div class="job-post-item bg-white p-4 d-block d-md-flex align-items-center">
           
     		  <!-- 게시글 제목, 난이도 -->
		 	   <div class="mb-4 mb-md-0 mr-5">
                 <div class="job-post-item-header d-flex align-items-center">
                   <h2 class="mr-3 text-black h4">${dto.title}</h2>
                   <div class="badge-wrap">
                   
				<c:choose>
					<c:when test="${dto.bookLevel == '상'}">
						<span class="bg-danger text-white badge py-2 px-4">난이도 : ${dto.bookLevel }</span>
					</c:when>
					<c:when test="${dto.bookLevel == '중'}">
						<span class="bg-info text-white badge py-2 px-4">난이도 : ${dto.bookLevel }</span>
					</c:when>
					<c:when test="${dto.bookLevel == '하'}">
						<span class="bg-warning text-white badge py-2 px-4">난이도 : ${dto.bookLevel }</span>
					</c:when>
				</c:choose>
                   
                   </div>
               </div>

               

               <!-- 도서명, 작가명 -->
               <div class="job-post-item-body d-block d-md-flex"> 
                 <div class="mr-3"><span class="icon-book"></span>${dto.bookName }</div>
                 <div><span class="icon-pencil"></span>${dto.writer}</div>
               </div>
              </div>

			  <!-- 게시글 보기 -->
              <div class="ml-auto">
                <a href="/RecommendBook_B/post/viewPost?num=${dto.num }" class="btn btn-primary py-2">게시글 보기</a>
              </div>
           </div>

         </div>
        </div>
        </c:forEach>


		<!--------- pagging ----------->
        <div class="row mt-5">
          <div class="col-md-12 text-center">
            <div class="site-block-27">
              <ul>
                <li><a href="<c:url value='/home?pageNum=${requestScope.countPage[4] }'/>"><i class="icon-keyboard_arrow_left h5"></i></a></li>
                <li><a href="<c:url value='/home?pageNum=${requestScope.countPage[2] }'/>"><i class="icon-keyboard_arrow_left h5"></i></a></li>

				<c:forEach var="pageNumber" begin="${requestScope.countPage[0] }" end="${requestScope.countPage[1] }">

                	<li class="active"><a href="<c:url value='/home?pageNum=${pageNumber}'/>"> ${pageNumber } </a></li>
                
				</c:forEach>
           
                <li><a href="<c:url value='/home?pageNum=${requestScope.countPage[3] }'/>" ><i class="icon-keyboard_arrow_right h5"></i></a></li>
                <li><a href="<c:url value='/home?pageNum=${requestScope.countPage[5] }'/>" ><i class="icon-keyboard_arrow_right h5"></i></a></li>
              </ul>
            </div>
          </div>
        </div>


      </div>
    </div>    
	<!------------ 게시글 리스트  END------------------->

    
    
    
    
    
        <!-- 기타 정보 -->
        <!-- 추후 사용 -->
        <!-- 
        <div class="row">
          <div class="col-lg-3">
			
            <h3 class="footer-heading mb-4">Contact Info</h3>
            <ul class="list-unstyled">
              <li>
                <span class="d-block text-white">blog</span>
                solt.tistory.com
              </li>
              <li>
                <span class="d-block text-white">Email</span>
                kwangho410@naver.com
              </li>
            </ul>

          </div>
        </div>
         -->
         
         
     <footer class="site-footer">
     	<%@ include file="/WEB-INF/views/common/footer.jspf"%>
     </footer>
    
    
    
    
  </div>

  <!-- javascript link -->
  <%@ include file="/WEB-INF/views/common/jsLink.jspf"%>



  
  <script>
      // This example displays an address form, using the autocomplete feature
      // of the Google Places API to help users fill in the information.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

      // Bias the autocomplete object to the user's geographical location,
      // as supplied by the browser's 'navigator.geolocation' object.
      function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
    
    
    
</body>
</html>