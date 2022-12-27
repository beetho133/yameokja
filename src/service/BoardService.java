package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.BoardDAO;
import vo.BoardPageVO;
import vo.BoardVO;
import vo.SearchVO;

@Component
public class BoardService {
	@Autowired
	private BoardDAO dao;

	public BoardPageVO makePage(int currentPage, SearchVO search) {
		
		System.out.println(search.getStartDate());
		System.out.println(search.getEndDate());
	
		final int PAGE_PER_COUNT = 10;

		// 총 페이지 수 계산
		int boardCount = dao.totalBoardCount(search);
		System.out.println("boardCount:"+boardCount);
		int totalPageCount = boardCount / 10;
		if (boardCount % 10 != 0) {
			totalPageCount++;
		}

		System.out.println(boardCount);

		// 목록에 보여질 게시글 조회

		// int startRow = (currentPage - 1) * 10 + 1;
		//
		// int endRow = currentPage * PAGE_PER_COUNT;
		//
		// List<BoardVO> boardList
		// = dao.totalBoardList(startRow, endRow);
		//

		int startRow = (currentPage - 1) * 10;

		List<BoardVO> boardList = dao.totalBoardList(startRow, PAGE_PER_COUNT, search);

		// System.out.println(boardList);

		// 화면 하단의 페이지 링크 중 시작 페이지 계산
		int startPage = (currentPage - 1) / 10 * 10 + 1;

		// 화면 하단의 끝 페이지 계산
		int endPage = startPage + 9;
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}

		// 목차
		int listNum = boardCount - (currentPage - 1) * PAGE_PER_COUNT;

		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPageCount, boardCount, listNum);

	}
	
	public List<BoardVO> makeInfoWriteBoard(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myBoard");
		search.setSearchKeywordString(loginId);
		
		int boardCount = makeInfoWriteBoardCount(loginId);
		System.out.println("boardCount:"+boardCount);
		

		System.out.println(boardCount);


		List<BoardVO> boardList = dao.totalBoardList(0, boardCount, search);


		return boardList;

	}
	
	public int makeInfoWriteBoardCount(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myBoard");
		search.setSearchKeywordString(loginId); 

		return dao.totalBoardCount(search);

	}
	
	public List<BoardVO> makeInfoWriteAsk(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myAsk");
		search.setSearchKeywordString(loginId);
		
		int boardCount = makeInfoWriteAskCount(loginId);
		System.out.println("boardCount:"+boardCount);
		

		System.out.println(boardCount);


		List<BoardVO> boardList = dao.totalBoardList(0, boardCount, search);


		return boardList;

	}
	
	public int makeInfoWriteAskCount(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myAsk");
		search.setSearchKeywordString(loginId); 

		return dao.totalBoardCount(search);

	}
	
public List<BoardVO> makeInfoWriteAccept(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myAccept");
		search.setSearchKeywordString(loginId);
		
		int boardCount = makeInfoWriteAskCount(loginId);
		System.out.println("boardCount:"+boardCount);
		

		System.out.println(boardCount);


		List<BoardVO> boardList = dao.totalBoardList(0, boardCount, search);


		return boardList;

	}
	
	public int makeInfoWriteAcceptCount(String loginId) {
		
		SearchVO search = new SearchVO();
		
		search.setSearchArticle("myAccept");
		search.setSearchKeywordString(loginId); 

		return dao.totalBoardCount(search);

	}
	
	public int boardWrite(BoardVO board) {
		
		dao.boardWrite(board);
		
		return board.getbNum();
		
	}
	
	public BoardVO boardContent(int bNum, String check) {
		
		if(check == null || check == "" || check.equals("")) {
			dao.upReadCount(bNum);
		}
		
		return dao.boardContent(bNum);
		
	}
	
	public String searchSex(String bWriter) {
		if(dao.searchSex(bWriter) == 0) {
			return "여자";
		} else {
			return "남자";
		}
	}
	
	public int matchCheck(BoardVO board) {
		return dao.matchCheck(board);
	}
	
	public boolean checkPw(int bNum, String checkPw) {
		
		String bPw = dao.boardCheckPw(bNum);
		
		if(bPw != null && bPw.equals(checkPw)) {
			return true;
		} else {
			return false;
		}
	}
	
	public BoardVO noReadUpBoardContent(int bNum) {
		return dao.noReadUpBoardContent(bNum);
	}
	
	public int boardModify(BoardVO board) {
		return dao.boardModify(board);
	}
	
	public boolean boardDelete(int bNum) {
		if(dao.boardDelete(bNum) > 0) {
			return true;
		} else {
			return false;
		}
	}

}
