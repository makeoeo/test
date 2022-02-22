package kr.lsh.dao;

import java.util.List;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kr.lsh.vo.QnaBoardVO;
import kr.lsh.vo.SearchCriteria;

@Repository //저장소
public class QnaBoardDAOImpl implements QnaBoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(QnaBoardVO qnaboardVO) throws Exception {
		sqlSession.insert("qnaboardMapper.insert",qnaboardVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<QnaBoardVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("qnaboardMapper.listPage", scri);
		// sqlsession: db에서 값을 조회하거나 변경
		// selectlist: list형식으로 가져오겠다
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("qnaboardMapper.listCount", scri);
	}

	// 게시물 상세조회
	@Override
	public QnaBoardVO read(int bno) throws Exception {
		
		return sqlSession.selectOne("qnaboardMapper.read",bno);
	}
	
	// 게시물 수정
	@Override
	public void update(QnaBoardVO qnaboardVO) throws Exception {
		
		sqlSession.update("qnaboardMapper.update", qnaboardVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("qnaboardMapper.delete", bno);
	}
	
	//게시판조회수
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("qnaboardMapper.boardHit", bno);		
	}



}
