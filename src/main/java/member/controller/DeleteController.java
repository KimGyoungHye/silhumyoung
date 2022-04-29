package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class DeleteController {
	private final String command = "/delete.mem";
	private String gotoPage = "redirect:/adminLogin.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="id", required=true) String id,
							@RequestParam(value="pageNumber", required=true) int pageNumber
							) {
		
		System.out.println("command:" + command);
		
		int cnt = memberDao.deleteMember(id);
		System.out.println("delete cnt:" + cnt);
		return gotoPage +"?pageNumber="+pageNumber;
	}

}
