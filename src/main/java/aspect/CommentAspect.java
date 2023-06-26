package aspect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import dao.CommentInfoDao;
import dao.PostInfoDao;
import dto.CommentInfoDto;
import dto.PostInfoDto;

@Aspect
public class CommentAspect {

	@Autowired
	CommentInfoDao commentInfoDao;
	
	@Autowired
	PostInfoDto postInfoDto;
	
	@Autowired
	PostInfoDao postInfoDao;
	
	@Pointcut("execution (public * controller.CommentController.aspect*(..))")
	private void publicTarget() {}
	
	

	@Around("publicTarget()")
	public Object post(ProceedingJoinPoint joinPoint) throws Throwable{
		
		// [장기적 고민] AOP 에서 request객체를 사용하기 위한 설정
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();


		try {
			
			return joinPoint.proceed();
			
		}finally {

			int postNum = Integer.parseInt(request.getParameter("postNum"));
						
			// 특정 게시글 조회 // 
			postInfoDto = postInfoDao.selectPost(postNum);

			request.setAttribute("dto", postInfoDto);
			

			// 특정 게시글의 댓글 조회 // 
			List<CommentInfoDto> commentList = commentInfoDao.allSelect(postNum);
			
			request.setAttribute("commentList",commentList);

			
		}
		
	}// post() END

}// CommentAspect END
