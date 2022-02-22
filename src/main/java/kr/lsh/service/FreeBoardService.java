package kr.lsh.service;

import java.util.List;

import kr.lsh.vo.FreeBoardVO;
import kr.lsh.vo.SearchCriteria;

public interface FreeBoardService {
	
	// 게시판 글 작성
	public void write(FreeBoardVO fboardVO) throws Exception;
	
	// 게시물 목록조회
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public FreeBoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(FreeBoardVO fboardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	

}