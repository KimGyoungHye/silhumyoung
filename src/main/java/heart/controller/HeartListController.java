package heart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bohum.model.BohumBean;
import heart.model.HeartDao;
import member.model.MemberBean;

@Controller
public class HeartListController {
	
	private final String command="/list.ht";
	private String getPage="heartList";
	private String loginPage = "redirect:/loginForm.mem";
	@Autowired
	private HeartDao heartDao;
	
	@RequestMapping(command)
	public String doAction(HttpSession session, Model model) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:/list.ht");
			return loginPage;
		}
		else {
			List<BohumBean> heartList=heartDao.getHeartList(loginInfo.getId());
			//System.out.println("heartList.get(0).getInsu():"+heartList.get(0).getInsu());
			model.addAttribute("heartList", heartList);
			return getPage;
		}
	}
}
