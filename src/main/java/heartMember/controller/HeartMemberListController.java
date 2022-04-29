package heartMember.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import graph.model.GraphBean;
import graph.model.GraphJsonBean;
import heartMember.model.HeartMemberBean;
import heartMember.model.HeartMemberDao;
import member.model.MemberBean;

@Controller
public class HeartMemberListController {
	
	private final String command="/list.hm";
	private String getPage="heartMemberList";
	@Autowired
	private HeartMemberDao heartMemberDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam(value="loginCompany",required = true) String loginComMem,
			HttpSession session, HttpServletRequest request) {
		
		MemberBean companyInfo=(MemberBean)session.getAttribute("loginInfo");
		String cname=companyInfo.getCname();

		List<HeartMemberBean> heartMemberList = heartMemberDao.getHeartMemberList(cname);
		request.setAttribute("heartMemberList", heartMemberList);
		
		List<GraphBean> DateList = heartMemberDao.getGraphDateCom(loginComMem);
		GraphJsonBean graphJsonBean = new GraphJsonBean(DateList);
		System.out.println("X_list"+graphJsonBean.getMyLabels().size());
		System.out.println("Y_list"+graphJsonBean.getMyData().size());
		session.setAttribute("X_list", graphJsonBean.getMyLabels());
		session.setAttribute("Y_list", graphJsonBean.getMyData());
		
		List<HeartMemberBean> heartInsuName = heartMemberDao.getInsuName(loginComMem);
		String heartInsuName2 = null;
		for(HeartMemberBean hb : heartInsuName) {
			heartInsuName2 += ","+hb.getInsuname();
		}
		List<GraphBean> heartInsuPerson = heartMemberDao.getInsuPerson(loginComMem);
		String heartInsuPersonx = null;
		String heartInsuPersony = null;
		for(GraphBean gb : heartInsuPerson) {
			heartInsuPersonx += ","+gb.getX();
			System.out.println("heartInsuPersonx"+heartInsuPersonx);
			heartInsuPersony += ","+gb.getY();
			System.out.println("heartInsuPersony"+heartInsuPersony);
		}
		
		System.out.println("heartInsuName"+heartInsuName2);
		session.setAttribute("heartInsuName", heartInsuName2);
		
		session.setAttribute("heartInsuPersonx", heartInsuPersonx);
		session.setAttribute("heartInsuPersony", heartInsuPersony);
		
		return getPage;
	}
}
