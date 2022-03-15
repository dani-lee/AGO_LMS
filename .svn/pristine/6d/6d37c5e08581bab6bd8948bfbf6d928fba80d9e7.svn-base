package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.MemberVO;

public interface ManagementMemberService {
	//회원 전체 목록
	public Map<String, Object> getMemberList(Criteria cri) throws SQLException;
	
	
	public Map<String, Object> getResignerList(Criteria cri) throws SQLException;
	
	public Map<String, Object> getMemberListExceptResigners(Criteria cri)throws SQLException;
	
	//퇴사자 재직으로 변경
	public void modifyMemberStatus(MemberVO member) throws SQLException;
	
	//퇴사자 재직으로 일괄 변경
	public void modifyCheckedResigners(String[] memEmail)throws SQLException;
	
	
}
