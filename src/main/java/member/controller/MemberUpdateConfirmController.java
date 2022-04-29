package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyBean;
import member.model.MemberBean;
import member.model.MemberDao;
import memberDetail.model.MemberDetailBean;
import utility.Responsing;

@Controller
public class MemberUpdateConfirmController {
	private final String command = "/memberUpdateConfirm.mem";
	private String getPage = "/memberUpdateConfirm";
	private String gotoPage = "redirect:/memberUpdateForm.mem";
	private String loginPage = "redirect:/login.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			HttpSession session,
			HttpServletRequest request) {
		System.out.println("confirm");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:../myPage.mem");
			return loginPage; 
		}
			MemberBean bean = memberDao.getMember(loginInfo.getId());
			request.setAttribute("MemberBean", bean);
			return getPage; 
		
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction(
			MemberBean bean, 
			HttpSession session,
			BindingResult result,
			HttpServletRequest request,
			HttpServletResponse response
			) {
		if(result.hasErrors()) {
			System.out.println("update3");
			return getPage;
		}
		MemberBean mbean=memberDao.getMember(bean.getId());
		request.setAttribute("MemberBean", bean);
		Responsing responsing = new Responsing(response);
		if(mbean.getPassword().equals(bean.getPassword())) { 
			return gotoPage;
			}else {
				responsing.useAlert("비밀번호가 일치하지 않습니다");
				responsing.useHistory(-1);
			}
		return gotoPage;
	}
}
