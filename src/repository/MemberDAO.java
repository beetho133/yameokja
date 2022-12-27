package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mapper.MemberMapper;
import vo.BoardVO;
import vo.MemberVO;

@Component
public class MemberDAO {
    @Autowired
	private SqlSessionTemplate template;
    /////////////////////////////////////////////////////////////
    public int memberJoin(MemberVO member) {
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.memberJoin(member);
    }
    public MemberVO memberMyInfo(String id) {
		MemberMapper mapper = template.getMapper(MemberMapper.class);
		return mapper.memberMyInfo(id);
	}
    
    public String memberLoginCheck(String id) {
		MemberMapper mapper = template.getMapper(MemberMapper.class);
		return mapper.memberLoginCheck(id);
	}
    
    /////////////////////////////////////////////////////////////
    
    public int memberUpdate(MemberVO member) {
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.memberUpdate(member);
    }
    
    public int memberDelete(String id) {
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.memberDelete(id);
    }
    
    public List<BoardVO> memberWriteAll(String id){
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.memberWriteAll(id);
    }
    
    /////////////////////////
    
    public List<MemberVO> memberSexList() {
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.memberSexList();
    }
    
    public int getSex(String id) {
    	MemberMapper mapper = template.getMapper(MemberMapper.class);
    	return mapper.getSex(id);
    }
      
} 
