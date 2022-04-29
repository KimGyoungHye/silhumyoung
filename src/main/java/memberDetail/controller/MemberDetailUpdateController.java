package memberDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import memberDetail.model.MemberDetailBean;
import memberDetail.model.MemberDetailDao;
import utility.AgeAndGender;
import utility.Responsing;

@Controller
public class MemberDetailUpdateController {
	private final String command = "/update.md";
	private String getPage = "/update";
	private String gotoPage = "redirect:myPage.mem";
	private String loginPage = "redirect:/loginForm.mem";

	@Autowired
	private MemberDetailDao memberDetailDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session,
			HttpServletRequest request) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:/myPage.mem");
			return loginPage;
		}
		AgeAndGender ageAndGender=new AgeAndGender();
		int age=ageAndGender.calculateAge(loginInfo);
		String gender=ageAndGender.whatIsGender(loginInfo);

		session.setAttribute("memberAge", age);
		session.setAttribute("memberGender", gender);
		MemberDetailBean memberDetailBean = memberDetailDao.getMemberDetail(loginInfo.getUserDetail());
		memberDetailBean.setGender(gender);
		request.setAttribute("memberDetailBean", memberDetailBean);
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(@Valid MemberDetailBean memberDetailBean,
			BindingResult result,
			HttpServletRequest request) {
		System.out.println("memberDetailBean.getNum()"+memberDetailBean.getNum());
		System.out.println("memberDetailBean.getAge()"+memberDetailBean.getAge());
		System.out.println("memberDetailBean.getGender()"+memberDetailBean.getGender());
		System.out.println("memberDetailBean.getJob()"+memberDetailBean.getJob());
		System.out.println("memberDetailBean.getSalary()"+memberDetailBean.getSalary());
		System.out.println("memberDetailBean.getMarriage()"+memberDetailBean.getMarriage());
		System.out.println("memberDetailBean.getHeight()"+memberDetailBean.getHeight());
		System.out.println("memberDetailBean.getWeight()"+memberDetailBean.getWeight());
		System.out.println("memberDetailBean.getDisease()"+memberDetailBean.getDisease());
		System.out.println("memberDetailBean.getFamily_history()"+memberDetailBean.getFamily_history());
		if(result.hasErrors()) {
			return getPage;
		}
		int cnt=memberDetailDao.updateMemberDetail(memberDetailBean);
		if(cnt>0) {
			System.out.println("성공");
			return gotoPage;
		}
		else {
			System.out.println("실패");
			request.setAttribute("memberDetailBean", memberDetailBean);
			return getPage;
		}
	}
}
