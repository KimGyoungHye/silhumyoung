package company.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyBean;
import company.model.CompanyDao;

@Controller
public class company_insertController {

	private final String command = "companyInsert.cp";
	private String getPage = "company_infoInsertForm";
	private String gotoPage="redirect:/main.ha";


	@Autowired
	private CompanyDao cDao;

	@Autowired
	ServletContext servletContext;

	//리스트에서 추가하기 이동
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		System.out.println("보험사 정보 추가 폼 도착");
		return getPage;
	}


	//폼 입력 버튼 클릭
	@RequestMapping(value=command, method=RequestMethod.POST) 
	public ModelAndView doAction(@Valid CompanyBean bean, BindingResult result) {
		System.out.println("보험사 정보 입력 실행");
		ModelAndView mav = new ModelAndView();
		String cregi_num=bean.getCregi_num1()+bean.getCregi_num2()+bean.getCregi_num3();
		bean.setCregi_num(cregi_num);
		System.out.println("cregi_num:"+bean.getCregi_num());

		//유효성검사에 걸리면 이전 폼으로 돌아감
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}

		String uploadPath = servletContext.getRealPath("/resources/company");
		MultipartFile multi = bean.getUpload();

		int cnt = cDao.insertCompany(bean); 
		if(cnt > 0) {
			System.out.println("sql문 삽입 성공");
			File f = new File(uploadPath+"\\" + bean.getCimage());
			try {
				multi.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			mav.setViewName(gotoPage);
		}
		else {
			System.out.println("sql문 삽입 실패. 원래 페이지로 돌아감");
			mav.setViewName(getPage);
		}
		return mav; 
	}
}

