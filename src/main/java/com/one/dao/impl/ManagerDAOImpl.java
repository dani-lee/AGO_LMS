package com.one.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.one.dao.ManagerDAO;
import com.one.dto.ManagerVO;

public class ManagerDAOImpl implements ManagerDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public ManagerVO selectManager(String managerId) throws SQLException {
		ManagerVO manager = session.selectOne("Manager-Mapper.selectManager", managerId);
		return manager;
	}

	@Override
	public ManagerVO selectManager() throws SQLException {
		ManagerVO manager = session.selectOne("Manager-Mapper.selectManager");
		return manager;
	}

	


}
