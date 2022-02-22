package kr.lsh.service;

import java.util.List;

import kr.lsh.vo.QnaBoardReplyVO;

public interface QnaBoardReplyService {
	
	//댓글조회
	public List<QnaBoardReplyVO> readReply(int bno) throws Exception;
	
	//댓글작성
	public void writeReply(QnaBoardReplyVO vo) throws Exception;
	
	//댓글수정
	public void updateReply(QnaBoardReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(QnaBoardReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public QnaBoardReplyVO selectReply(int rno) throws Exception;
}
