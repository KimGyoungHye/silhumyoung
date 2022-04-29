package bohum.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import utility.UserKindClassify;

@Controller
public class BohumMainController {

	private final String command="main.bh";
	private String getPage="Main";

	@RequestMapping(value=command)
	public String doAction(HttpSession session, HttpServletResponse response) {
		UserKindClassify classify = new UserKindClassify();
		classify.areYouCompany(session, response, "main.bh");

		return getPage;
	}
}

