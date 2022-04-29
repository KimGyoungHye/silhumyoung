package qa_board.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import qa_board.model.QA_BoardBean;
import qa_board.model.QA_BoardDao;
import utility.Responsing;

@Controller
public class QA_BoardDeleteController {
   private final String command = "/delete.qa";
   private String getPage = "deleteForm";

   @Autowired
   QA_BoardDao qA_BoardDao;
   
   @Autowired
   ServletContext servletContext;

   @RequestMapping(value=command,method = RequestMethod.GET)
   public String doAction(
         @RequestParam("no")String no,
         @RequestParam("pageNumber")String pageNumber,
         @RequestParam(value="image", required=false)String image,
         HttpServletRequest request) {
      
      System.out.println("image:"+image);
      request.setAttribute("no", no);
      request.setAttribute("pageNumber", pageNumber);
      request.setAttribute("image", image);
      return getPage;
   }

   @RequestMapping(value=command,method = RequestMethod.POST)
   public void doAction(
                  QA_BoardBean boardBean,
                  @RequestParam("pageNumber") int pageNumber,
                  @RequestParam("image") String image,
                  HttpServletResponse response) {


      QA_BoardBean qa_bb=qA_BoardDao.getArticle(String.valueOf(boardBean.getNo()));
      
      Responsing responsing = new Responsing(response);
      if(qa_bb.getPassword().equals(boardBean.getPassword())) { 
         int cnt = qA_BoardDao.deleteQA_board(boardBean);
         
         String uploadPath = servletContext.getRealPath("/resources/qa_board/QA_BoardFiles");
         if(cnt>0) {
            if(image!=null) {
               File file=new File(uploadPath+"\\"+image);
               file.delete();
            }
            responsing.useAlert("게시물을 삭제하였습니다");
            responsing.useRedirect("list.qa");
         }else {
            responsing.useAlert("게시물 삭제를 실패하였습니다");
            responsing.useHistory(-1);
         }
      }
      else { 
         responsing.useAlert("비밀번호가 일치하지 않습니다");
         responsing.useHistory(-1);
      }//else
   }
}