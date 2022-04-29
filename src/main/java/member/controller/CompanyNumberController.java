package member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.CompanyNumberBean;
import member.model.MemberDao;
import utility.Responsing;

@Controller
public class CompanyNumberController {
	private final String command="/companyNumber01.mem";
	private String gotoPage= "companyRegisterForm2";
	@Autowired
	private MemberDao memberDao;
	Map<String, Object> map;
	
	// 사업자 등록번호 조회 클릭
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction(
			@RequestParam(value="b_no") String b_no, 
			@RequestParam(value="b_name") String b_name, 
			@RequestParam(value="start_dt") String start_dt, 
			HttpServletRequest request) {
		
		System.out.println("b_no"+b_no);
		System.out.println("b_name"+b_name);
		System.out.println("start_dt"+start_dt);
		
		JSONObject jb = new JSONObject();
		/*
		 * jb.put("사업자 번호", regi); jb.put("대표자 성명", cn); jb.put("개업일자", st);
		 */
		

		return gotoPage;
	}

}
