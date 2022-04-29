package qa_board.controller;

import java.io.File;
import java.io.IOException;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import company.model.CompanyDao;
import member.model.MemberBean;
import qa_board.model.QA_BoardBean;
import qa_board.model.QA_BoardDao;
import utility.Responsing;

@Controller
public class QA_BoardReplyController {
   private final String command = "/reply.qa";
   private String getPage = "replyForm";
   private String gotoPage = "redirect:list.qa";
   private String loginPage = "redirect:/login.mem";

   @Autowired
   QA_BoardDao qA_BoardDao;

   @Autowired
   CompanyDao companyDao;

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value=command,method = RequestMethod.GET)
   public String doAction(
                     @RequestParam("ref")String ref,
                     @RequestParam("re_step")String re_step,
                     @RequestParam("re_level")String re_level,
                     @RequestParam("no")String no,
                     @RequestParam("pageNumber") String pageNumber,
                     HttpServletRequest request) {

      request.setAttribute("ref", ref);
      request.setAttribute("re_step", re_step);
      request.setAttribute("re_level", re_level);
      request.setAttribute("pageNumber", pageNumber);

      
      QA_BoardBean qA_boardBean = qA_BoardDao.getArticle(no);
      request.setAttribute("company", qA_boardBean.getCompany());
      request.setAttribute("category", qA_boardBean.getCategory());
      request.setAttribute("writer", qA_boardBean.getWriter());

      return getPage;
   }

   @RequestMapping(value=command,method = RequestMethod.POST)
   public String doAction(
                     @Valid QA_BoardBean qA_BoardBean,
                     BindingResult result,
                     @RequestParam(value="pageNumber", required=false) String pageNumber,
                     HttpServletRequest request,
                     HttpSession session,
                     HttpServletResponse response) {

      MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
      if(loginInfo==null) {
         session.setAttribute("destination", gotoPage);
         return loginPage;
      }
      Responsing responsing = new Responsing(response);
      if(result.hasErrors()) {
         //System.out.println("오류나니");
         request.setAttribute("ref", qA_BoardBean.getRef());
         request.setAttribute("re_step", qA_BoardBean.getRe_step());
         request.setAttribute("re_level", qA_BoardBean.getRe_level());
         request.setAttribute("company", qA_BoardBean.getCompany());
         request.setAttribute("category", qA_BoardBean.getCategory());
         request.setAttribute("writer", qA_BoardBean.getWriter());
         request.setAttribute("pageNumber", pageNumber);
         return getPage;
      }

      String ip = request.getRemoteAddr();
      qA_BoardBean.setIp(ip);
      
      int cnt2 = qA_BoardDao.ReplyQA_Board(qA_BoardBean);
      
      String uploadPath = servletContext.getRealPath("/resources/qa_board/QA_BoardFiles");
      String image = qA_BoardBean.getImage();
      System.out.println("image:"+image);
      MultipartFile multi = qA_BoardBean.getUpload();
      
      if(cnt2>0) {
         if(!(image==null || image.equals(""))) {
            File file = new File(uploadPath+"\\"+image);
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
      }else {
         responsing.useAlert("게시물 작성을 실패하였습니다");
         responsing.useHistory(-1);
      }
      return null;
   }
}