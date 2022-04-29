package member.controller;

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

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class ListController {
	private final String command="/adminLogin.mem";
	private String getPage="list";

	@Autowired
	private MemberDao memberDao;
	
	// MemberRegisterController 요청
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpServletRequest request) {

	Map<String, String> map = new HashMap<String, String>();
	map.put("whatColumn", whatColumn); //whatColumn=genre, grade, area
	map.put("keyword", "%"+keyword+"%"); // keyword = 한글자만 검색해도 나올 수 있게
	
	int totalCount = memberDao.totalCount(map);
	System.out.println("totalCount:" + totalCount);
	//getTotalCount 호출하면 dao에서 xml로 xml에서 dao로 controller로 온다
	
	String url = request.getContextPath()+command; // ex/list.mv 
	Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword);
	
	List<MemberBean> list = memberDao.memberList(pageInfo,map);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName(getPage); //위에것들 챙겨서 getPage로 간다
		
		return mav;
	
	}
}