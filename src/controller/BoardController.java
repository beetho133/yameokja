package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import service.MemberService;
import vo.BoardVO;
import vo.SearchVO;

@Controller
public class BoardController {
	
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/boardList.do")
	public ModelAndView boardList(SearchVO search,
			@RequestParam(defaultValue="1") int page) {
		
//		logger.info("뭐하나 떠라");
//		logger.debug("ㅇ?");
		
		ModelAndView mv = new ModelAndView("board_list");
		System.out.println(search.getSearchArticle());
		System.out.println(search.getSearchKeywordString());
		System.out.println(search.getStartDate());
		System.out.println(search.getEndDate());
		System.out.println(search.getSearchKeywordInt());
		
		if(search.getSearchArticle() == null) {
			mv.addObject("searchCheck", "n");
		} else if(search.getSearchArticle().equals("---------------")) {
			mv.addObject("searchCheck", "n");
		} else {
			mv.addObject("searchCheck", "y");
		}
		
		mv.addObject("memberList", memberService.memberSexList());
		mv.addObject("boardPage", service.makePage(page, search));
		
		return mv;
		
	}
	
//	@RequestMapping("/boardSearch.do")
//	public ModelAndView boardSearch(@RequestParam(defaultValue="1") int page,
//			String searchArticle, String seachKeyword, Date startDate, Date endDate) {
//		
//		ModelAndView mv = new ModelAndView("board_list");
//		
//		System.out.println(searchArticle);
//		System.out.println(seachKeyword);
//		System.out.println(startDate);
//		System.out.println(endDate);
//		
//		mv.addObject("memberList", memberService.memberSexList());
//		mv.addObject("boardPage", service.makePage(page));
//		
//		
//		return mv;
//	}
	
	
	@RequestMapping("/boardWriteForm.do")
	public String boardWriteForm() {
		
//		logger.info("뭐하나 떠라");
//		logger.debug("ㅇ?");
		
		return "board_write_form";
		
	}
	
	@RequestMapping("/boardWrite.do")
	@ResponseBody
	public void boardWrite(BoardVO board, HttpServletResponse response) {
		
		System.out.println("여기");
		
		int bNum = service.boardWrite(board);
		
		try {
			
			logger.info("유형 : 글쓰기, 글번호 : " + board.getbNum() +  ", 작성자 : " + board.getbWriter() + ", 장소 : " + board.getbLocation() + ", 시간 : " + board.getbTime());
			
			response.sendRedirect("boardContent.do?bNum=" + bNum 
					+ "&check=wr");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("글쓰기 결과 실패");
			e.printStackTrace();
		}	
	}
	
	@RequestMapping("/boardContent.do")
	public ModelAndView boardContent(int bNum, String check, 
			@RequestParam(defaultValue="1") int page) {
		
		ModelAndView mv = new ModelAndView("board_content");
		
		BoardVO board = service.boardContent(bNum, check);
		
		mv.addObject("sex", service.searchSex(board.getbWriter()));
		mv.addObject("board", board);
		mv.addObject("page", page);
		
		return mv;
		
	}
	
	@RequestMapping("/searchSex.do")
	@ResponseBody
	public String searchSex(String bWriter) throws UnsupportedEncodingException {
		return URLEncoder.encode(service.searchSex(bWriter), "utf-8");
	}
	
	@RequestMapping("/matchCheck.do")
	@ResponseBody
	public String matchComplete(BoardVO board) {
		return service.matchCheck(board)+"";
	}
	
	
	@RequestMapping("/boardPassCheck.do")
	public ModelAndView passCheck(int bNum, String check, 
			@RequestParam(defaultValue="1") int page) {
		
		ModelAndView mv = new ModelAndView("board_pass_check");
		
		mv.addObject("bNum", bNum);
		mv.addObject("check", check);
		mv.addObject("page", page);
		
		return mv;
		
	}
	
	
	@RequestMapping("/boardModifyForm.do")
	public ModelAndView modifyForm(int bNum, String checkPw, 
			@RequestParam(defaultValue="1") int page) {
		
		ModelAndView mv = new ModelAndView();
		
		if(service.checkPw(bNum, checkPw)) {
			mv.addObject("board", service.noReadUpBoardContent(bNum));
			mv.addObject("page", page);
			mv.setViewName("board_modify_form");
		} else {
			mv.addObject("check", "수정");
			mv.setViewName("board_invalid_pw");
		}
		
		return mv;
		
	}
	
	@RequestMapping("/boardModify.do")
	public ModelAndView modify(BoardVO board, @RequestParam(defaultValue="1") int page,
			HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("page", page);	
		
		if(service.boardModify(board) > 0) {
			mv.addObject("page", page);
			mv.addObject("board", service.noReadUpBoardContent(board.getbNum()));
			mv.addObject("sex", service.searchSex(board.getbWriter()));
			mv.setViewName("board_content");
		} else {
			mv.addObject("check", "수정");
			mv.setViewName("board_update_fail");
		}
		
		return mv;
		
	}
	
	@RequestMapping("/boardDeleteForm.do")
	public ModelAndView deleteForm(int bNum, String checkPw, int page) {
		
		ModelAndView mv = new ModelAndView();
		
		if(service.checkPw(bNum, checkPw)) {
			mv.setViewName("board_delete_form");
		} else {
			mv.addObject("check", "삭제");
			mv.setViewName("board_invalid_pw");
		}
		
		mv.addObject("bNum", bNum);
		mv.addObject("page", page);
		
		return mv;
		
	}
	
	@RequestMapping("/boardDelete.do")
	public ModelAndView delete(int bNum, int page) {
		
		ModelAndView mv = new ModelAndView();

		if (service.boardDelete(bNum)) {
			mv.addObject("bNum", bNum);
			mv.addObject("page", page);
			mv.addObject("check", "y");
			mv.setViewName("board_delete_form");
		} else {
			mv.addObject("check", "삭제");
			mv.setViewName("board_update_fail");
		}

		return mv;

	}
	
	
	
}
