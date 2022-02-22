package kr.lsh.dao;

import java.util.List;

import kr.lsh.vo.FreeBoardReplyVO;

public interface FreeBoardReplyDAO {
	
	//댓글조회
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception;
	
	//댓글작성
	public void writdReply(FreeBoardReplyVO vo) throws Exception;
	
	//댓글수정
	public void updateReply(FreeBoardReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(FreeBoardReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public FreeBoardReplyVO selectReply(int rno) throws Exception;
}
