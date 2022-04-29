package homeAdmin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.UserKindClassify;
import utility.Paging;

@Controller
public class MemberListController {
	private final String command = "/memberList.ha";
	private String getPage = "/member/memberList";

	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command)
	public String doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		UserKindClassify classify = new UserKindClassify();
		classify.areYouAdmin(session, response, "redirect:memberList.ha");
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(whatColumn!=null) {
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword.toUpperCase()+"%");
			System.out.println("keyword:"+"%"+keyword.toUpperCase()+"%");
		}
		int totalCount = memberDao.getTotalCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, whatColumn, keyword);

		List<MemberBean> memberList = new ArrayList<MemberBean>();
		memberList = memberDao.getMemberList(map,pageInfo);
		
		request.setAttribute("whatColumn", whatColumn);
		request.setAttribute("keyword", keyword);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("memberList", memberList);
		request.setAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
