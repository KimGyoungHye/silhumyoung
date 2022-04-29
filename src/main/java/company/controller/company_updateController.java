package company.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyBean;
import company.model.CompanyDao;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class company_updateController {

	private final String command="companyUpdate.cp";
	private String getPage="company_infoUpdateForm";
	private String gotoPage="redirect:/main.bh";

	@Autowired
	private CompanyDao cDao;
	@Autowired
	ServletContext servletContext;
	MemberBean loginInfo;

	//리스트에서 수정폼으로 이동
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpSession session,Model model, MemberBean memberBean,HttpServletResponse response) {
		System.out.println("controller도착");
        
		loginInfo = (MemberBean)session.getAttribute("loginInfo");

		System.out.println("loginInfo.getCname():"+loginInfo.getCname());
		CompanyBean bean=cDao.getCompanyInfo(loginInfo.getCname());
		
		bean.setCregi_num1(bean.getCregi_num().substring(0,3));
		bean.setCregi_num2(bean.getCregi_num().substring(3,5));
		bean.setCregi_num3(bean.getCregi_num().substring(5));
		
		model.addAttribute("bean", bean); 
		return getPage; 
		
	}

	//수정폼에서 수정버튼 클릭
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@Valid CompanyBean bean, BindingResult result, HttpSession session) {
		System.out.println("doAction.POST 도착");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("id:"+loginInfo.getId());
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", loginInfo.getId());
		map.put("cname",bean.getCname());
		
		String cregi_num=bean.getCregi_num1()+bean.getCregi_num2()+bean.getCregi_num3();
		bean.setCregi_num(cregi_num);
		System.out.println("bean.cname:"+bean.getCname()+"\nbean.cregi_num:"+bean.getCregi_num()+"\nbean.cadmin:"+bean.getCadmin());
		 
		 //유효성검사에 걸리면 이전 폼으로 돌아감
		 if(result.hasErrors()) {
			 mav.setViewName(getPage);
			 return mav;
		 }
		
		String uploadPath = servletContext.getRealPath("/resources/company"); 
		MultipartFile multi = bean.getUpload();

		int cnt = cDao.updateCompany(bean);
		cnt=cDao.updateCname(map);
		
		if(cnt > 0) {
			System.out.println("sql문 성공");
			if(bean.getUpload().equals("")) {
				mav.setViewName(gotoPage);
			}else {
				File f = new File(uploadPath+"\\" + bean.getCimage());
			
				try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			MemberBean mbean=cDao.searchId(loginInfo.getId());
	        session.setAttribute("loginInfo", mbean);        
	        session.setAttribute("loginCompany", loginInfo.getCname()); 
		
			mav.setViewName(gotoPage);
		
		}
		else {
			System.out.println("sql문 삽입 실패. 원래 페이지로 돌아감");
			mav.setViewName(getPage);
		}

		return mav; 
	}
}
