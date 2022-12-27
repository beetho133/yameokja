package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.CommentVO;
import vo.MemberVO;

public interface CommentMapper {
	
	public List<CommentVO> commentList(int cBoardNum);
	public int commentWrite(CommentVO comment);
	public int nextCommentNum();
	public int maxCommentSubStep(@Param("cBoardNum") int cBoardNum, @Param("cSub") int cSub);
	public int commentWriteNum(CommentVO comment);
	public int commentUpdate(CommentVO comment);
	public int commentDelete(int cNum);
	public int accept(CommentVO comment);
	public List<MemberVO> acceptList(int cBoardNum);
	
	//////////////
	
	public int checkAsk(CommentVO comment);
	
	///
	
	public int checkSub(int cNum);
	public int commentDeleteAll(int cNum);
	
	
}
