package com.one.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.MemberCriteria;
import com.one.dto.DepartmentVO;
import com.one.dto.MemberRemindSetVO;
import com.one.dto.MemberRemindVO;
import com.one.dto.MemberVO;

public interface MemberService {

	public MemberVO getMember(String memId) throws SQLException;

	public Map<String, Object> getMemberDetail(String memEmail) throws SQLException;

	public MemberVO getMemberByEmail(String memEmail) throws SQLException;

	public List<Map<String, String>> getMemberByDpId(String dpId) throws Exception;

	public List<Map<String, String>> getMemberByDpIdNoIcon(String dpId) throws Exception;

	public List<Map<String, String>> getMemberClByOpcl(int opcl) throws Exception;

	public void insertIdAndPwd(MemberVO member) throws SQLException;

	public Map<String, Object> getManagerByEmail(String memEmail) throws SQLException;

	public void registMembersFromExcel(File uploadFile) throws IOException, SQLException;

	public void registMember(MemberVO member) throws SQLException;

	public void updateMemberAuthority(MemberVO member) throws SQLException;

	public void modifyMemberPwd(MemberVO member)throws SQLException;

	public List<DepartmentVO> selectMemberDepartment()throws SQLException;

	public void modifyPwdById(MemberVO member) throws SQLException;

	public Map<String, Object> getMemberMainInfo(MemberCriteria cri) throws SQLException;

	public boolean memberStatusChk(MemberVO member) throws SQLException;
	
	// 알림 설정 가져옴
	public MemberRemindSetVO getMemberRemindSet(String memEmail) throws SQLException;
	// 이전에 갔던 알림 중에 읽지 않은 알림
	public List<MemberRemindVO> getMemberNotReadRemind(String memEmail) throws SQLException;
	// 새로운 알림
	public Map<String, Object> registMemberNewRemind(MemberVO loginUser, MemberRemindSetVO remindSet) throws Exception;

}
