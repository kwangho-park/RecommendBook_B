package springConfig;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import aspect.CommentAspect;
import aspect.HomeAspect;
import aspect.LoginAspect;
import aspect.Post2Aspect;
import aspect.PostAspect;
import controller.CommentController;
import controller.HomeController;
import controller.LoginController;
import controller.LogoutController;
import controller.PostController;
import controller.SignUpController;
import dao.CommentInfoDao;
import dao.PostInfoDao;
import dao.RecommendInfoDao;
import dao.SearchBookDao;
import dao.UserInfoDao;
import dto.CommentInfoDto;
import dto.PostInfoDto;
import dto.RecommendInfoDto;
import dto.SearchBookDto;
import dto.SearchStateDto;
import dto.UserInfoDto;
import service.AverageScoreCal;
import service.LoginFilter;
import service.PostPaging;

// Bean 설정(생성) 파일 //

@Configuration
@EnableAspectJAutoProxy			// proxy 객체 생성
public class BeanConfig {

	// aspect //

	@Bean
	public HomeAspect homeAspect() {
		return new HomeAspect();
	}

	@Bean
	public LoginAspect loginAspect() {
		return new LoginAspect();
	}
	
	
	@Bean
	public PostAspect postAspect() {
		return new PostAspect();
	}

	@Bean
	public Post2Aspect post2Aspect() {
		return new Post2Aspect();
	}
	
	@Bean 
	public CommentAspect commentAspect() {
		return new CommentAspect();
	}
	// controller //
	
	@Bean
	public HomeController homeController() {
		return new HomeController();
	}
	
	@Bean
	public LoginController loginController() {
		return new LoginController();
	}
	
	@Bean
	public LogoutController logoutController() {
		return new LogoutController();
	}
	
	@Bean
	public SignUpController signUpController() {
		return new SignUpController();
	}
	
	@Bean
	public PostController postController() {
		return new PostController();
	}
	

	@Bean
	public CommentController commentController() {
		return new CommentController();
	}
	
	
	
	// dao //
	@Bean(destroyMethod="close")
	public DataSource dataSource() {

		DataSource ds = new DataSource();

		
		// localhost 
		ds.setUrl("jdbc:mysql://localhost:3306/recommendbook?useSSL=false&amp;characterEncoding=UTF-8&amp;serverTimezone=UTC&amp;autoReconnection=true");
		ds.setUsername("root");
		ds.setPassword("root");
		
		
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setInitialSize(2);							// 초기 connection 수
		ds.setMaxActive(10);							// connection pool의최대 connection 수
		
		
		// [장기고민] 특정 시간마다 validation query를 실행 셋팅 //
		// 해결을 위한 method
		ds.setValidationQuery("SELECT1");			// connection 정상여부를 검사
		ds.setTestWhileIdle(true);
		ds.setTimeBetweenEvictionRunsMillis(7200000);
		
		
		// MySQL 8시간동안 접속하지않으면 자동종료
		// 해결을 위한 URL : autoReconnection=true



		
		return ds;
		
	} // dataSource() END
	
	@Bean
	public UserInfoDao userInfoDao() {
		return new UserInfoDao(dataSource());
	
	}
	
	@Bean
	public PostInfoDao postInfoDao() {
		return new PostInfoDao(dataSource());
	}
	
	@Bean
	public RecommendInfoDao recommendInfoDao() {
		return new RecommendInfoDao(dataSource());
	}
	
	@Bean
	public SearchBookDao searchBookDao() {
		return new SearchBookDao(dataSource());
	}
	
	@Bean
	public CommentInfoDao CommentInfoDao() {
		return new CommentInfoDao(dataSource());
	}
	
	
	
	
	// dto //
	@Bean 
	UserInfoDto userInfoDto() {
		return new UserInfoDto();
	}
	
	@Bean 
	PostInfoDto postInfoDto() {
		return new PostInfoDto();
	}
	
	@Bean 
	RecommendInfoDto recommendInfoDto() {
		return new RecommendInfoDto();
	}
	
	@Bean
	SearchBookDto searchBookDto() {
		return new SearchBookDto();
	}
	
	@Bean
	SearchStateDto searchStateDto() {
		return new SearchStateDto();
	}
	
	@Bean
	CommentInfoDto commentInfoDto() {
		return new CommentInfoDto();
	}
	
	
	
	// service // 
	@Bean
	public LoginFilter loginFilter(){
		return new LoginFilter();
	}

	@Bean
	public AverageScoreCal averageScoreCal() {
		return new AverageScoreCal();
	}
	
	@Bean
	public PostPaging postPaging() {
		return new PostPaging();
	}
	
	

	
}// BeanConfig END
