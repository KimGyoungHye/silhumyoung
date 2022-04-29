package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import memberDetail.model.MemberDetailBean;
import memberDetail.model.MemberDetailDao;
import utility.Responsing;

@Controller
public class MemberKakaoController {
	private final String command = "/kakaoLogin.mem";

	private String getPage = "loginForm";
	private String gotoPage = "redirect:/main.mem";
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberDetailDao memberDetailDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction() {
		
		return "testKakao";
	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(@RequestParam(value = "email1")String email1,
			@RequestParam(value = "email2")String email2,
			HttpSession session,
			HttpServletResponse response) {
		
		Responsing alerting = new Responsing(response);
		System.out.println(email1+"/"+email2);
		
		MemberBean memberBean = new MemberBean();
		memberBean.setEmail1(email1);
		memberBean.setEmail2(email2);
		
		MemberBean searchBean = memberDao.getMemberKakao(memberBean);
		
		if(searchBean==null) {
			alerting.useAlert("로그인 정보가 없습니다.");
			return getPage;
		}else{
			session.setAttribute("loginInfo", searchBean);

			MemberDetailBean mDetailBean = memberDetailDao.getMemberDetail(searchBean.getUserDetail());
			if(mDetailBean!=null) {
				session.setAttribute("myDetailNum", mDetailBean.getNum());
			}
			String destination = (String)session.getAttribute("destination");
			System.out.println("destination1"+destination);
			if(destination==null) {
				destination = gotoPage;
			}
			System.out.println("destination2"+destination);

			return destination; //"redirect:/insert.prd"
		}

	}
	
}
