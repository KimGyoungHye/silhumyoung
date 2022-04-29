package company.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyBean;
import company.model.CompanyDao;

@Controller
public class company_listController {
	//사이트관리자 페이지->전체 회사 리스트 보기
	
	private final String command="companyList.cp";
	private String getPage="company_listForm";
	
	@Autowired
	private CompanyDao cDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value="s_company", required=false) String s_company, 
									HttpServletRequest request) {
		
		Map<String, String> map=new HashMap<String, String>();
		
		if(s_company==null) {
			s_company="";
		}
		map.put("s_company", "%"+s_company.toUpperCase()+"%");
	
		List<CompanyBean> list=cDao.companyList(map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName(getPage);
		
		return mav;
	}

}
