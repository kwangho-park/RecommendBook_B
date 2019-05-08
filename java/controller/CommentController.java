package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CommentInfoDao;
import dto.CommentInfoDto;

@Controller
public class CommentController {
	
	@Autowired
	CommentInfoDao commentInfoDao;
	
	@Autowired
	CommentInfoDto commentInfoDto;
	
	// 특정 댓글 삭제 // 
	@RequestMapping(value="/comment/delete", method=RequestMethod.POST)
	public String aspectDelete(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("commentNum"));
		
		
		// 댓글 삭제 로직 (DAO)
		commentInfoDao.delete(num);
		
		
		
		// [Aspect] commentAspect : 게시글 조회, 댓글 조회
		

		return "/post/viewPost";
	}
	
	// 특정 댓글 수정 //
	@RequestMapping(value="/comment/modify", method=RequestMethod.GET)
	public String modify(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("commentNum"));
		
		// 댓글 조회
		commentInfoDto = commentInfoDao.select(num);

		request.setAttribute("comment",commentInfoDto);
		
		return "/comment/modifyComment";
	}
	
	
	// 특정 댓글 저장 // 
	@RequestMapping(value="/comment/save", method=RequestMethod.POST)
	public String aspectSave(CommentInfoDto commentInfoDto, HttpServletRequest request, HttpServletResponse response) {
		
		
		// 댓글 저장
		commentInfoDao.save(commentInfoDto);
		
		
		// [Aspect] commentAspect : 게시글 조회, 댓글 조회
		
		
		return "/post/viewPost";
	}
	
	
}// CommentController END
