package controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.PostInfoDao;
import dao.SearchBookDao;
import dto.SearchBookDto;
import dto.SearchStateDto;
import service.PostPaging;

@Controller
public class HomeController {

	// DAO
	@Autowired
	SearchBookDao searchBookDao;

	@Autowired
	PostInfoDao postInfoDao;

	// DTO
	@Autowired
	SearchStateDto searchStateDto;

	// service
	@Autowired
	PostPaging postPaging;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root(Locale locale, Model model) {

		// [aspect] 게시글 리스트 조회 //

		return "home/home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {

		// [aspect] 게시글 리스트 조회 //

		return "home/home";
	}

	
	  // 도서 검색 요청//
	  @RequestMapping(value="/home/searchBook", method = RequestMethod.POST) 
	  public String searchBook(HttpServletRequest request, SearchStateDto command, Model model, HttpServletResponse response) {
	  
	  // 도서검색 // 
	  List<SearchBookDto> searchList = searchBookDao.search(command.getBookType(),command.getFavorite(), command.getBookLevel());
	  
	  model.addAttribute("searchList", searchList);
	  
	  
	  // [aspect] 게시글 리스트 조회 //
	  
	  
	  return "home/home";
	  
	  
	  } // searchBook() END
	  
	 
	/*
	 * // test ajax
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/home/searchBook", produces =
	 * "text/html;charset=utf8", method = RequestMethod.POST) public String
	 * searchBook(@RequestParam HashMap<String, Object> params) {
	 * 
	 * System.out.println("ajax controller--------------------------------");
	 * 
	 * HashMap<String, Object> result = new HashMap<String, Object>();
	 * 
	 * String bookType = ""; String favorite = ""; String bookLevel = "";
	 * 
	 * bookType = "" + params.get("bookType"); favorite = "" +
	 * params.get("favorite"); bookLevel = "" + params.get("bookLevel");
	 * 
	 * // test System.out.println("bookType : " + bookType);
	 * System.out.println("favorite : " + favorite);
	 * System.out.println("bookLevel : " + bookLevel);
	 * 
	 * List<SearchBookDto> searchList = searchBookDao.search(bookType, favorite,
	 * bookLevel);
	 * 
	 * result.put("searchList", searchList);
	 * 
	 * return getReturnJSonString(result); /////////////////////////////// 해쉬맵 타입 또는
	 * json 객체 타입으로 반환
	 * 
	 * } // searchBook() END
	 * 
	 * // (java) object -> json String으로 변환 // public String
	 * getReturnJSonString(Object obj) {
	 * 
	 * Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	 * 
	 * return gson.toJson(obj); }
	 */
	  
	  

}
