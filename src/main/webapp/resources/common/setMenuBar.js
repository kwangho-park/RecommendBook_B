

// menu bar + 모든 page의 button setting //


// DOM 객체 로딩 후 실행되는 jQuery method
$(function(){
		
	////////////////////// client 제어 ///////////////////////
	// client측 cookie 셋팅 (path : '/')
	function setCookie(name, value, day){
        var date = new Date();
        date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';		
	}

	// client측 cookie 삭제 (path : '/')
    	var deleteCookie = function(name) {
        var date = new Date();
        document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=/";
    }

	
	////////////////////// server 제어 ///////////////////////
	// cookie 얻기 (path = ?)
  	function getCookie(name){
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    }
    
	
	// client or server측 cookie 삭제		(client : "/", server : "/context/.."
	function clearCookie(name, domain, path){
        var domain = domain || document.domain;
        var path = path || "/";
        document.cookie = name + "=; expires=" + +new Date + "; domain=" + domain + "; path=" + path;

	}
	    
    
    var loginFlag = getCookie("loginFlag");

    
    if(loginFlag == null){	// logout 상태 
    	
    	// [추후 업데이트 예정]
    	// $(".menuBar > #login").attr("href","/bootstrap/login").text	("Login");
    	
    	$(".menuBar #loginHref").attr("href","/RecommendBook_B/login")
    	$(".menuBar #loginText").text("Login");
    	
    
    	
    	// 게시글작성/수정 버튼 비활성
    	$(".menuBar > #newPost").bind('click', false);
    	
    	$("#modifyPostBtn").attr('disabled',true);
    	$("#deletePostBtn").attr('disabled',true);
    	
    	
    	// 댓글 작성/수정/삭제 버튼 비활성
    	$(".form-group #newCommentBtn").attr('disabled',true);
    	$(".form-group #modifyCommentBtn").attr('disabled',true);
    	$(".form-group #CommentCommentBtn").attr('disabled',true);

    
    	

    }else if(loginFlag != null){				// login 상태

    	// [추후 업데이트 예정]
    	// $(".menuBar > #login").attr("href","/bootstrap/logout").text("Logout");
    	
    	$(".menuBar #loginHref").attr("href","/RecommendBook_B/logout")
    	$(".menuBar #loginText").text("Logout");
    	
    	
    	
    	// 게시글작성/수정 버튼 활성
    	$(".menuBar > #newPost").unbind('click', false);
    	
    	$("#modifyPostBtn").attr('disabled',false);
    	$("#deletePostBtn").attr('disabled',false);
    	
    	
    	// 댓글 작성/수정/삭제 버튼 활성
    	$(".form-group #newCommentBtn").attr('disabled',false);
    	$(".form-group #modifyCommentBtn").attr('disabled',false);
    	$(".form-group #CommentCommentBtn").attr('disabled',false);

    }

    // test point
    //console.log("loginFlag 조건값 : "+ loginFlag);

    
}); // function() END
	  