package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Responsing;

@Controller
public class Find_id_Controller {
	private final String command = "/findid.mem";
	private final String command2 = "foundid.mem";
	private String getPage = "findid";
	private String gotoPage = "redirect:/loginForm.mem";
	@Autowired
	private MemberDao memberDao;


	@RequestMapping(value=command, method=RequestMethod.GET)
	public String findid() {
		System.out.println("findId command1:" + command);
		return getPage;
	}

	@RequestMapping(value=command2, method=RequestMethod.GET)
	public void doAction(HttpServletResponse response, HttpServletRequest request) {
		String regi_number1 = request.getParameter("regi_number1");
		String regi_number2 = request.getParameter("regi_number2");
		String name = request.getParameter("name");

		System.out.println("regi_number1 : "+regi_number1);
		System.out.println("regi_number2 : "+regi_number2);
		System.out.println("name : "+name);

		MemberBean mb = new MemberBean();
		mb.setRegi_number1(regi_number1);
		mb.setRegi_number2(regi_number2);
		mb.setName(name);
		System.out.println("mb.getName():"+mb.getName());

		String searchId = memberDao.getIdByNameRrn(mb);  
		ModelAndView mav=new ModelAndView();
		Responsing responsing = new Responsing(response);
		if(searchId == null) { //
			System.out.println("searchId1:" + searchId);
			responsing.useAlert("찾으시는 아이디가 없습니다");
			responsing.useRedirect("register.mem");
		}//if
		else { //id가 존재하면 
			System.out.println("searchId2:" + searchId);
			responsing.useAlert("찾으시는 아이디는 "+searchId+"입니다");
			responsing.useRedirect("loginForm.mem");
		}
	}
}
