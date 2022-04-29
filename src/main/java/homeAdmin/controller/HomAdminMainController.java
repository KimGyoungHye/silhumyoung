package homeAdmin.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import utility.UserKindClassify;

@Controller

public class HomAdminMainController {
	private final String command = "/main.ha";
	private String getPage = "/main";

		@RequestMapping(value=command)
		public String doAction(HttpSession session,HttpServletResponse response) {
			
			UserKindClassify classify = new UserKindClassify();
			classify.areYouAdmin(session, response, "main.ha");
			
			return getPage;
		}

}
