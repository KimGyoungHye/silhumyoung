package insucate.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import insucate.model.InsuCateBean;
import insucate.model.InsuCateDao;

@Controller
public class InsuCateInsertController {
	
	private final String command="/insert.ic";
	private String getPage="insertCategory";
	private String gotoPage="redirect:/list.ic";
	
	@Autowired
	private InsuCateDao insuCateDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(@Valid InsuCateBean insuCateBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return getPage;
		}
		insuCateDao.insertCategory(insuCateBean);
		return gotoPage;
	}
}
