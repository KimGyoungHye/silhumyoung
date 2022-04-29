package homeAdmin.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Responsing;

@Controller
public class MemberUserStateUpdateController {
	private final String command = "/userStateUpdate.ha";
	private String getPage = "redirect:memberList.ha";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command)
	public String doAction(MemberBean memberBean,
			HttpServletResponse response) {
		int cnt = memberDao.userStateUpdate(memberBean);
		Responsing responsing = new Responsing(response);
		if(cnt>0) {
			responsing.useAlert("수정에 성공하였습니다.");			
			responsing.useRedirect("memberList.ha");
		}else {
			responsing.useAlert("수정에 실패하였습니다.");
			responsing.useRedirect("memberList.ha");
		}
		responsing.useRedirect("memberList.ha");
		return getPage;
	}
}
