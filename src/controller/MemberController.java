package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import service.MemberService;
import vo.CommentVO;
import vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private BoardService boardService;
	

	@RequestMapping("memberJoinForm.do")
	public String joinForm() {
		return "member_join_form";
	}
//////////////////////////////////////////////////////////
	@RequestMapping("memberJoin.do")
	public ModelAndView join(MemberVO member) {
		ModelAndView mv = new ModelAndView();

		boolean check = service.memberJoin(member);
		
		if (check) {
			mv.addObject("id", member.getId());
		}
		
		mv.addObject("check", check);
		mv.setViewName("member_join_rs");

		return mv;
	}
	
	@RequestMapping("memberIdCheck.do")
	public  ModelAndView idCheck(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		String checkId = request.getParameter("checkId");
		
		
		mv.addObject("check", service.memberIdCheck(checkId));
		mv.addObject("checkId", checkId);
		mv.setViewName("member_id_check");
		
		return mv;
		
	}
	
	@RequestMapping("memberLoginForm.do")
	public ModelAndView loginForm(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", request.getParameter("id"));
		mv.setViewName("member_login_form");
			
		return mv;
	}
	
	@RequestMapping("memberLogin.do")
	public ModelAndView login(String id, String pw, HttpSession session) {

		ModelAndView mv = new ModelAndView();

		int check = service.memberLogin(id, pw);

		if (check == 1) {
			session.setAttribute("loginId", id);
		} else if (check == -1) {
			mv.addObject("message", "아이디가 존재하지 않습니다.");
		} else {
			mv.addObject("message", "비밀번호가 일치하지 않습니다.");
		}

		mv.setViewName("member_login_form");

		return mv;
	}
	
	@RequestMapping("memberLogout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member_logout";
	}
	
	
	//////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("myInfo.do")
	public ModelAndView info(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//boolean mycheck = service.myInfoOk((String)session.getAttribute("loginId"));
		
		//if(mycheck) {
		
			mv.addObject("id", session.getAttribute("loginId"));
//			mv.addObject("myinfo", service.oneInfo((String)session.getAttribute("loginId")));
//			mv.addObject("myboard", service.memberOneWriting((String)session.getAttribute("loginId")));
			
			
			mv.addObject("writeBoard", boardService.makeInfoWriteBoard((String)session.getAttribute("loginId")));
			mv.addObject("writeBoardCount", boardService.makeInfoWriteBoardCount((String)session.getAttribute("loginId")));
			
			mv.addObject("writeAsk", boardService.makeInfoWriteAsk((String)session.getAttribute("loginId")));
			mv.addObject("writeAskCount", boardService.makeInfoWriteAskCount((String)session.getAttribute("loginId")));
			
			mv.addObject("writeAccept", boardService.makeInfoWriteAccept((String)session.getAttribute("loginId")));
			mv.addObject("writeAcceptCount", boardService.makeInfoWriteAcceptCount((String)session.getAttribute("loginId")));
			
			mv.addObject("memberList", service.memberSexList());
//			mv.addObject("boardPage", boardService.makeMyinfo());
			
			mv.setViewName("member_myinfo");
			return mv;
			
//		}else {
//			mv.setViewName("member_myinfo_error");
//			return mv;
//		}
			
		
	}

	@RequestMapping("myInfoControl.do")
	public ModelAndView infoControll(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", session.getAttribute("loginId"));
		mv.addObject("myinfo", service.oneInfo((String)session.getAttribute("loginId")));
		
		// 내정보 확인란에서 보여지는 성별 change
		mv.addObject("changedSex",service.sexChange(service.oneInfo((String)session.getAttribute("loginId"))));

		mv.setViewName("member_myinfo_control");

		return mv;
	}
	
	@RequestMapping("myinfoModifyCheck.do")
	public ModelAndView modifyCheck(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", session.getAttribute("loginId"));
		mv.addObject("myinfo", service.oneInfo((String)session.getAttribute("loginId")));
		mv.setViewName("member_myinfo_modify_check");
		
		return mv;
	}
	
	@RequestMapping("myInfoModifyForm.do")
	public ModelAndView infoModify(HttpSession session, String id, String typedpass) {
		ModelAndView mv = new ModelAndView();
		
		if(service.checkPassword(id, typedpass)) {
		mv.addObject("id", session.getAttribute("loginId"));
			mv.addObject("myinfo", service.oneInfo((String)session.getAttribute("loginId")));
			// 정보 수정란에서 보여지는 성별 change
			mv.addObject("changedSex", service.sexChange(service.oneInfo((String)session.getAttribute("loginId"))));
			mv.setViewName("member_myinfo_modify_form");
		}else {
			mv.setViewName("member_myinfo_error");
		}	
		return mv;	
	}
	
	@RequestMapping(value="modify.do", method = RequestMethod.POST)
	public String modify(MemberVO member) {
		System.out.println("modify.do 갔다!");
		if(service.modify(member)) {
			System.out.println("수정 후 gts아디:" + member.getName());
			return "modify_success";
		}else
			return "modify_fail";
	}
	
	@RequestMapping("myinfoDeleteCheck.do")
	public ModelAndView deleteCheck(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("id", session.getAttribute("loginId"));
		mv.addObject("myinfo", service.oneInfo((String)session.getAttribute("loginId")));
		mv.setViewName("member_myinfo_delete_check");
		
		return mv;
	}
	
	@RequestMapping("myInfoDelete.do")
	public ModelAndView delete(HttpSession session, String id, String typedpass) {
		
		ModelAndView mv = new ModelAndView();
		
		if(service.checkPassword(id, typedpass)) {
			service.delete(id);
			session.invalidate();
			mv.addObject("delId", id);
			mv.setViewName("delete_success");
		}else {
			mv.setViewName("member_myinfo_error");
//			return "delete_fail";
			
		}
		
		return mv;

	}
	
	@RequestMapping("/loginCheck.do")
	public String loginCheck() {
		return "login_check";
	}
	
	//////////////////
	
	@RequestMapping("/getSex.do")
	@ResponseBody
	public String getSex(String id) {
		
		return String.valueOf(service.getSex(id));
		
	}
	
	

}
