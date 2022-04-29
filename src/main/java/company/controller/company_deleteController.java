package company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import company.model.CompanyDao;

@Controller
public class company_deleteController {

	private final String command="companyDelete.cp";
	private final String goPage ="redirect:/companyList.cp";
	
	@Autowired
	private CompanyDao cdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="cnum", required=true) int cnum) {
		
		int cnt = cdao.deleteCompany(cnum);
		
		return goPage;
	}
}
