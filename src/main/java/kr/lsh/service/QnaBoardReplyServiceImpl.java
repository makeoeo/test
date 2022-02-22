package kr.lsh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.lsh.dao.QnaBoardReplyDAO;
import kr.lsh.vo.QnaBoardReplyVO;

@Service
public class QnaBoardReplyServiceImpl implements QnaBoardReplyService{

	@Inject
	private QnaBoardReplyDAO dao;
	
	@Override
	public List<QnaBoardReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(QnaBoardReplyVO vo) throws Exception {
		dao.writdReply(vo);
		
	}

	@Override
	public void updateReply(QnaBoardReplyVO vo) throws Exception {
		dao.updateReply(vo);
		
	}

	@Override
	public void deleteReply(QnaBoardReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		
	}

	@Override
	public QnaBoardReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
