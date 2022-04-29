package insucate.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import insucate.model.InsuCateBean;
import insucate.model.InsuCateDao;
import utility.Responsing;

@Controller
public class InsuCateUpdateController {
	
	private final String command="/update.ic";
	private String getPage="updateCategory";
	
	@Autowired
	private InsuCateDao insuCateDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam("num") int num, HttpServletRequest request) {
		InsuCateBean insuCateBean=insuCateDao.getCategory(num);
		request.setAttribute("insuCateBean", insuCateBean);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
							@Valid InsuCateBean insuCateBean, 
							BindingResult result,
							HttpServletResponse response) {
		if(result.hasErrors()) {
			return getPage;
		}
		int cnt=insuCateDao.updateCategory(insuCateBean);
		
		Responsing responsing=new Responsing(response);
		if(cnt>0) {
			responsing.useAlert("카테고리를 수정하였습니다.");
			responsing.useRedirect("list.ic");
		}
		else {
			responsing.useAlert("카테고리 수정을 실패하였습니다.");
			responsing.useRedirect("list.ic");
		}
		return null;
	}
}
