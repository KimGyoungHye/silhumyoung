package insucate.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import insucate.model.InsuCateDao;
import utility.Responsing;

@Controller
public class InsuCateDeleteController {
	
	private final String command="/delete.ic";
	
	@Autowired
	private InsuCateDao insuCateDao;
	
	@RequestMapping(command)
	public void doAction(@RequestParam("num") int num, HttpServletResponse response) {
		int cnt=insuCateDao.deleteCategory(num);
		Responsing responsing=new Responsing(response);
		if(cnt>0) {
			responsing.useAlert("카테고리를 삭제하였습니다.");
			responsing.useRedirect("list.ic");
		}
		else {
			responsing.useAlert("카테고리 삭제를 실패하였습니다.");
			responsing.useRedirect("list.ic");
		}
	}
}
