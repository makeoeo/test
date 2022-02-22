package kr.lsh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.lsh.vo.FreeBoardReplyVO;

@Repository
public class FreeBoardReplyDAOImpl implements FreeBoardReplyDAO{

	@Inject SqlSession sql;
	
	@Override
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("fb_replyMapper.readReply", bno);
	}

	@Override
	public void writdReply(FreeBoardReplyVO vo) throws Exception {
		sql.insert("fb_replyMapper.writeReply", vo);
		
	}

	@Override
	public void updateReply(FreeBoardReplyVO vo) throws Exception {
		sql.update("fb_replyMapper.updateReply",vo);
		
	}

	@Override
	public void deleteReply(FreeBoardReplyVO vo) throws Exception {
		sql.delete("fb_replyMapper.deleteReply",vo);
		
	}

	@Override
	public FreeBoardReplyVO selectReply(int rno) throws Exception {
		return sql.selectOne("fb_replyMapper.selectReply",rno);
	}

}
