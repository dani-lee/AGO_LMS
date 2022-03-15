package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.one.command.MemberClassCommand;
import com.one.dao.MemberDAO;
import com.one.dto.DepartmentVO;
import com.one.dto.FinishedClassVO;
import com.one.dto.MemberClVO;
import com.one.dto.MemberRemindSetVO;
import com.one.dto.MemberRemindVO;
import com.one.dto.MemberVO;
import com.one.dto.NewRemindCheckVO;
import com.one.dto.ClassVO.ClassVO;

public class MemberDAOImpl implements MemberDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public MemberVO selectMemberById(String memId) throws SQLException {
		MemberVO member = session.selectOne("Member-Mapper.selectMemberById", memId);
		return member;
	}

	@Override
	public MemberVO selectMemberByEmail(String memEmail) throws SQLException {
		MemberVO member = session.selectOne("Member-Mapper.selectMemberByEmail", memEmail);
		return member;
	}

	public List<MemberVO> selectMemberByDpId(String dpId) throws SQLException {
		List<MemberVO> memberList = session.selectList("Member-Mapper.selectMemberByDpId", dpId);
		return memberList;
	}

	@Override
	public List<MemberClVO> selectMemberClByOpcl(int opcl) throws SQLException {
		List<MemberClVO> memberClList = session.selectList("Member-Mapper.selectMemberClByOpcl", opcl);
		return memberClList;
	}

	@Override
	public void insertIdAndPwd(MemberVO member) throws SQLException {
		session.update("Member-Mapper.insertIdAndPwd", member);

	}

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		session.update("Member-Mapper.insertMember", member);
	}

	@Override
	public void insertMembers(Map<String, Object> paramMap) throws Exception {
		session.update("Member-Mapper.insertMembers", paramMap);
	}

	@Override
	public List<MemberClassCommand> selectMemberClassList(String memEmail) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Member-Mapper.selectMemberClassList", memEmail);
	}

	@Override
	public ClassVO selectMemberClassName(int opcl) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("Member-Mapper.selectMemberClassName", opcl);
	}

	@Override
	public List<DepartmentVO> selectMemberDepartment() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Member-Mapper.selectMemberDepartment");
	}

	@Override
	public List<DepartmentVO> selectMemberPosition() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Member-Mapper.selectMemberPosition");
	}

	@Override
	public List<DepartmentVO> selectMemberAuthority() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("Member-Mapper.selectMemberAuthority");

	}

	@Override
	public void updateMemberAuthority(MemberVO member) throws SQLException {
		session.selectList("Member-Mapper.updateMemberAuthority", member);

	}

	@Override
	public void updateMemberPwd(MemberVO member) throws SQLException {
		session.update("Member-Mapper.updateMemberPwd", member);
	}

	@Override
	public void updatePwdById(MemberVO member) throws SQLException {
		session.update("Member-Mapper.updatePwdById", member);
	}

	@Override
	public String memberStatusChk(MemberVO member) throws SQLException {
		String status = session.selectOne("Member-Mapper.memberStatusChk", member);
		return status;
	}

	@Override
	public MemberRemindSetVO selectMemberRemindSet(String memEmail) throws SQLException {
		return session.selectOne("Member-Mapper.selectMemberRemindSet", memEmail);
	}

	@Override
	public List<MemberRemindVO> selectMemberNotReadRemind(String memEmail) throws SQLException {
		return session.selectList("Member-Mapper.selectMemberNotReadRemind", memEmail);
	}

	@Override
	public List<NewRemindCheckVO> selectMemberIntrClass(String memEmail) throws SQLException {
		return session.selectList("Member-Mapper.selectMemberIntrClass", memEmail);
	}

	@Override
	public List<NewRemindCheckVO> selectMemberRealTimeClass(String memEmail) throws SQLException {
		return session.selectList("Member-Mapper.selectMemberRealTimeClass", memEmail);
	}

	@Override
	public int countExtReport(String dpId) throws SQLException {
		return session.selectOne("Member-Mapper.countExtReport",dpId);
	}

	@Override
	public int countIntReport(String dpId) throws SQLException {
		return session.selectOne("Member-Mapper.countIntReport",dpId);
	}

	@Override
	public int insertMemberRemd(MemberRemindVO newRemind) throws SQLException {
		return session.update("Member-Mapper.insertMemberRemd", newRemind);
	}

	@Override
	public List<FinishedClassVO> selectMemberIntCtfClass(String memEmail) throws SQLException {
		return session.selectList("Member-Mapper.selectMemberIntCtfClass",memEmail);
	}

	@Override
	public List<FinishedClassVO> selectMemberExtCtfClass(String memEmail) throws SQLException {
		return session.selectList("Member-Mapper.selectMemberExtCtfClass",memEmail);
	}

}
