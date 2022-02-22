package kr.lsh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.lsh.dao.FreeBoardReplyDAO;
import kr.lsh.vo.FreeBoardReplyVO;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService{

	@Inject
	private FreeBoardReplyDAO dao;
	
	@Override
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(FreeBoardReplyVO vo) throws Exception {
		dao.writdReply(vo);
		
	}

	@Override
	public void updateReply(FreeBoardReplyVO vo) throws Exception {
		dao.updateReply(vo);
		
	}

	@Override
	public void deleteReply(FreeBoardReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		
	}

	@Override
	public FreeBoardReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

}
