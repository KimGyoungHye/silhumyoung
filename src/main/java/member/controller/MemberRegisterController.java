package member.controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import utility.RegiNumberValid;

@Controller
public class MemberRegisterController {
	private final String command = "register.mem";
	private final String getPage = "memberRegisterForm";
	private String gotoPage="loginForm"; //성공하면,, 나중에 바꾸기
	@Autowired
	private MemberDao memberDao;
	
	// LoginForm.jsp에서 회원가입하기 클릭
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doAction() {

		return getPage;
	}

	// memberRegisterForm.jsp 추가하기 클릭
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("member") @Valid MemberBean member,BindingResult result) {
		System.out.println("핸드폰 번호 : "+member.getPhone1()+member.getPhone2()+member.getPhone3());
		System.out.println("멤버 : "+member.getId()+member.getName()+member.getPassword()+
				"reg"+member.getRegi_number1()+member.getRegi_number2()+"email"+member.getEmail1()+member.getEmail2());
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		 RegiNumberValid regiNumberValid = new RegiNumberValid();
	      if(!regiNumberValid.realRegiNumber(member.getRegi_number1(), member.getRegi_number2())) {
	         mav.addObject("realRegi","wrong");
	         mav.setViewName(getPage);
	         return mav;
	      }

		int cnt = memberDao.insertMember(member);
		
		mav.setViewName(gotoPage); 
		return mav;
	}
	
	@RequestMapping(value="/sendSms.mem",method=RequestMethod.POST)
	public void sendSms(HttpServletRequest request, PrintWriter out,HttpSession session) {
		int sms = (int)(Math.random()*111111)+10000000;
		session.setAttribute("sms", sms);
		String phone = request.getParameter("phone");
		System.out.print("phone : "+phone);
		
		String api_key = "NCSX7SSZNTNQI0ML";
	    String api_secret = "CDCVE6AGSSQOE1F7QPCIG6UYV6D7NBEJ";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    
	    params.put("to", phone);
	    params.put("from", "01062116935");
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 [ "+sms+" ] 입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version
	    out.println(sms);

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	      out.println("false");
	    }
	}
	
}