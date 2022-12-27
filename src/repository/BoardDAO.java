package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.BoardMapper;
import vo.BoardVO;
import vo.SearchVO;

@Component
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public int totalBoardCount(SearchVO search) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.totalBoardCount(search);
	}
	
	public List<BoardVO> totalBoardList(int startRow, int rowCount, SearchVO search) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.totalBoardList(startRow, rowCount, search);
	}
	
	public int boardWrite(BoardVO board){
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.boardWrite(board);
	}
	
	public BoardVO boardContent(int bNum) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.boardContent(bNum);
	}
	
	public int searchSex(String bWriter) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.searchSex(bWriter);
	}
	
	public int matchCheck(BoardVO board) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.matchCheck(board);
	}
	
	public String boardCheckPw(int boardNum) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.boardCheckPw(boardNum);
	}
	
	public int boardModify(BoardVO board) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.boardModify(board);
	}
	
	public BoardVO noReadUpBoardContent(int bNum) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.noReadUpBoardContent(bNum);
	}
	
	public int boardDelete(int bNum) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.boardDelete(bNum);
	}
	
	public int upReadCount(int bNum) {
		BoardMapper mapper = template.getMapper(BoardMapper.class);
		return mapper.upReadCount(bNum);
	}
}
