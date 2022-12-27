package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.CommentDAO;
import vo.CommentVO;
import vo.MemberVO;

@Component
public class CommentService {
	
	@Autowired
	private CommentDAO dao;
	
	public List<CommentVO> commentList(int cBoardNum) {
		
//		System.out.println("Listsevi");
//		
//		for(CommentVO a : dao.commentList(cBoardNum)) {
//			System.out.println(a.getcContent());
//		}
		
		System.out.println("list" + cBoardNum);
		
		return dao.commentList(cBoardNum);
		
	}
	
	public int commentWrite(CommentVO comment) {
		
		if(comment.getcNum() == -1) { // 새 댓글
			
			comment.setcSub(dao.nextCommentNum());
			
		} else { // 대댓글
			
			int cSubStep =
					dao.maxCommentSubStep(
							comment.getcBoardNum(), comment.getcSub()) + 1;
			
			comment.setcSubStep(cSubStep);
			
		}
		
		
		int result = dao.commentWrite(comment);
		
		System.out.println("write" + result);
		System.out.println("get" + comment.getcNum());

		return comment.getcNum();
	}
	
	public int commentWriteNum(CommentVO comment) {
		
		return dao.commentWriteNum(comment);
		
	}
	
	public int commentUpdate(CommentVO comment) {
		
		return dao.commentUpdate(comment);
		
	}
	
	public int commentDelete(int cNum) {
		
		if(cNum == dao.checkSub(cNum)) {
			return dao.commentDeleteAll(cNum);
		} else {
			return dao.commentDelete(cNum);
		}
		
		
		
	}
	
	public int accept(CommentVO comment) {
		
		return dao.accept(comment);
		
	}
	
	public List<MemberVO> acceptList(int cBoardNum) {
		
		return dao.acceptList(cBoardNum);
		
	}
	
	public boolean checkAsk(CommentVO comment) {
		if(dao.checkAsk(comment) == 0) {
			return true;
		} else {
			return false;
		}
	}

}
