package bohum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bohum.model.BohumDao;

@Controller
public class BohumDeleteController {

	private final String command="bohumDelete.bh";
	private String getPage="redirect:/list.bh";
	
	@Autowired
	private BohumDao bdao;
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam("insu") int insu) {
		
		System.out.println("insu:"+insu);
		
		int cnt=bdao.deleteBohum(insu);

		return getPage;
	}
}
