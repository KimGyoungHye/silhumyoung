package memberDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import memberDetail.model.MemberDetailDao;
import utility.Responsing;

@Controller
public class MemberDetailDeleteController {
	private final String command = "/delete.md";
	private String getPage = "/delete";
	private String gotoPage = "redirect:myPage.mem";
	private String loginPage = "redirect:/login.mem";

	@Autowired
	private MemberDetailDao memberDetailDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(MemberBean memberBean,
			HttpServletResponse response,
			HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:/myPage.mem");
			return loginPage;
		}
		Responsing alerting = new Responsing(response);
		if(!memberBean.getPassword().equals(loginInfo.getPassword())) {
			alerting.useAlert("PW ºÒÀÏÄ¡");
			return getPage;
		}
		int cnt = memberDetailDao.deleteMemberDetail(loginInfo.getUserDetail());
		if(cnt>0) {
			session.removeAttribute("myDetailNum");
			return gotoPage;
		}
		return getPage;
	}
}
