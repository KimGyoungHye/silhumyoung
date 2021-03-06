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
      //한화 손보는 cinfo에서 무배당~은  insu에서 27은 loginInfo에서 추춮!!
      
      MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
      if(loginInfo==null) {
         session.setAttribute("destination", "redirect:/bohumChoochun.bh");
         return loginPage;
      }
      MemberDetailBean mDetailBean = memberDetailDao.getMemberDetail(loginInfo.getUserDetail());
      if(mDetailBean!=null) {
         session.setAttribute("myDetailNum", mDetailBean.getNum());
      }else {
         responsing.useAlert("유저 세부 정보를 등록해야 이용 가능합니다");
         responsing.useRedirect("myPage.mem");
      }
      //내 정보에서 뽑을 것 - age, gender-성별, 유병자인지 4대보험인지, 
      // 지금 내 디테일 정보에서 그그그그그그 뭐냐 지병
      // disease가 null이 아니면 유병자 보험 추천
      // 아니면 그냥 4세대 실손 의료 보험
      
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