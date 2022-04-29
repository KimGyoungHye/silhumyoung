package heart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bohum.model.BohumBean;

@Component("heartDao")
public class HeartDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="heart.HeartBean";

	public void insertHeart(HeartBean heartBean) {
		sqlSessionTemplate.insert(namespace+".InsertHeart",heartBean);
	}

	public void deleteHeart(HeartBean heartBean) {
		System.out.println("heartBean.getMid():"+heartBean.getMid());
		System.out.println("heartBean.getInsu_num():"+heartBean.getInsu_num());
		sqlSessionTemplate.delete(namespace+".DeleteHeart",heartBean);
	}

	public List<BohumBean> getHeartList(String mid) {
		List<BohumBean> heartList=sqlSessionTemplate.selectList(namespace+".GetHeartList",mid);
		return heartList;
	}
}
