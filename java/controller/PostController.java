package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.PostInfoDao;
import dao.RecommendInfoDao;
import dto.PostInfoDto;
import dto.RecommendInfoDto;
import service.AverageScoreCal;

@Controller
public class PostController {

	// DTO
	@Autowired
	PostInfoDto postInfoDto;
	
	@Autowired
	RecommendInfoDto recommendInfoDto;
	
	@Autowired
	RecommendInfoDto recommendInfoDto_before;
	
	
	// DAO
	@Autowired
	PostInfoDao postInfoDao;
	
	@Autowired
	RecommendInfoDao recommendInfoDao;
	
	@Autowired
	AverageScoreCal averageScoreCal;
	
	
	 
	// 게시글 저장 요청 //
	@RequestMapping(value="/post/savePost", method=RequestMethod.POST)
	public String savePost(PostInfoDto command, HttpServletRequest request, HttpServletResponse response) {

		
		// 도서 추천 정보를 조회 // 
		recommendInfoDto = recommendInfoDao.select(command.getBookName());
		
		
		// 추천정보 업데이트 or 삽입 // 
		if(recommendInfoDto != null) {
			
			// service logic
			averageScoreCal.addition(command.getScore(), recommendInfoDto);
			
			// DAO
			recommendInfoDao.update(recommendInfoDto);
			
			
		}else {
			recommendInfoDao.insert(command);
		}
		
		// 게시글 정보를 저장 //
		postInfoDao.insertPost(command);
		
		
		// 경고창 출력을 위한 setting
		request.setAttribute("saveSuccess", true);
		
		
		
		// [aspect] postAspect 실행 // 

		
		return "/home";
		
	} // savePost() END
	
	
	

	// 수정된 게시글 저장 요청 // 
	@RequestMapping(value="/post/modifySavePost", method=RequestMethod.POST)
	public String modifySavePost(PostInfoDto command, HttpServletRequest request, HttpServletResponse response) {
		
		
		// 게시글 수정 전 data setting // 
		
		postInfoDto = postInfoDao.selectPost(command.getPostNum());

		String bookName_before = postInfoDto.getBookName();
		int score_before = postInfoDto.getScore();
		
		
		// 도서정보 조회 // 
		recommendInfoDto = recommendInfoDao.select(command.getBookName());
		recommendInfoDto_before = recommendInfoDao.select(bookName_before);
		
		
		// 도서명 변경 시
		if(!command.getBookName().equals(bookName_before)) {
		
			// 도서 추천정보Table에 변경된 도서명이 존재 할 경우
			if(recommendInfoDto != null) {
				
				// [service] 새로운 도서 추천정보의 평균점수 연산
				averageScoreCal.addition(command.getScore(), recommendInfoDto);
			
				
				// [dao] 도서 추천정보 업데이트
				recommendInfoDao.update(recommendInfoDto);
				
				
				
			// 도서 추천정보Table에 변경된 도서명이 존재 하지 않을 경우
			}else {
				recommendInfoDao.insert(command);
			}			
			
			
			// 변경전 도서 추천정보table 업데이트
			// 인자로전달한 dto에 직접 접근하여 setting
			averageScoreCal.subtraction(score_before, recommendInfoDto_before);
			
			recommendInfoDao.update(recommendInfoDto_before);					
			
			
			
			
		// 도서명 동일 + 추천점수 변경 시 
		}else if((command.getBookName().equals(bookName_before)) &&(command.getScore() != score_before)) {

			// [service] 평균값 업데이트
			averageScoreCal.modify(command.getScore(), score_before, recommendInfoDto);
			
			// [dao] 도서 추천정보 업데이트
			recommendInfoDao.update(recommendInfoDto);
		}
		
		
		// 게시글 수정 //
		postInfoDao.updatePost(command);
		
		request.setAttribute("modifySuccess", true);
		
		
		
		// [aspect] postAspect 실행 //
		

		return "/home"; 
		
	}// modifySavePost() END

	
	
	
	
	
	// 특정(num) 게시글을 삭제 요청 // 
	// 게시글 삭제 + 추천정보 업데이트
	@RequestMapping(value="/post/deletePost", method=RequestMethod.POST)
	public String deletePost(PostInfoDto command, HttpServletRequest request, HttpServletResponse response) {
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		
		// 삭제 대상 post정보를 조회 // 
		postInfoDto = postInfoDao.selectPost(postNum);
		
		String bookName = postInfoDto.getBookName();
		int score		= postInfoDto.getScore();
		
		
		
		// 추천정보 업데이트 대상 조회 // 
		recommendInfoDto = recommendInfoDao.select(bookName);
		
		
		// 추천점수 업데이트 // 
		// 인자로전달한 dto에 직접 접근하여 setting
		averageScoreCal.subtraction(score, recommendInfoDto);
		
		recommendInfoDao.update(recommendInfoDto);
		
		
		// post 삭제 //
		postInfoDao.deletePost(postNum);
		
		
		
		request.setAttribute("deleteSuccess", true );	// 경고창 출력용 setting
		
		
		// 해당 post에 연결된 댓글 삭제 //
		
		
		// [aspect] postAspect : 현재 page의 post list 출력 //
		
		
		return "/home";

	} // deletePost() END
	
	
	

	
	// 특정(num) 게시글 조회페이지 요청 //
	@RequestMapping(value="/post/viewPost", method=RequestMethod.GET)
	public String viewPost(HttpServletRequest request, HttpServletResponse response) {
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
	
		postInfoDto = postInfoDao.selectPost(postNum);
		
		// request에 게시글을 정보를 저장하고있는 DTO 셋팅
		request.setAttribute("dto", postInfoDto);
				

		///////// [aspect] Post2Aspect 실행 : 댓글 조회 실행예정 //
		
		
		return "/post/viewPost";
	} // viewPost() END


	
	
	// 특정(num) 게시글 수정페이지 요청 //
	@RequestMapping(value="/post/modifyPost", method=RequestMethod.GET)
	public String modifyPost(HttpServletRequest request, HttpServletResponse response) {
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		postInfoDto = postInfoDao.selectPost(postNum);
		
		// request에 게시글을 정보를 저장하고있는 DTO 셋팅
		request.setAttribute("dto", postInfoDto);
				
				
		
		return "/post/modifyPost";
		
	} // viewPost() END

	

	
	
} // PostController END
