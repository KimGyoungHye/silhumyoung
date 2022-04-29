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
public class InsuCompanyController {
	private final String command = "/insuCompany.lm";
	private String gotoPage = "companyList";
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
			Model model, HttpServletRequest request, HttpSession session) {
		
		System.out.println("whatColumn : "+whatColumn);
		System.out.println("keyword : "+keyword);
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int total = bdao.getTotal(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, null, total, url,whatColumn,keyword);
		
		List<BohumBean> lists = bdao.getAllList(map, pageInfo);
		
		session.setAttribute("lists", lists);
		model.addAttribute("total", total);
		model.addAttribute("pageInfo", pageInfo);
		
		
		List<CompanyBean> clist = cdao.getCnameCimage();
		String cname = request.getParameter("cname");
//		int cnt = bdao.getInsuTotal1(cname);
		session.setAttribute("clist", clist);
//		session.setAttribute("cnt", cnt);
		
		return gotoPage;
	}


}
