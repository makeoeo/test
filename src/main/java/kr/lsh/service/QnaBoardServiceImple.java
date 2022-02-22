package kr.lsh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.lsh.dao.QnaBoardDAO;
import kr.lsh.vo.QnaBoardVO;
import kr.lsh.vo.SearchCriteria;

@Service
public class QnaBoardServiceImple implements QnaBoardService{

	@Inject //Dao에잇는거 쓰기
	private QnaBoardDAO dao;
	
	@Override
	public void write(QnaBoardVO qnaboardVO) throws Exception {
		dao.write(qnaboardVO);
	}

	@Override
	public List<QnaBoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public QnaBoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}

	@Override
	public void update(QnaBoardVO qnaboardVO) throws Exception {
		dao.update(qnaboardVO);	
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
		
	}

}
