package mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.BoardVO;
import vo.SearchVO;

public interface BoardMapper {
	
	public int totalBoardCount(SearchVO search);
	public List<BoardVO> totalBoardList(@Param("startRow") int startRow,@Param("rowCount") int rowCount, @Param("search") SearchVO search);
	public int boardWrite(BoardVO board);
	public BoardVO boardContent(int bNum);
	public int searchSex(String bWriter);
	public int matchCheck(BoardVO board);
	public String boardCheckPw(int boardNum);
	public int boardModify(BoardVO board);
	public BoardVO noReadUpBoardContent(int bNum);
	public int boardDelete(int bNum);
	public int upReadCount(int bNum);
}
