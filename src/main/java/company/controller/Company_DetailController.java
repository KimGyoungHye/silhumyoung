package company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import company.model.CompanyBean;
import company.model.CompanyDao;

@Controller
public class Company_DetailController {

	private final String command="companydetail.cp";
	private String getPage="company_info";
	
	@Autowired
	private CompanyDao cdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("cnum") int cnum,CompanyBean companybean, Model model) {
		System.out.println("cnum:"+companybean.getCnum());
		CompanyBean bean=cdao.getCompanyInfo2(companybean.getCnum());
		
		bean.setCregi_num1(bean.getCregi_num().substring(0,3));
		bean.setCregi_num2(bean.getCregi_num().substring(3,5));
		bean.setCregi_num3(bean.getCregi_num().substring(5));
		
		model.addAttribute("bean", bean); 
		return getPage;
	}
	
}
