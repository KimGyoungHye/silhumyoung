package qa_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import company.model.CompanyBean;
import company.model.CompanyDao;
import member.model.MemberBean;
import qa_board.model.QA_BoardBean;
import qa_board.model.QA_BoardDao;
import utility.Responsing;

@Controller
public class QA_BoardInsertController {
   private final String command = "/insert.qa";
   private String getPage = "insertForm";
   private String loginPage = "redirect:/login.mem";

   @Autowired
   QA_BoardDao qA_BoardDao;

   @Autowired
   CompanyDao companyDao;

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value=command,method = RequestMethod.GET)
   public String doAction(HttpServletRequest request) {
      getLists(request);
      return getPage;
   }

   @RequestMapping(value=command,method = RequestMethod.POST)
   public String doAction(
                     @Valid QA_BoardBean qA_BoardBean,
                     BindingResult result,
                     HttpServletRequest request,
                     HttpSession session,
                     HttpServletResponse response) {

      System.out.println(qA_BoardBean.getPassword());
      MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
      if(loginInfo==null) {
         session.setAttribute("destination", "redirect:/insert.qa");
         return loginPage;
      }
      getLists(request); //회사 목록

      if(result.hasErrors()) {
         return getPage;
      }
      String ip = request.getRemoteAddr();
      qA_BoardBean.setIp(ip);
      
      String image = qA_BoardBean.getImage();
      System.out.println("image:"+image+"/");
      int cnt = qA_BoardDao.insertQA_Board(qA_BoardBean);
      
      String uploadPath = servletContext.getRealPath("/resources/qa_board/QA_BoardFiles"); //파일 업로드 경로
      MultipartFile multi = qA_BoardBean.getUpload();

      Responsing responsing = new Responsing(response);

      if(cnt>0) {
         if(!(image==null || image.equals(""))) {
            File file=new File(uploadPath+"\\"+image);
            try {
               multi.transferTo(file);
            } catch (IllegalStateException e) {
               e.printStackTrace();
            } catch (IOException e) {
               e.printStackTrace();
            }
         }
         responsing.useAlert("게시물을 작성하였습니다");
         responsing.useRedirect("list.qa");
      }//바깥 if
      else {
         responsing.useAlert("게시물 작성을 실패하였습니다");
         responsing.useHistory(-1);
      }
      return null;
   }//doAction

   public void getLists(HttpServletRequest request) {
      List<CompanyBean> companyList = new ArrayList<CompanyBean>();
      companyList = companyDao.getCompanyList();
      request.setAttribute("companyList", companyList);
   }
}