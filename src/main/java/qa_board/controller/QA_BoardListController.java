package qa_board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import qa_board.model.QA_BoardBean;
import qa_board.model.QA_BoardDao;
import qa_board.model.QA_UserStateAndCategory;
import utility.Paging2;
import utility.UserKindClassify;

@Controller
public class QA_BoardListController {
   private final String command = "/list.qa";
   private String getPage = "boardList";
   
   @Autowired
   QA_BoardDao qandADao;
   
   @RequestMapping(value=command, method=RequestMethod.GET)
   public String doAction(
                     @RequestParam(value="pageNumber",required = false) String pageNumber,
                     @RequestParam(value="category",required = false) String category,
                     HttpServletRequest request,
                     HttpServletResponse response,
                     HttpSession session) {

      UserKindClassify classify = new UserKindClassify();
      MemberBean loginInfo = classify.areYouLogin(session, response, "list.qa");
      String userState=loginInfo.getUserState();
      String id=loginInfo.getId();
      String company=loginInfo.getCname();
      System.out.println("category:"+category);
      System.out.println("userState:"+userState);
      System.out.println("id:"+id);
      System.out.println("company:"+company);
      QA_UserStateAndCategory uac=new QA_UserStateAndCategory(userState, id, company, category);
      
      int totalCount = qandADao.getTotalCount(uac); //레코드갯수
      System.out.println("totalCount:"+totalCount);
      
      String url = request.getContextPath()+command;
      System.out.println("url:" + url);
      
      Paging2 pageInfo = new Paging2(pageNumber, "5", totalCount, url, category); //페이지넘버, 페이지사이즈, 토탈카운트, url, 왓컬럼, 키워드
      System.out.println("offset:" + pageInfo.getOffset());
      System.out.println("limit:" + pageInfo.getLimit());

      List<QA_BoardBean> boardList = qandADao.getQandAList(uac,pageInfo);
      
      System.out.println("boardList.size()"+boardList.size());
      
      int currentPage = 1;
         if(pageNumber!=null)currentPage = Integer.parseInt(pageNumber);
         int number = totalCount - (currentPage-1) * 5; 
         request.setAttribute("number", number);
      request.setAttribute("totalCount", totalCount);
      request.setAttribute("pageInfo", pageInfo);
      request.setAttribute("boardList", boardList);
      request.setAttribute("category", category);
      
      return getPage;
   }

}