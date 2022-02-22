package kr.lsh.controller;


import java.util.List
;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.lsh.service.QnaBoardReplyService;
import kr.lsh.service.QnaBoardService;
import kr.lsh.vo.PageMaker;
import kr.lsh.vo.QnaBoardReplyVO;
import kr.lsh.vo.QnaBoardVO;
import kr.lsh.vo.SearchCriteria;

@Controller
public class QnaBoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	QnaBoardService qnaservice;
	@Inject
	QnaBoardReplyService qna_replyService;
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/qna/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception{
		logger.info("writeView");
		
		return "/qna/writeView";
	}

	// 게시판 글 작성
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public String write(QnaBoardVO qnaboardVO) throws Exception{
		logger.info("write");
		qnaservice.write(qnaboardVO);
		
		return "redirect:/qna/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",qnaservice.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(qnaservice.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		//model= controller에서 data를 view로 줄때 그 데이터를 갖고있는 객체
		
		return "qna/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/qna/readView", method = RequestMethod.GET)
	public String read(QnaBoardVO qnaboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", qnaservice.read(qnaboardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<QnaBoardReplyVO> replyList = qna_replyService.readReply(qnaboardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		
		return "qna/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/qna/updateView", method = RequestMethod.GET)
	public String updateView(QnaBoardVO qnaboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", qnaservice.read(qnaboardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "qna/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/qna/update", method = RequestMethod.POST)
	public String update(QnaBoardVO qnaboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		qnaservice.update(qnaboardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/qna/list";
	}

	
	// 게시판 삭제
	@RequestMapping(value = "/qna/delete", method = RequestMethod.POST)
	public String delete(QnaBoardVO qnaboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		qnaservice.delete(qnaboardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/qna/list";
	}
	
	//댓글작성
	@RequestMapping(value="/qna/replyWrite", method = RequestMethod.POST)
	public String replyWrite(QnaBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		qna_replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyward", scri.getKeyword());
		
		return "redirect:/qna/readView";
	}
	
	//댓글 수정 GET
	@RequestMapping(value="/qna/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(QnaBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyUpdate", qna_replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
			
		return "qna/replyUpdateView";
	}
		
	//댓글 수정 POST
	@RequestMapping(value="/qna/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(QnaBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		qna_replyService.updateReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/qna/readView";
	}
	
	//댓글 삭제 GET
	@RequestMapping(value="/qna/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(QnaBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyDelete", qna_replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
			

		return "qna/replyDeleteView";
	}
		
	//댓글 삭제
	@RequestMapping(value="/qna/replyDelete", method = RequestMethod.POST)
	public String replyDelete(QnaBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		qna_replyService.deleteReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/qna/readView";
	}
	
	
}
