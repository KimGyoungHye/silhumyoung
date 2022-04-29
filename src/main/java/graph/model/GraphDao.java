package graph.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("graphDao")
public class GraphDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace = "graph.GraphBean";

	public List<GraphBean> getGraphDataAgeNBohum() {
		List<GraphBean> graphDataAgeNBohum = new ArrayList<GraphBean>();
		graphDataAgeNBohum = sqlSessionTemplate.selectList(namespace+".GetGraphDataAgeNBohum");

		System.out.println("DAO : graphDataAgeNBohum.size()"+graphDataAgeNBohum.size());
		return graphDataAgeNBohum;
	}
	public List<GraphBean> getGraphDataMogNBohum() {
		List<GraphBean> graphDataAgeNBohum = new ArrayList<GraphBean>();
		graphDataAgeNBohum = sqlSessionTemplate.selectList(namespace+".GetGraphDataMogNBohum");

		System.out.println("DAO : graphDataAgeNBohum.size()"+graphDataAgeNBohum.size());
		return graphDataAgeNBohum;
	}
	public List<GraphBean> getGraphDataInsunameNHeart() {
		List<GraphBean> graphDataAgeNBohum = new ArrayList<GraphBean>();
		graphDataAgeNBohum = sqlSessionTemplate.selectList(namespace+".GetGraphDataInsunameNHeart");

		System.out.println("DAO : graphDataAgeNBohum.size()"+graphDataAgeNBohum.size());
		return graphDataAgeNBohum;
	}
	public List<GraphBean> getGraphDataGender() {
		List<GraphBean> genderList = new ArrayList<GraphBean>();
		String[] genderArr = {"남자","여자"};
		for(int i=0;i<genderArr.length;i++) {
			String gender = genderArr[i];
			System.out.println("gender"+gender);
			GraphBean graphDataGender = new GraphBean();
			graphDataGender.setX(gender);
			graphDataGender = sqlSessionTemplate.selectOne(namespace+".GetGraphDataGender",graphDataGender);
			graphDataGender.setX(gender);
			genderList.add(graphDataGender);
		}
		System.out.println("genderList"+genderList.size());
		return genderList;
	}
	public List<GraphBean> getGraphDataCompanyNInsu() {
			List<GraphBean> graphDataCompanyNInsu = new ArrayList<GraphBean>();
			graphDataCompanyNInsu = sqlSessionTemplate.selectList(namespace+".GetGraphDataCompanyNInsu");

			System.out.println("DAO : graphDataCompanyNInsu.size()"+graphDataCompanyNInsu.size());
			return graphDataCompanyNInsu;
		}
	public List<GraphBean> getGraphDataCategoryNInsu() {
		List<GraphBean> graphDataCategoryNInsu = new ArrayList<GraphBean>();
		graphDataCategoryNInsu = sqlSessionTemplate.selectList(namespace+".GetGraphDataCategoryNInsu");

		System.out.println("DAO : graphDataCompanyNInsu.size()"+graphDataCategoryNInsu.size());
		return graphDataCategoryNInsu;
	}
}
