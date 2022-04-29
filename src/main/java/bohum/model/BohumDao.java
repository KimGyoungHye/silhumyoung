package bohum.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import insucate.model.InsuCateBean;
import utility.Paging;

@Component("mybohumDao")
public class BohumDao {
   private String namespace="bohum.model.BohumBean";
   @Autowired
   SqlSessionTemplate sqlSessionTemplate;
   
   public int insertBohum(BohumBean bbean) {
      int cnt = -1; 
      cnt = sqlSessionTemplate.insert(namespace+".Insert", bbean);
      return cnt;
   }
   public int insertBohum(BohumDataBean bean) {
      int cnt = -1;
      cnt = sqlSessionTemplate.insert(namespace+".InsertBohum", bean);
      return cnt;
   }
   public int getTotal(Map<String, String> map) {
      int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotal", map);
      return cnt;
   }
   public int getTotalCount() {
      int cnt = 0;
      try {
         cnt = sqlSessionTemplate.selectOne(namespace+".GetAllTotalCount");
      }catch (Exception e) {
      }
      return cnt;
   }

   public int getTotalCount(BohumUserBean bohumUserBean) {
      int cnt = 0;
      try {
         cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",bohumUserBean);
      }catch (Exception e) {
      }
      return cnt;
   }
   
   public int getTotalCount(Map<String, String> map) {
      int cnt = 0;
      try {
         cnt = sqlSessionTemplate.selectOne(namespace+".GetAllTotalCount",map);
      }catch (Exception e) {
         // TODO: handle exception
      }
      return cnt;
   }
   
   public List<BohumBean> getAllList(Map<String, String> map, Paging pageInfo) {
      RowBounds rowBound = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      List<BohumBean> lists = sqlSessionTemplate.selectList(namespace+".GetAll",map,rowBound);
      return lists;
   }

   public List<InsuCateBean> getCategory() {
      List<InsuCateBean> icate = sqlSessionTemplate.selectList(namespace+".GetCategory");
      return icate;
   }
   public List<BohumDataBean> selectMyChoochunBohum(Paging pageInfo,Map<String, String> map) {
      List<BohumDataBean> boteArr = new ArrayList<BohumDataBean>();
      RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      try {      
         boteArr = sqlSessionTemplate.selectList(namespace+".GetAllBoteArr",map,rowBounds);
      }catch (Exception e) {
         // TODO: handle exception
      }   
      return boteArr;
   }
   
   public List<BohumDataBean> selectMyChoochunBohum(BohumUserBean bohumUserBean, Paging pageInfo) {
      List<BohumDataBean> boteArr = new ArrayList<BohumDataBean>();
      RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      try {      
         boteArr = sqlSessionTemplate.selectList(namespace+".GetBoteArr",bohumUserBean,rowBounds);
      }catch (Exception e) {
         // TODO: handle exception
      }   
      return boteArr;
   }
   
   public int deleteBohum(int insu) {
      System.out.println("dao.insu:"+insu);
      int cnt=-1;
      cnt=sqlSessionTemplate.delete(namespace+".DeleteBohum",insu);
      
      return cnt;
   }
   public BohumBean getBohum(int insu) {
      
      BohumBean bean=null;
      bean=sqlSessionTemplate.selectOne(namespace+".getInsu",insu);
      
      return bean;
   }
   public int updateBohum(BohumBean bean) {
      int cnt=-1;
      cnt=sqlSessionTemplate.update(namespace+".UpdateInsu",bean);
      
      return cnt;
   }
   public List<BohumDataBean> selectBohumDetail(BohumDataBean bohumTestBean) {
      List<BohumDataBean> bohumDataDetailInfoArr = new ArrayList<BohumDataBean>();
      bohumDataDetailInfoArr = sqlSessionTemplate.selectList(namespace+".GetBohumDataDetailInfo",bohumTestBean);
      return bohumDataDetailInfoArr;
   }
   
   public int deleteTrashData() {
      int cnt = sqlSessionTemplate.delete(namespace+".deleteBohum0");
      System.out.println("deleteTrashData"+cnt);
      cnt+= sqlSessionTemplate.delete(namespace+".deleteBohumNull");
      return cnt;
   }
   public int getInsuTotal2(Map<String, String> map) {
         int cnt = sqlSessionTemplate.selectOne(namespace+".GetInsuTotal", map);
      return cnt;
   }
   public List<BohumDataBean> getAvgByAge(int age) {
      List<BohumDataBean> avgByAgeArr = new ArrayList<BohumDataBean>();
      avgByAgeArr = sqlSessionTemplate.selectList(namespace+".GetAvgByAge",age);
      return avgByAgeArr;
   }
   
   public List<BohumBean> getAllListCompany(Map<String, String> map, Paging pageInfo) {
      RowBounds rowBound = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
      List<BohumBean> getlist = sqlSessionTemplate.selectList(namespace+".GetAllListCompany",map,rowBound);
      return getlist;
   }
}