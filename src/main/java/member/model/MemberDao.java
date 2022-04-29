package member.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyMember")
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "member.model.Member";

	
	public int insertMember(MemberBean member) {
		int cnt=-1;
		cnt=sqlSessionTemplate.insert(namespace+".InsertMember",member);
		System.out.println("insertDao cnt:" + cnt);
		return cnt;
	}
	public int insertCMember(MemberBean member) {
		int cnt=-1;
		cnt=sqlSessionTemplate.insert(namespace+".InsertCMember",member);
		System.out.println("insertDao cnt:" + cnt);
		return cnt;
	}
	//로그인시 가입된 id인지 확인 
	public MemberBean searchId(String id) {
		MemberBean sbean = sqlSessionTemplate.selectOne(namespace+".SearchId", id);
		return sbean;
	}
	
	//이름,주민번호로 id찾기
	public String getIdByNameRrn(MemberBean member) {
		String id = sqlSessionTemplate.selectOne(namespace+".GetIdByName", member);
		System.out.println("ID:"+id);
		return id;
	}
	//pw 찾기
	public String getPwByIdNameRrn(MemberBean member,HttpServletResponse response) throws IOException {
		String email1="", email2="", pw="", msg="";
		
		List<MemberBean> mem = sqlSessionTemplate.selectList(namespace+".GetPwById", member);
		for(MemberBean m : mem) {
			email1 = m.getEmail1();
			email2 = m.getEmail2();
		}
		member.setEmail1(email1);
		member.setEmail2(email2);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(mem.size() == 0) {
			out.println("<script>alert('회원 정보를 찾을 수 없음.(미등록 회원)'); location.href='findpw.mem';</script>");
			out.close();
		}
		else { //가입된 회원이면 임시 비번을 발급
			for(int i = 0; i<10; i++) {
				pw += (char)((Math.random() * 48)+58);
			}
		member.setPassword(pw);
		updatePw(member);
		sendEmail(member, "findpw");

		out.print("<script>alert('네이버 메일로 임시 비밀번호를 발송하였습니다.'); location.href='loginForm.mem';</script>");
		out.flush();
		}
		return pw;
	}
	
	//비밀번호 찾기 이메일 발송
	public void sendEmail(MemberBean bean, String div) {
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //gmail 이용시 smtp.gmail.com
		String hostSMTPid = "ay98923@naver.com";
		String hostSMTPpwd = "Star1220^^";
		
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "ay98923@naver.com";
		String fromName = "select your 보험 관리자";
		String subject = "", msg = "";
		
		if(div.equals("findpw")) {
			subject = "select your 보험 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += bean.getName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += bean.getPassword() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = bean.getEmail1()+"@"+bean.getEmail2();
		System.out.println("mail"+mail);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	//db에 임시비번으로 수정
	public void updatePw(MemberBean member) {
		sqlSessionTemplate.update(namespace+".updatePw", member);
	}
	
	//ID 중복체크 
	public int idCheck(String userid) {
		int cnt = -1;
		System.out.println("idCheck:" + userid);
		cnt = sqlSessionTemplate.selectOne(namespace+".IdCheck", userid);
		return cnt;
	}
	
	public int totalCount(Map<String,String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		System.out.println("totalCount:" + cnt);
		return cnt;
	}
	
	public List<MemberBean> memberList(Paging pageInfo,Map<String,String> map) {
		List<MemberBean> list = new ArrayList<MemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		return list;
	}

	public MemberBean getMember(String id) {
		MemberBean bean = sqlSessionTemplate.selectOne(namespace+".GetMember",id);
		
		return bean;
	}

	public int updateMember(MemberBean member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UpdateMember", member);
		System.out.println("updateXml:" + cnt);
		return cnt;
	}
	
	public int deleteMember(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".DeleteMember", id);
		System.out.println("deletexml cnt:" + cnt);
		return cnt;
	}

	public MemberBean getMemberKakao(MemberBean memberBean) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+".GetMemberKakao",memberBean);
		return member;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}
	  
	public List<MemberBean> getMemberList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<MemberBean> memberList = sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		return memberList;
	}
	
	public int userStateUpdate(MemberBean memberBean) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace+".UserStateUpdate",memberBean);
		return cnt;
	}
	
}
