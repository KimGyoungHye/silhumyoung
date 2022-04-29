package listMem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bohum.model.BohumBean;
import bohum.model.BohumDao;
import company.model.CompanyBean;
import company.model.CompanyDao;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class getInsuCompanyController {
	private final String command = "/getInsuCompany.lm";
	private String gotoPage = "insuCompany";
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BohumDao bdao;
	@Autowired
	private CompanyDao cdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="whatColumn", required = false)String whatColumn,
			@RequestParam(value="keyword", required = false)String keyword,
			@RequestParam(value="pageNumber", required = false)String pageNumber,
			@RequestParam(value="cname", required = true)String cname,
			Model model, HttpServletRequest request, HttpSession session) {
		
		System.out.println("whatColumn : "+whatColumn);
		System.out.println("keyword : "+keyword);
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		map.put("cname", cname);
		
		int total = bdao.getInsuTotal2(map);
		System.out.println("cname:"+cname);
		System.out.println("total:"+total);
		
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, null, total, url,whatColumn,keyword);
		
		List<BohumBean> getList = bdao.getAllListCompany(map, pageInfo);
		
		session.setAttribute("getList", getList);
		model.addAttribute("total2", total);
		model.addAttribute("pageInfo2", pageInfo);
		model.addAttribute("cname", cname);
		
		return gotoPage;
	}


}
