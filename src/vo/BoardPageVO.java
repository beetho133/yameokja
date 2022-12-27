package vo;

import java.util.List;

public class BoardPageVO {

	private List<BoardVO> boardList;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int boardCount;
	private int listNum;

	///////////////////

	public BoardPageVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardPageVO(List<BoardVO> boardList, int currentPage, int startPage, int endPage, int totalPage,
			int boardCount, int listNum) {
		super();
		this.boardList = boardList;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.boardCount = boardCount;
		this.listNum = listNum;
	}

	///////////////////////////

	public List<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardVO> boardList) {
		this.boardList = boardList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	//////////////////////////////////////

	@Override
	public String toString() {
		return "BoardPageVO [boardList=" + boardList + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalPage=" + totalPage + ", boardCount=" + boardCount + ", listNum="
				+ listNum + "]";
	}

	//////////////////////////

}
