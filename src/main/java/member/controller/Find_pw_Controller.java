package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class Find_pw_Controller {
	private final String command = "/findpw.mem";
	private final String command2 = "/findpw2.mem";
	private String getPage = "findid"; //여기서 pw찾기 라디오 클릭하는 곳으로?
	private String gotoPage = "redirect:/main.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction1() {
		return getPage;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.GET)
	public void doAction(MemberBean member,HttpServletResponse response) throws IOException {
		
		String pw = memberDao.getPwByIdNameRrn(member,response); 
		System.out.println("searchPw:" + pw);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pw", pw);
		mav.setViewName(gotoPage);
	}	
}
