package heart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bohum.model.BohumBean;
import heart.model.HeartBean;
import heart.model.HeartDao;
import member.model.MemberBean;

@Controller
public class HeartAddController {

	private final String command="add.ht";
	private String loginPage = "redirect:/login.mem";
	private String gotoPage="redirect:/list.ht";
	private String getPage="insuInfo";
	@Autowired
	private HeartDao heartDao;

	@RequestMapping(command)
	public String doAction(
			HeartBean rows,
			HttpSession session) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo==null) {
			session.setAttribute("destination", "redirect:/add.ht");
			return loginPage;
		}
		else {   
			String[] rowCheck = rows.getRowcheck().split(",");
			System.out.println("rowCheck:"+rowCheck);
			if(rowCheck!=null) {
				List<BohumBean> heartList=heartDao.getHeartList(loginInfo.getId());

				HeartBean heartBean=new HeartBean();
				heartBean.setMid(loginInfo.getId());

				boolean flag = false;
				if(heartList.size()!=0) {
					for(int i=0;i<rowCheck.length;i++ ) {
						int insu = 0;
						for(int j=0;j<heartList.size();j++) {
							int myInsu = heartList.get(j).getInsu();
							insu = Integer.parseInt(rowCheck[i]);
							if(insu==myInsu) {
								flag = true;
							}
						}
						if(!flag) {
							heartBean.setInsu_num(insu);
							heartDao.insertHeart(heartBean);
						}
						flag = false;
					}
				}else {
					for(int i=0;i<rowCheck.length;i++ ) {
						int insu = Integer.parseInt(rowCheck[i]);
						heartBean.setInsu_num(insu);
						heartDao.insertHeart(heartBean);
					}
				}
				return gotoPage;
			}else {
				return getPage;
			}
		}
	}
}