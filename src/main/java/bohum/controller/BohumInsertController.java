package bohum.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import bohum.model.BohumBean;
import bohum.model.BohumDao;
import insucate.model.InsuCateBean;
import utility.UserKindClassify;

@Controller
public class BohumInsertController {
	private final String command = "insert.bh";
	private String getPage = "bohumInsertForm";
	private String gotoPage = "redirect:/loginForm.mem";
	private String gotoPage2 = "redirect:/list.bh";
	@Autowired
	BohumDao bdao;
	@Autowired
	ServletContext servletcontext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session,HttpServletResponse response) {
		//로그인 안했으면 보험 추가 할 수 없음.
		UserKindClassify classify = new UserKindClassify();
		classify.areYouCompany(session, response, "main.bh");
		//insertForm에 카테고리 불러오기
		List<InsuCateBean> icate = bdao.getCategory();
		session.setAttribute("icate", icate);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doAction(BohumBean bbean,HttpServletRequest request, Model model) {
		String imagePath = servletcontext.getRealPath("/resources/insuprice");
		System.out.println(imagePath+"/"+bbean.getInsuprice());
		model.addAttribute("imagePath",imagePath);
		
		MultipartFile multi = bbean.getImage();
		
		int cnt = bdao.insertBohum(bbean);
		if(cnt>0) {
			File f = new File(imagePath+"/"+bbean.getInsuprice());
			try {
				multi.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return gotoPage2;
		}
		return getPage;
	}

}
