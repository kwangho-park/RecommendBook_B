package springConfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// spring 설정 파일 : 기본 //
// dispatcher servlet , View Resolver, handler mapping/adapter 설정
// servlet-context.xml 과 동일한 역활 

@Configuration
@EnableWebMvc			// handler mapping, adapter 객체 생성
public class ServletConfig implements WebMvcConfigurer{

	// ??  //
	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	

	// 단순 mapping  //
	// container에 controller bean을 생성하지 않아도 되는 장점
	// (GET, POST 전부 처리)
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {

		registry.addViewController("/post/newPost").setViewName("post/newPost");		// [mapping] ip주소/RecommendBook_B/post/newPost -> /WEB-INF/views/post/newPost.jsp
		registry.addViewController("/signUp").setViewName("signUp");
		registry.addViewController("/login").setViewName("login");
		registry.addViewController("/logout").setViewName("logout");
		registry.addViewController("/comment/modifyComment").setViewName("comment/modifyComment");

		
		
	} // addViewControllers() END
	
	
	
	
	// View Resolver //
	// controller에서 dispatcher servlet으로 반환한 경로를 실제 경로로 변환
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	}
	
	
	
	
	// [view]
    // jsp에서 js, css에 접근하기위한 mapping (src/main/webapp/resource) //
	// [장기적 고민] 순수 jsp와 다르게 mapping 해야하는 이유는???

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		
	    // 					handler : 요청 url, 						locations : 실제 파일 경로		
		registry.addResourceHandler("/css/**").addResourceLocations("/resources/bootstrap/css/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/resources/bootstrap/fonts/");
		registry.addResourceHandler("/images/**").addResourceLocations("/resources/bootstrap/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("/resources/bootstrap/js/");
		registry.addResourceHandler("/scss/**").addResourceLocations("/resources/bootstrap/scss/");
	
		
		registry.addResourceHandler("/common/**").addResourceLocations("/resources/common/");	
		registry.addResourceHandler("/login/**").addResourceLocations("/resources/login/");
		registry.addResourceHandler("/logout/**").addResourceLocations("/resources/logout/");
		registry.addResourceHandler("/signUp/**").addResourceLocations("/resources/signUp/");
		registry.addResourceHandler("/post/**").addResourceLocations("/resources/post/");
		registry.addResourceHandler("/comment/**").addResourceLocations("/resources/comment/");
		
		registry.addResourceHandler("/home/**").addResourceLocations("/resources/home/");		
		
	
	} // addResourceHandlers() END

	
} // ServletConfig  END
