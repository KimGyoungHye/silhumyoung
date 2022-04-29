package insucate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import insucate.model.InsuCateBean;
import insucate.model.InsuCateDao;

@Controller
public class InsuCateListController {
	
	private final String command="list.ic";
	private String getPage="categoryList";
	
	@Autowired
	private InsuCateDao insuCateDao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		List<InsuCateBean> insuCateList=insuCateDao.getCategoryList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("insuCateList", insuCateList);
		mav.setViewName(getPage);
		return mav;
	}
}
