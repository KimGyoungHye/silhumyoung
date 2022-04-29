package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import memberDetail.model.MemberDetailBean;
import memberDetail.model.MemberDetailDao;

@Controller
public class MemberMyPageController {
	private final String command = "/myPage.mem";
	private String getPage = "/myPage/myPageMain";
	private String loginPage = "redirect:/loginForm.mem";

	@Autowired
	private MemberDetailDao memberDetailDao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:/myPage.mem");
			return loginPage;
		}
		MemberDetailBean mDetailBean = memberDetailDao.getMemberDetail(loginInfo.getUserDetail());
		if(mDetailBean!=null) {
			session.setAttribute("myDetailNum", mDetailBean.getNum());
		}
		return getPage;
	}
}
