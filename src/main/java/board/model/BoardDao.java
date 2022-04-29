package board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.Paging;

@Component("boardDao")
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "board.BoardBean";

	public int getTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}

	public List<BoardBean> getBoardList(Map<String, String> map, Paging pageInfo) {
		//System.out.println("pageSize:"+pageInfo.getPageSize());
		//System.out.println("offset:"+pageInfo.getOffset());
		//System.out.println("offLimit:"+pageInfo.getLimit());
	
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<BoardBean> list=sqlSessionTemplate.selectList(namespace+".GetBoardList",map,rowBounds);
		return list;
	}

	public void updateReadcount(int bnum) {
		sqlSessionTemplate.update(namespace+".UpdateReadcount",bnum);
	}
	
	
	public BoardBean getArticle(int bnum) {
		BoardBean boardBean=sqlSessionTemplate.selectOne(namespace+".GetArticle",bnum);
		return boardBean;
	}

	public int updateArticle(BoardBean boardBean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.update(namespace+".UpdateArticle",boardBean);
		return cnt;
	}

	public int insertArticle(BoardBean boardBean) {
		int cnt=-1;
		cnt=sqlSessionTemplate.insert(namespace+".InsertArticle",boardBean);
		return cnt;
	}

	public int deleteArticle(int bnum) {
		int cnt=-1;
		cnt=sqlSessionTemplate.delete(namespace+".DeleteArticle",bnum);
		return cnt;
	}
	
}
