package insucate.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myInsuCateDao")
public class InsuCateDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="insucate.InsuCateBean";

	public void insertCategory(InsuCateBean insuCateBean) {
		sqlSessionTemplate.insert(namespace+".InsertCategory",insuCateBean);
	}

	public List<InsuCateBean> getCategoryList() {
		List<InsuCateBean> insuCateList=sqlSessionTemplate.selectList(namespace+".GetCategoryList");
		return insuCateList;
	}

	public InsuCateBean getCategory(int num) {
		InsuCateBean insuCateBean=sqlSessionTemplate.selectOne(namespace+".GetCategory",num);
		return insuCateBean;
	}

	public int updateCategory(InsuCateBean insuCateBean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.update(namespace+".UpdateCategory",insuCateBean);
		return cnt;
	}

	public int deleteCategory(int num) {
		int cnt=-1;
		cnt=sqlSessionTemplate.delete(namespace+".DeleteCategory",num);
		return cnt;
	}
	
}
