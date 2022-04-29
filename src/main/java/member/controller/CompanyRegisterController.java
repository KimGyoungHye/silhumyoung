package member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class CompanyRegisterController {
	private final String command="/companyRegister.mem";
	private String getPage="companyRegisterForm";
	private String gotoPage= "redirect:/companyLogin.mem";

	@Autowired
	private MemberDao memberDao;
	
	// CompanyRegisterController 요청
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {

		return getPage;
	}
 
	//companyRegisterForm.jsp 추가하기 클릭
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("member")
								@Valid MemberBean member,
								BindingResult result) {
		
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
		System.out.println("회원가입 유효성" + result.hasErrors()); //문제 있으면 true 리턴
			mav.setViewName(getPage);
			return mav;
		}
		int cnt = memberDao.insertCMember(member);
		System.out.println("insert cnt:" + cnt);
		
		mav.setViewName(gotoPage);
		return mav;
		
	}

}
