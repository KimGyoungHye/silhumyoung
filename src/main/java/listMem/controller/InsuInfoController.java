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
import member.model.MemberDao;
import utility.Paging;

@Controller
public class InsuInfoController {
	private final String command = "/insuInfo.lm";
	private String gotoPage = "insuInfo";
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BohumDao bdao;
	
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
		
		return gotoPage;
	}

}
