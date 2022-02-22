package kr.lsh.controller;


import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.lsh.service.FreeBoardReplyService;
import kr.lsh.service.FreeBoardService;
import kr.lsh.vo.FreeBoardVO;
import kr.lsh.vo.PageMaker;
import kr.lsh.vo.FreeBoardReplyVO;
import kr.lsh.vo.SearchCriteria;

@Controller
public class FreeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	FreeBoardService fservice;
	@Inject
	FreeBoardReplyService fb_replyService;
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/free/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception{
		logger.info("writeView");
		
		return "/free/writeView";
	}

	// 게시판 글 작성
	@RequestMapping(value = "/free/write", method = RequestMethod.POST)
	public String write(FreeBoardVO fboardVO) throws Exception{
		logger.info("write");
		fservice.write(fboardVO);
		
		return "redirect:/free/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/free/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",fservice.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(fservice.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		//model= controller에서 data를 view로 줄때 그 데이터를 갖고있는 객체
		
		return "free/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/free/readView", method = RequestMethod.GET)
	public String read(FreeBoardVO fboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", fservice.read(fboardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<FreeBoardReplyVO> replyList = fb_replyService.readReply(fboardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		
		return "free/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/free/updateView", method = RequestMethod.GET)
	public String updateView(FreeBoardVO fboardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", fservice.read(fboardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "free/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/free/update", method = RequestMethod.POST)
	public String update(FreeBoardVO fboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		fservice.update(fboardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/free/list";
	}

	
	// 게시판 삭제
	@RequestMapping(value = "/free/delete", method = RequestMethod.POST)
	public String delete(FreeBoardVO fboardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		fservice.delete(fboardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/free/list";
	}
	
	//댓글작성
	@RequestMapping(value="/free/replyWrite", method = RequestMethod.POST)
	public String replyWrite(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		fb_replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyward", scri.getKeyword());
		
		return "redirect:/free/readView";
	}
	
	//댓글 수정 GET
	@RequestMapping(value="/free/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(FreeBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyUpdate", fb_replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
			
		return "free/replyUpdateView";
	}
		
	//댓글 수정 POST
	@RequestMapping(value="/free/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		fb_replyService.updateReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/free/readView";
	}
	
	//댓글 삭제 GET
	@RequestMapping(value="/free/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(FreeBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
			
		model.addAttribute("replyDelete", fb_replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
			

		return "free/replyDeleteView";
	}
		
	//댓글 삭제
	@RequestMapping(value="/free/replyDelete", method = RequestMethod.POST)
	public String replyDelete(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
			
		fb_replyService.deleteReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/free/readView";
	}
	
	
}
