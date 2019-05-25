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
  
  
  
  
<body onload="initPost()">
  
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
        <h2 class="mb-0">New Post</h2>
      </div>
    </div>

    


    
	<!---------------- -section --------------------->
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8 mb-5">
          
            
            <!-------------- 게시글 양식 --------------->
            <form name="postClient" action="<c:url value='/post/savePost'/>" method="post" onsubmit="return postValidation()" class="p-5 bg-white">
              
              <!-- 도서명 -->
              <div class="form-group">
              	<div class="form-row">
                  <label class="font-weight-bold" for="bookName">도 서 명</label>
              	</div>
              	<div class="form-row">
                  <div class="col-md-6 mb-3 mb-md-0">
                    <input type="text" name="bookName" id="bookName" class="form-control">
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
                    <input type="text" name="writer" id="writer" class="form-control">
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
                    <input type="text" name="title" class="form-control" placeholder="제목을 작성해주세요">
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
                    <textarea name="content" class="form-control" id="" cols="30" rows="5" placeholder="내용을 작성해주세요"></textarea>
                  </div>
                </div>
              </div>
			  <br>


			 <!-- 도서 취향정보 -->
			 <div class="form-group">
			   <div class="form-row">
			     <label class="font-weight-bold" for="bookType">도 서 &nbsp;&nbsp;정 보</label>
			   </div>
			   
			   <!-- 분류 -->
			   <div class="form-row">
			     <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="select-wrap">
                          <span class="icon-keyboard_arrow_down arrow-down"></span>
                          <select name="bookType" id="bookType" class="form-control">
                            <option value="">분류</option>
                            <option value="소설">소설</option>
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
			   </div>
			 
			   <br>
               <p>* 도서별로 지정된 값을 선택해주세요</p>
               
			 </div>
			 
			 
			 
            <!-- 추천 점수 -->
            <div class="form-group">
              <div class="form-row">
                <label class="font-weight-bold" for="score">추 천 &nbsp;&nbsp;점 수</label>
              </div>
              <div class="form-row">
                <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
				 	<input type="number" name="score" id="score" class="form-control" min="1" max="10" value="1">
                </div>
              </div>  
            </div>
            

            <!-- 게시글 작성 버튼 -->
            
            <div class="row">
              <div class="col-md-12" style="text-align:center">
                <input type="submit" value="게시글 작성" class="btn bg-warning text-white  py-2 px-5">
              </div>
            </div>
            
             
            </form>
            <!-------------- 게시글 양식 END--------------->
            
          </div>
         
          </div>
        </div>
      </div>
    </div>

         
     <footer class="site-footer">
     	<%@ include file="/WEB-INF/views/common/footer.jspf"%>
     </footer>


     <!-- javascript link -->
     <%@ include file="/WEB-INF/views/common/jsLink.jspf"%>
  
  
    <!-- web page loading 시 초기화 로직 -->
    <script src="<c:url value='/post/initPost.js'/>"></script>
     
     
    <!-- 게시글 정보 필터링-->
    <script src="<c:url value='/post/postValidation.js'/>"></script>

  
  
  
    
  </body>
</html>