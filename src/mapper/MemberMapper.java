package mapper;

import java.util.List;

import vo.BoardVO;
import vo.MemberVO;

public interface MemberMapper {
	public int memberJoin(MemberVO member);
	public MemberVO memberMyInfo(String id);
	public String memberLoginCheck(String id);
	
	
	////////////////////////////////////////
	
	
	public int memberUpdate(MemberVO member);
	public int memberDelete(String id);
	
	public List<BoardVO> memberWriteAll(String id);
	
	///////////////////
	
	public List<MemberVO> memberSexList();
	public int getSex(String id);
}