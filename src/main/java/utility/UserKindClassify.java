package utility;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberBean;

public class UserKindClassify {
	private String loginPage = "loginForm.mem";

	public MemberBean areYouLogin(HttpSession session,
			HttpServletResponse response,
			String destination) {
		Responsing responsing = new Responsing(response);
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", destination);
			responsing.useRedirect(loginPage);
		}
		return loginInfo;
	}
	
	public void areYouAdmin(HttpSession session,
			HttpServletResponse response,
			String destination) {
		Responsing responsing = new Responsing(response);
		MemberBean loginInfo = areYouLogin(session,response,destination);
		if(loginInfo==null)return;
		if(!loginInfo.getUserState().equals("관리자")) {
			responsing.useAlert("권한이 없습니다.");
			responsing.useRedirect("main.mem");
		}
	}
	
	public void areYouCompany(HttpSession session,
			HttpServletResponse response,
			String destination) {
		Responsing responsing = new Responsing(response);
		MemberBean loginInfo = areYouLogin(session,response,destination);
		if(loginInfo==null)return;
		System.out.println(loginInfo.getUserState());
		if(!loginInfo.getUserState().equals("회사")) {
			responsing.useAlert("권한이 없습니다.");
			responsing.useRedirect("main.mem");
		}
	}
}
