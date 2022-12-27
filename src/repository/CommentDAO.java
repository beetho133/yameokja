package repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.BoardMapper;
import mapper.CommentMapper;
import vo.CommentVO;
import vo.MemberVO;

@Component
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<CommentVO> commentList(int cBoardNum) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentList(cBoardNum);
	}
	
	public int commentWrite(CommentVO comment) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentWrite(comment);
	}
	
	public int nextCommentNum() {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.nextCommentNum();
	}
	
	public int maxCommentSubStep(int cBoardNum, int cSub) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.maxCommentSubStep(cBoardNum, cSub);
	}
	
	public int commentWriteNum(CommentVO comment) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentWriteNum(comment);
	}
	
	public int commentUpdate(CommentVO comment) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentUpdate(comment);
	}
	
	public int commentDelete(int cNum) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentDelete(cNum);
	}
	
	public int accept(CommentVO comment) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.accept(comment);
	}
	
	public List<MemberVO> acceptList(int cBoardNum) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.acceptList(cBoardNum);
	}
	
	public int checkAsk(CommentVO comment) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.checkAsk(comment);
	}
	
	public int checkSub(int cNum) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.checkSub(cNum);
	}
	
	public int commentDeleteAll(int cNum) {
		CommentMapper mapper = template.getMapper(CommentMapper.class);
		return mapper.commentDeleteAll(cNum);
	}

}
