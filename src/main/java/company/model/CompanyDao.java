package company.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import company.model.CompanyBean;
import member.model.MemberBean;
import company.model.CompanyBean;

@Component("myCompany")
public class CompanyDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private String namespace="company.CompanyBean";

	public int insertCompany(CompanyBean bean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace+".InsertCompany", bean);
		return cnt;
	}
	
	public List<CompanyBean> getCompanyList() {
		List<CompanyBean> companyList = new ArrayList<CompanyBean>();
		companyList = sqlSessionTemplate.selectList(namespace+".GetAllCompanyList");
		return companyList;
	}

	public CompanyBean getCompanyInfo(String cname) {
		System.out.println("daoµµÂø");
		CompanyBean bean=null;
		bean=sqlSessionTemplate.selectOne(namespace+".CompanyInfo",cname);
		System.out.println("dao³¡");
		return bean;
	}
	public CompanyBean getCompanyInfo2(int cnum) {
		System.out.println("daoµµÂø");
		CompanyBean bean=null;
		bean=sqlSessionTemplate.selectOne(namespace+".CompanyInfo2",cnum);
		System.out.println("dao³¡");
		return bean;
	}

	public int updateCompany(CompanyBean bean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.update(namespace+".UpdateCompany",bean );
		return cnt;
	}

	public List<CompanyBean> companyList(Map<String, String> map) {
		List<CompanyBean> list=sqlSessionTemplate.selectList(namespace+".CompanyList",map);
		
		return list;
	}
	
	public String getCompanyList(int cregi_num) {
		String cname = sqlSessionTemplate.selectOne(namespace+".GetCompanyList", cregi_num);
		System.out.println("cregi_num:" + cregi_num);
		
		return cname;
	}

	public int updateCname(Map<String, String> map) {
		System.out.println("dao.updateCname µµÂø");
		int cnt=-1;
		System.out.println("map:"+map);
		cnt=sqlSessionTemplate.update(namespace+".UpdateCname",map);
		
		return cnt;
	}
	
	public MemberBean searchId(String id) {
		MemberBean sbean = sqlSessionTemplate.selectOne(namespace+".SearchId", id);
		return sbean;
	}

	public List<CompanyBean> getCnameCimage() {
		List<CompanyBean> clist=sqlSessionTemplate.selectList(namespace+".GetCnameCimage");
		
		return clist;
	}

	public int deleteCompany(int cnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace+".DeleteCompany",cnum);
		return cnt;
	}
	
	
}
