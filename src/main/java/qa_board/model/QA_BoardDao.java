package qa_board.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging2;

@Component("qandADao")
public class QA_BoardDao {
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;

   private String namespace = "qa_board.QA_BoardBean";

   public int getTotalCount(QA_UserStateAndCategory uac) {
      int cnt = -1;
      cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",uac);
      return cnt;
   }

   public List<QA_BoardBean> getQandAList(QA_UserStateAndCategory uac, Paging2 pageInfo) {
      List<QA_BoardBean> boardList = new ArrayList<QA_BoardBean>();
      System.out.println("pageInfo.getOffset():"+pageInfo.getOffset());
      System.out.println("pageInfo.getLimit():"+pageInfo.getLimit());
      RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      boardList = sqlSessionTemplate.selectList(namespace+".GetQA_BoardList",uac,rowBounds);
      return boardList;
   }

   public int updateQA_BoardCount(String no) {
      int cnt = -1;
      cnt = sqlSessionTemplate.update(namespace+".UpdateQA_BoardCount",no);
      return cnt;
   }

   public QA_BoardBean getArticle(String no) {
      QA_BoardBean qA_BoardBean = new QA_BoardBean();
      qA_BoardBean = sqlSessionTemplate.selectOne(namespace+".GetArticle",no);
      return qA_BoardBean;
   }

   public List<String> getCategoryList() {
      List<String> categoryList = new ArrayList<String>();
      categoryList = sqlSessionTemplate.selectList(namespace+".GetCategoryList");
      return categoryList;
   }

   public int insertQA_Board(QA_BoardBean qA_BoardBean) {
      int cnt = -1;
      cnt = sqlSessionTemplate.insert(namespace+".InsertQA_Board",qA_BoardBean);
      return cnt;
   }

   public int updateBoard(QA_BoardBean qA_BoardBean) {
      int cnt = -1;
      cnt = sqlSessionTemplate.update(namespace+".UpdateQA_Board",qA_BoardBean);
      return cnt;
   }

   public int ReplyQA_Board(QA_BoardBean qA_BoardBean) {
      int cnt1, cnt2 = -1;
      cnt1 = sqlSessionTemplate.update(namespace+".ReplyQA_Board1",qA_BoardBean);
      System.out.println("cnt1:"+cnt1);
      if(cnt1>=0) {
         cnt2 = sqlSessionTemplate.insert(namespace+".ReplyQA_Board2",qA_BoardBean);
      }
      return cnt2;
   }

   public int deleteQA_board(QA_BoardBean qA_BoardBean) {
      int cnt = -1;
      cnt = sqlSessionTemplate.delete(namespace+".DeleteQA_Board",qA_BoardBean);
      return cnt;
   }

}
