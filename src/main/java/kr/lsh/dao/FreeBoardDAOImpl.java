package kr.lsh.dao;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.lsh.vo.FreeBoardVO;
import kr.lsh.vo.SearchCriteria;

@Repository //저장소
public class FreeBoardDAOImpl implements FreeBoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(FreeBoardVO fboardVO) throws Exception {
		sqlSession.insert("freeboardMapper.insert",fboardVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("freeboardMapper.listPage", scri);
		// sqlsession: db에서 값을 조회하거나 변경
		// selectlist: list형식으로 가져오겠다
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("freeboardMapper.listCount", scri);
	}

	// 게시물 상세조회
	@Override
	public FreeBoardVO read(int bno) throws Exception {
		
		return sqlSession.selectOne("freeboardMapper.read",bno);
	}
	
	// 게시물 수정
	@Override
	public void update(FreeBoardVO fboardVO) throws Exception {
		
		sqlSession.update("freeboardMapper.update", fboardVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("freeboardMapper.delete", bno);
	}
	
	//게시판조회수
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("freeboardMapper.boardHit", bno);		
	}



}
