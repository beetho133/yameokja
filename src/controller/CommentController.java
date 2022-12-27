package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.CommentService;
import vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	@RequestMapping("/commentList.do")
	@ResponseBody
	public String commentList(int cBoardNum, HttpServletResponse response) throws UnsupportedEncodingException {
				
//		System.out.println("conL");
		
		Gson gson = new Gson();
		
//		return gson.toJson(service.comList(boardNum));
		
		String result = URLEncoder.encode(gson.toJson(service.commentList(cBoardNum)), "utf-8");
		
		return result;
		
	}
	
	@RequestMapping("/commentWrite.do")
	@ResponseBody
	public String commentWrite(CommentVO comment) {
		
		return service.commentWrite(comment)+"";
		
	}
		
	@RequestMapping("/cCommentWriteForm.do")
	@ResponseBody
	public String cCommentWriteForm(CommentVO comment) {
		
		return service.commentWriteNum(comment)+"";
		
	}
	
	@RequestMapping("/commentUpdate.do")
	@ResponseBody
	public String commentUpdate(CommentVO comment) {
		
		return service.commentUpdate(comment)+"";
		
	}
	
	@RequestMapping("/commentDelete.do")
	@ResponseBody
	public String commentDelete(int cNum) {
		
		return service.commentDelete(cNum)+"";
		
	}
	
	@RequestMapping("/accept.do")
	@ResponseBody
	public String accept(CommentVO comment) {
		
		return service.accept(comment)+"";
		
	}
	
	@RequestMapping("/acceptList.do")
	@ResponseBody
	public String acceptList(int cBoardNum) throws UnsupportedEncodingException {
		
		Gson gson = new Gson();
		
		String result = URLEncoder.encode(gson.toJson(service.acceptList(cBoardNum)), "utf-8");
		
		return result;
		
	}
	
	@RequestMapping("/checkAsk.do")
	@ResponseBody
	public String checkAsk(CommentVO comment) {
		
		if(service.checkAsk(comment)) {
			return "true";
		} else {
			return "false";
		}
		
	}
	
}
