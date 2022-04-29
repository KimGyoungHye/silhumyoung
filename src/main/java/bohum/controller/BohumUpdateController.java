package bohum.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import bohum.model.BohumBean;
import bohum.model.BohumDao;
import insucate.model.InsuCateBean;
import member.model.MemberBean;

@Controller
public class BohumUpdateController {

	private final String command="bohumUpdate.bh";
	private String gotoPage="bohumUpdateForm";
	private String getPage="redirect:/list.bh";
	private File f;
	@Autowired
	private BohumDao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("insu") int insu, HttpSession session, BohumBean bean, Model model, HttpServletResponse response) {
		System.out.println("insu:"+insu);
		BohumBean bbean=bdao.getBohum(insu);
		
		List<InsuCateBean> icate = bdao.getCategory();
		session.setAttribute("icate", icate);
		
		model.addAttribute(bbean);
		
		return gotoPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(BohumBean bean) {
		
		ModelAndView mav = new ModelAndView();
		String uploadPath = servletContext.getRealPath("/resources/insuprice"); 

		MultipartFile multi = bean.getImage();
		System.out.println("image2:"+bean.getImage2());
		System.out.println("image:"+bean.getInsuprice());
		int cnt = bdao.updateBohum(bean);
		
		if(cnt > 0) {
			System.out.println("sql문 성공");
			if(bean.getImage().equals("")) {
				mav.setViewName(getPage);
			}else {
				f = new File(uploadPath+"\\" + bean.getInsuprice());
			
				try {
					multi.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			mav.setViewName(getPage);
		}
		else {
			System.out.println("sql문 삽입 실패. 원래 페이지로 돌아감");
			mav.setViewName(gotoPage);
		}

		return mav; 
	}
	
}
