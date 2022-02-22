package kr.lsh.dao;

import java.util.List;

import kr.lsh.vo.QnaBoardVO;
import kr.lsh.vo.SearchCriteria;

public interface QnaBoardDAO {
	
	// 게시판 글 작성
	public void write(QnaBoardVO qnaboardVO) throws Exception;
	
	// 게시물 목록조회
	public List<QnaBoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public QnaBoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(QnaBoardVO qnaboardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	//게시판 조회수
	public void boardHit(int bno) throws Exception;
}