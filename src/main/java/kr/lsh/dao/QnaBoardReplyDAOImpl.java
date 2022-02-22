package kr.lsh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.lsh.vo.QnaBoardReplyVO;

@Repository
public class QnaBoardReplyDAOImpl implements QnaBoardReplyDAO{

	@Inject SqlSession sql;
	
	@Override
	public List<QnaBoardReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("qna_replyMapper.readReply", bno);
	}

	@Override
	public void writdReply(QnaBoardReplyVO vo) throws Exception {
		sql.insert("qna_replyMapper.writeReply", vo);
		
	}

	@Override
	public void updateReply(QnaBoardReplyVO vo) throws Exception {
		sql.update("qna_replyMapper.updateReply",vo);
		
	}

	@Override
	public void deleteReply(QnaBoardReplyVO vo) throws Exception {
		sql.delete("qna_replyMapper.deleteReply",vo);
		
	}

	@Override
	public QnaBoardReplyVO selectReply(int rno) throws Exception {
		return sql.selectOne("qna_replyMapper.selectReply",rno);
	}

}
