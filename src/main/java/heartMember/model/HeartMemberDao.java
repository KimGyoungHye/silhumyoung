package heartMember.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import graph.model.GraphBean;

@Component("heartMemberDao")
public class HeartMemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="heartMember.heartMemberBean";

	public List<HeartMemberBean> getHeartMemberList(String cname) {
		List<HeartMemberBean> heartMemberList=sqlSessionTemplate.selectList(namespace+".GetHeartMemberList", cname);
		return heartMemberList;
	}
	
	public List<GraphBean> getGraphDateCom(String insucompany){
		List<GraphBean> getGraphDateCom = sqlSessionTemplate.selectList(namespace+".GetGraphDateCom",insucompany);
		return getGraphDateCom;
	}

	public List<HeartMemberBean> getInsuName(String loginComMem) {
		List<HeartMemberBean> heartInsu = sqlSessionTemplate.selectList(namespace+".GetInsuName", loginComMem);
		return heartInsu;
	}
	
	public List<GraphBean> getInsuPerson(String loginComMem){
		List<GraphBean> heartPerson = sqlSessionTemplate.selectList(namespace+".GetInsuPerson", loginComMem);
		return heartPerson;
	}
}
