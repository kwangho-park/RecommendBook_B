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
import dto.CommentInfoDto;


// 특정 게시글(num) 조회 시 comment를 조회//
@Aspect
public class Post2Aspect {

	@Autowired
	CommentInfoDto commentInfoDto;
	
	@Autowired
	CommentInfoDao commentInfoDao;
	
	@Pointcut("execution (public * controller.PostController.viewPost(..))")
	private void publicTarget() {}
	
	@Around("publicTarget()")
	public Object comment(ProceedingJoinPoint joinPoint) throws Throwable{
		
		
		// [장기적 고민] AOP 에서 request객체를 사용하기 위한 설정
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

		try {
			
			return joinPoint.proceed();
			
		}finally {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			List<CommentInfoDto> commentList = commentInfoDao.allSelect(num);
			
			request.setAttribute("commentList",commentList);
		}
		
	}// comment() END

	
}// CommentAspect END
