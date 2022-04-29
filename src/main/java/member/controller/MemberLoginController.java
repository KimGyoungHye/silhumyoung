package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/loginForm.mem";
	private String getPage = "loginForm";
	private String gotoPage1 = "redirect:/insuInfo.lm";
	private String gotoPage2 = "redirect:/main.ha";
	private String gotoPage3 = "companyLoginForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	//loginForm.jsp에서 로그인시
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doAction(MemberBean bean, HttpServletResponse response, HttpSession session) {

		response.setContentType("text/html; charset=UTF-8");

		//id와 pw넘어오는걸 bean 으로 묶어줌
		System.out.println(bean.getId());
		System.out.println(bean.getPassword());

		MemberBean sbean = memberDao.searchId(bean.getId()); 
		System.out.println("sbean:" + sbean); //null or 주소
		PrintWriter pw = null;
		if(sbean == null) { //찾는 id 없다
			//해당 id존재하지 않습니다.
			try {
				pw = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace(); 
			}
			pw.println("<script> alert('해당 아이디가 존재하지 않습니다')</script>");
			pw.flush();
			
			return getPage;

		}//if
		else { //id가 존재하면 
	         if(!sbean.getUserState().equals("회사")) { //회사가 아니라면 
	            if(sbean.getPassword().equals(bean.getPassword())) { //비번 일치
	               session.setAttribute("loginInfo", sbean); 
	               //sbean에는 id에 해당하는 사람의 정보가 있다. 그거를 loginInfo로 세션설정하겠다.
	            
	               //String destination = (String)session.getAttribute("destination"); 
	               if(sbean.getUserState().equals("일반")) {
	                  return gotoPage1; //redirect:/main.mem
	            
	               }
	               else if(sbean.getUserState().equals("관리자")) { // 수정 필요
	                  return gotoPage2; //redirect:/main.ha
	               }
	            }//if
	            else {//비번 불일치
	               try {
	                  pw = response.getWriter();
	               } catch (IOException e) {
	                  e.printStackTrace();
	               }
	               pw.println("<script> alert('비번이 잘못되었습니다.')</script>");
	               pw.flush();
	               return getPage; //loginForm
	            }
	         }else {
	            try {
	               pw = response.getWriter();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	            pw.println("<script> alert('해당 아이디는 보험사 로그인 페이지에서 가능합니다.')</script>");
	            pw.println("<script> alert('보험사 로그인 페이지로 이동합니다.')</script>");
	            pw.flush();
	            return gotoPage3;  //companyLoginForm 보험사 로그인 페이지로 이동
	         }
	      }
	      return getPage; //loginForm

	   }
}
