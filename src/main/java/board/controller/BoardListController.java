package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
public class BoardListController {
	private final String command = "/list.bd";
	private String getPage = "/b_boardList";
	private String gotoPage = "redirect:/loginForm.mem";
	
	@Autowired
	BoardDao boardDao;
	
	@RequestMapping(value=command)
	public String doAction(
							@RequestParam(value="pageNumber",required = false) String pageNumber,
							@RequestParam(value="whatColumn",required = false) String whatColumn,
							@RequestParam(value="keyword",required = false) String keyword,
							HttpServletRequest request,
							HttpSession session) {

		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			return gotoPage;
		}
		String userState=loginInfo.getUserState();
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = boardDao.getTotalCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, whatColumn, keyword);
		int currentPage = 1;
	      if(pageNumber!=null)currentPage = Integer.parseInt(pageNumber);
	      int number = totalCount - (currentPage-1) * 5; 
	      request.setAttribute("number", number);
		List<BoardBean> boardList = boardDao.getBoardList(map, pageInfo);
		request.setAttribute("boardList", boardList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("userState", userState);
		return getPage;
	}

}
