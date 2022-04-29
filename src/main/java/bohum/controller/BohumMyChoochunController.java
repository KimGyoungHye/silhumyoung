package bohum.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bohum.model.BohumDao;
import bohum.model.BohumDataBean;
import bohum.model.BohumDetail;
import bohum.model.BohumDetailBean;
import bohum.model.BohumUserBean;
import company.model.CompanyBean;
import company.model.CompanyDao;
import member.model.MemberBean;
import memberDetail.model.MemberDetailBean;
import memberDetail.model.MemberDetailDao;
import utility.AgeAndGender;
import utility.Paging;
import utility.Responsing;


@Controller
public class BohumMyChoochunController {
   private final String command = "/bohumChoochun.bh";
   private String getPage = "/bohumChoochun";
   private String loginPage = "redirect:/loginForm.mem";

   @Autowired
   BohumDao bohumDao;
   
   @Autowired
   MemberDetailDao memberDetailDao;
   
//   @Autowired
//   CompanyDao companyDao;
   
   @RequestMapping(value=command)
   public String doAction(
         @RequestParam(value="whatColumn",required = false) String whatColumn,
         @RequestParam(value="keyword",required = false) String keyword,
         @RequestParam(value="pageNumber",required = false) String pageNumber,
         
         HttpServletRequest request,
         HttpServletResponse response,
         HttpSession session) {
      
      Responsing responsing = new Responsing(response);
      BohumDetail bohumDetail = new BohumDetail();
      List<BohumDataBean> bohumTestInfoArr = new ArrayList<BohumDataBean>();
      //ÇÑÈ­ ¼Õº¸´Â cinfo¿¡¼­ ¹«¹è´ç~Àº  insu¿¡¼­ 27Àº loginInfo¿¡¼­ Ãß­‹!!
      
      MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
      if(loginInfo==null) {
         session.setAttribute("destination", "redirect:/bohumChoochun.bh");
         return loginPage;
      }
      MemberDetailBean mDetailBean = memberDetailDao.getMemberDetail(loginInfo.getUserDetail());
      if(mDetailBean!=null) {
         session.setAttribute("myDetailNum", mDetailBean.getNum());
      }else {
         responsing.useAlert("À¯Àú ¼¼ºÎ Á¤º¸¸¦ µî·ÏÇØ¾ß ÀÌ¿ë °¡´ÉÇÕ´Ï´Ù");
         responsing.useRedirect("myPage.mem");
      }
      //³» Á¤º¸¿¡¼­ »ÌÀ» °Í - age, gender-¼ºº°, À¯º´ÀÚÀÎÁö 4´ëº¸ÇèÀÎÁö, 
      // Áö±Ý ³» µðÅ×ÀÏ Á¤º¸¿¡¼­ ±×±×±×±×±×±× ¹¹³Ä Áöº´
      // disease°¡ nullÀÌ ¾Æ´Ï¸é À¯º´ÀÚ º¸Çè ÃßÃµ
      // ¾Æ´Ï¸é ±×³É 4¼¼´ë ½Ç¼Õ ÀÇ·á º¸Çè
      
      int age = (int) Math.floor((mDetailBean.getAge()/10)*10);
      System.out.println("age : "+age);
      String gender = mDetailBean.getGender();
      String disease = mDetailBean.getDisease();
      int salary = mDetailBean.getSalary();
      
      //List<CompanyBean> companyList = companyDao.getCompanyList();
      
      if(whatColumn==null)whatColumn="";
      if(keyword==null)keyword="";         
      BohumUserBean bohumUserBean = new BohumUserBean(age, gender, disease, salary, whatColumn,"%"+keyword.toUpperCase()+"%");
      //BohumUserBean bohumUserBean = new BohumUserBean(age, gender, disease, salary, whatColumn,"%"+keyword.toUpperCase()+"%",companyList);
      
      System.out.println("bohumUserBean.age : "+bohumUserBean.getAge());
      //
      int totalCount = bohumDao.getTotalCount(bohumUserBean);
      
      String url = request.getContextPath()+command;
      Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);

      bohumTestInfoArr = bohumDao.selectMyChoochunBohum(bohumUserBean,pageInfo);
      
      System.out.println("totalCount : "+totalCount);
      System.out.println("bohumTestInfoArr : "+bohumTestInfoArr.size());
      
      request.setAttribute("bohumUserBean",bohumUserBean);
      request.setAttribute("bohumTestInfoArr",bohumTestInfoArr);
      request.setAttribute("pageInfo",pageInfo);
      
      AgeAndGender ageAndGender=new AgeAndGender();
      int memberAge=ageAndGender.calculateAge(loginInfo);
      String memberGender=ageAndGender.whatIsGender(loginInfo);

      session.setAttribute("memberAge", memberAge);
      session.setAttribute("memberGender", memberGender);
      
      return getPage;
   
   }
}