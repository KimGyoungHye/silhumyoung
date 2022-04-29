package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bohum.model.BohumDao;


@Controller
public class MemberMainController {
	private final String command = "/main.mem";
	private String getPage = "Main";
	
	@RequestMapping(command)
	public String doAction() {
		
		return getPage;
	}
	
	
}
