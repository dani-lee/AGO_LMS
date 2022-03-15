package com.one.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.CommonVO;
import com.one.dto.DepartmentVO;
import com.one.dto.MemberVO;

public interface ManagementMemberDAO {
	// 회원 목록 전체 가져오기
	public List<MemberVO> selectMemberList(Criteria cri) throws SQLException;

	public int selectMemberListCount(Criteria cri) throws SQLException;

	// 검색바 부서목록 가져오기
	public List<DepartmentVO> selectDepartment() throws SQLException;

	public List<MemberVO> selectSameDepartment(Criteria cri) throws SQLException;
	
	public List<MemberVO> selectResignerList(Criteria cri)throws SQLException;
	
	//퇴사자 목록 가져오기
	public int selectResignerListCount(Criteria cri) throws SQLException;
	
	//퇴사자 이외 회원 목록 가져오기
	public List<MemberVO> selectMemberListExceptResigners(Criteria cri) throws SQLException;
	
	public int selectMemberListExceptResignersCount(Criteria cri) throws SQLException;
	
	//퇴사자 재직자로 변경
	public void updateMemberStatus(MemberVO member) throws SQLException;
	
	//퇴사자 재직자로 일괄 변경
	public void updateCheckedMemberStatus(String[] memEmail)throws SQLException;
}
