package memberDetail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;

@Component("memberDetailDao")
public class MemberDetailDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "memberDetail.MemberDetailBean";
	
	public MemberDetailBean getMemberDetail(int num) {
		MemberDetailBean memberDetail = sqlSessionTemplate.selectOne(namespace+".GetMemberDetail",num);
		return memberDetail;
	}

	public int insertMemberDetail(MemberDetailBean memberDetailBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertMemberDetail",memberDetailBean);
		return cnt;
	}

	public int deleteMemberDetail(int num) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteMemberDetail",num);
		return cnt;
	}

	public int updateMemberDetail(MemberDetailBean memberDetailBean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.update(namespace+".UpdateMemberDetail",memberDetailBean);
		return cnt;
	}
}
