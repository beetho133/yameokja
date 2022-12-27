package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDAO;
import vo.BoardVO;
import vo.MemberVO;

@Component
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public boolean memberJoin(MemberVO member) {

		if (member.getId() == null || member.getId().equals("") 
				|| member.getPw() == null || member.getPw().equals("")
				|| member.getName() == null || member.getName().equals("") 
				|| member.getPhone() == null || member.getPhone().equals("")) {

			return false;

		} else {

			dao.memberJoin(member);

			return true;

		}

	}
	
	public boolean memberIdCheck(String checkId) {
		
		if(dao.memberMyInfo(checkId) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public int memberLogin(String id, String pw) {
		
		String memberPw = dao.memberLoginCheck(id);
		
		int check;
		
		if(memberPw == null) {
			
			check = -1;
			
		} else {
			
			if(memberPw.equals(pw)) {
				check = 1;
			} else {
				check = 0;
			}
			
		}
		
		return check;
		
	}
	
	
	//////////////////////////////////////////////////////////////////////
	
	public boolean myInfoOk(String id) {
		if(id.equals(dao.memberMyInfo(id).getId())) {
			return true;
		}else {
			return false;
		}
		
	}
	
	// 한 사람 객체 반환
	public MemberVO oneInfo(String id) {
		if(id.equals(dao.memberMyInfo(id).getId())) {
			return dao.memberMyInfo(id);
		}else
			return null;
	}
	
	// 비번 체크
	public boolean checkPassword(String id, String tryPw) {
		String checkPass = dao.memberMyInfo(id).getPw();
			if(checkPass.equals(tryPw)) {
				return true;
			}else
				return false;
		}
	
	// 수정
	public boolean modify(MemberVO member) {
		System.out.println("modify까지 실행!");
		System.out.println(member.getId());
		System.out.println(member.getPhone());
		System.out.println(member.getEmail());
		if(dao.memberUpdate(member)>0) {
			return true;
		}else
			System.out.println("false다!!!!!!!!!!!");
			return false;
	}
	// 삭제
	public boolean delete(String id) {
		if(dao.memberDelete(id)>0) {
			return true;
		}else
			return false;
	}
	
	// 보여지는 성별 바꾸기
	public String sexChange(MemberVO member) {
		if(member.getSex() == 0) {
			return new String("여자");
		}else if(member.getSex() == 1) {
			return new String("남자");
		} else
			return "제3의 성별";
	}
	
	
	public List<BoardVO> memberOneWriting(String id) {
		if(id.equals(dao.memberMyInfo(id).getId())) {
			return dao.memberWriteAll(id);
		}else 
			return null;
	}
	
	////////////////////////
	
	public List<MemberVO> memberSexList() {
		return dao.memberSexList();
	}
	
	public int getSex(String id) {
		
		return dao.getSex(id);
		
	}


}
