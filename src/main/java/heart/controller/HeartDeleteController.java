package heart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import heart.model.HeartBean;
import heart.model.HeartDao;
import member.model.MemberBean;

@Controller
public class HeartDeleteController {
	
	private final String command="delete.ht";
	private String gotoPage="redirect:/list.ht";
	@Autowired
	private HeartDao heartDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
						@RequestParam("insu") int insu,
						HttpSession session) {
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		System.out.println("loginInfo.getId():"+loginInfo.getId());
		System.out.println("insu:"+insu);
	
		HeartBean heartBean=new HeartBean();
		heartBean.setMid(loginInfo.getId());
		heartBean.setInsu_num(insu);
		heartDao.deleteHeart(heartBean);
		
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
						HttpServletRequest request,
						HttpSession session) {
			
		String[] rowcheck=request.getParameterValues("rowcheck");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		for(int i=rowcheck.length-1; i>=0; i--) {
			HeartBean heartBean=new HeartBean();
			heartBean.setMid(loginInfo.getId());
			heartBean.setInsu_num(Integer.parseInt(rowcheck[i]));
			System.out.println("loginInfo.getId():"+loginInfo.getId());
			System.out.println("insu:"+Integer.parseInt(rowcheck[i]));
			heartDao.deleteHeart(heartBean);
		}
		return gotoPage;
	}
}
