package memberDetail.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import memberDetail.model.MemberDetailBean;
import memberDetail.model.MemberDetailDao;
import utility.AgeAndGender;

@Controller
public class MemberDetailInsertController {
	private final String command = "/insert.md";
	private String getPage = "/insert";
	private String gotoPage = "redirect:myPage.mem";

	@Autowired
	private MemberDetailDao memberDetailDao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		MemberBean loginInfo=(MemberBean)session.getAttribute("loginInfo");

		AgeAndGender ageAndGender=new AgeAndGender();
		int age=ageAndGender.calculateAge(loginInfo);
		String gender=ageAndGender.whatIsGender(loginInfo);

		session.setAttribute("memberAge", age);
		session.setAttribute("memberGender", gender);

		return getPage;
	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(@Valid MemberDetailBean memberDetailBean,
			BindingResult result) {
		if(result.hasErrors()) return getPage;
		int cnt = memberDetailDao.insertMemberDetail(memberDetailBean);
		if(cnt>0) return gotoPage;
		return getPage;
	}
}
