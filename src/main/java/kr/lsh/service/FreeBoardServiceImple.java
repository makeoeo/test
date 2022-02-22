package kr.lsh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.lsh.dao.FreeBoardDAO;
import kr.lsh.vo.FreeBoardVO;
import kr.lsh.vo.SearchCriteria;

@Service
public class FreeBoardServiceImple implements FreeBoardService{

	@Inject //Dao에잇는거 쓰기
	private FreeBoardDAO dao;
	
	@Override
	public void write(FreeBoardVO fboardVO) throws Exception {
		dao.write(fboardVO);
	}

	@Override
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public FreeBoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}

	@Override
	public void update(FreeBoardVO fboardVO) throws Exception {
		dao.update(fboardVO);
	
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
		
	}

}
