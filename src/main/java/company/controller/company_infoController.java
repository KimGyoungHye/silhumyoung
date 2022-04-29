package company.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import company.model.CompanyBean;
import company.model.CompanyDao;
import member.model.MemberBean;

@Controller
public class company_infoController {

	private final String command = "/companyInfo.cp";
	private String getPage = "company_info";

	@Autowired 
	private CompanyDao cDao;

	//메인화면에서 보험사 페이지로 이동
	@RequestMapping(value=command)
	public String doAction(HttpSession session,Model model, MemberBean memberBean,HttpServletResponse response) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) { // 로그인 안했으면
			System.out.println("로그인 안함");
			return "redirect:/mainhome.cp"; 
		}
		else { // 로그인 했으면 

			MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
			String mid=mb.getId();
			CompanyBean bean=cDao.getCompanyInfo(mid);
			model.addAttribute("bean", bean); 
			return getPage; 
		}
	}
}
