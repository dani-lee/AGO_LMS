package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.AdminDAO;
import com.one.dto.AdminVO;
import com.one.dto.MemberVO;

public class AdminDAOImpl implements AdminDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MemberVO> selectEmployeeList(Criteria cri) throws SQLException {
		return session.selectList("Admin-Mapper.selectEmployeeList", cri);
	}

	@Override
	public List<MemberVO> selectManagerList() throws SQLException {
		return session.selectList("Admin-Mapper.selectManagerList");
	}

	@Override
	public void updateMemberAuthority(String[] memId) throws SQLException {
		for(int i=0;i<memId.length;i++) {
			session.selectList("Admin-Mapper.updateMemberAuthority", memId[i]);	
		}

	}

	@Override
	public void updateManagerAuthority(String[] memId) throws SQLException {
		for(int i=0;i<memId.length;i++) {
			session.selectList("Admin-Mapper.updateManagerAuthority", memId[i]);
		}
	}

	@Override
	public AdminVO selectAdminById(String loginId) throws SQLException {
		AdminVO admin = session.selectOne("Admin-Mapper.selectAdminById", loginId);
		return admin;
	}

	@Override
	public int selectAdminEmailCheck(String adminEmail) throws SQLException {

		return session.selectOne("Admin-Mapper.selectAdminEmailCheck", adminEmail);
	}

	@Override
	public void updateAdminPwd(Map<String, String> map) throws SQLException {
		session.selectOne("Admin-Mapper.updateAdminPwd", map);
		
	}
}
