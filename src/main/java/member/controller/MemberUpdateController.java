package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import company.model.CompanyBean;
import member.model.MemberBean;
import member.model.MemberDao;
import memberDetail.model.MemberDetailBean;
import utility.Responsing;

@Controller
public class MemberUpdateController {
   private final String command = "/memberUpdateForm.mem";
   private String getPage = "/memberUpdateForm";
   private String gotoPage = "redirect:/myPage.mem";
   private String loginPage = "redirect:/login.mem";
   
   @Autowired
   private MemberDao memberDao;
   
   @RequestMapping(value=command,method = RequestMethod.GET)
   public String doAction(
         HttpSession session,
         HttpServletRequest request) {
      
      MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

      if(loginInfo==null) {
         session.setAttribute("destination", "redirect:../myPage.mem");
         return loginPage; 
      }
         MemberBean bean = memberDao.getMember(loginInfo.getId());
         System.out.println("bean3"+bean);
         request.setAttribute("MemberBean", bean);
         System.out.println("bean4"+bean);
         
         return getPage; 
      
   }
   
   //submit클릭 시
   @RequestMapping(value=command,method=RequestMethod.POST)
   public String doAction(
         MemberBean bean, 
         HttpSession session,
         BindingResult result,
         HttpServletResponse response) {
      
      System.out.println("update4");
      
      if(result.hasErrors()) {
         System.out.println("update5");
         return getPage;
      }
      int cnt=-1;
      System.out.println("update cnt1:" + cnt);
       cnt= memberDao.updateMember(bean);
      System.out.println("update cnt2:" + cnt);
      
      Responsing responsing = new Responsing(response);
		if(cnt>=0) { 
			responsing.useAlert("수정 성공했습니다");
			responsing.useRedirect("myPage.mem");
			}else {
				responsing.useAlert("수정 실패했습니다");
				responsing.useHistory(-1);
			}
         return getPage;
      
   }
}