package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;

@Controller
public class Id_Check_Controller {
	private final String command = "id_check.mem";
	private String getPage = "companyRegisterForm";
	private String gotoPage= "redirect:/companyRegister.mem"; //나중에 수정하기
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command)
	public void doAction(@RequestParam(value="userid") String userid, 
			HttpServletResponse response) {
		
		System.out.println(command);
		System.out.println(userid);
		try {
			PrintWriter out = response.getWriter();
		
				
		ModelAndView mav = new ModelAndView();
		int cnt = memberDao.idCheck(userid);
		if(cnt>=1) {  //응답을 보내야 하는데...? 
			//mav.addObject("1", 1);
			//mav.setViewName(getPage);
			out.write("1"); //응답이 success function(data)로 간다.
		}
		else {
			//mav.addObject("0", 0);
			out.write("0"); //응답이 success function(data)로 간다.
			
			//mav.setViewName(getPage);
		}
		return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
