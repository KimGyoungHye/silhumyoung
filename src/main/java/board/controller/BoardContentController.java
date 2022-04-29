package board.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardContentController {
	
	private final String command = "/content.bd";
	private String getPage = "/b_content";
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(command)
	public ModelAndView doAction(
							@RequestParam("bnum") int bnum,
							@RequestParam("pageNumber") int pageNumber,
							HttpSession session) {
		
		boardDao.updateReadcount(bnum);
		BoardBean boardBean=boardDao.getArticle(bnum);
		MemberBean memberBean = (MemberBean)session.getAttribute("loginInfo");
		String userState=memberBean.getUserState();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("boardBean",boardBean);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("userState",userState);
		mav.setViewName(getPage);
		return mav;
	}
	
}
