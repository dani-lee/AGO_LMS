package com.one.dao.scheduler.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.one.dao.scheduler.ScheduledManagementClassDAO;
import com.one.dto.MemberClVO;
import com.one.dto.ClassVO.ClassListVO;

public class ScheduleManagementClassDAOImpl implements ScheduledManagementClassDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<Integer> selectMainExposureClassList() throws SQLException {
		return session.selectList("Class-Mapper.selectMainExposureClass");
	}


	@Override
	public void updateMainExposre(Map<String, Object> dataMap) throws SQLException {
		session.update("Class-Mapper.updateMainExposre", dataMap);
	}


	@Override
	public List<Integer> selectOpenClassExpired() throws SQLException {
		return session.selectList("LikeClass-Mapper.selectOpenClassExpired");
	}


	@Override
	public void deleteLikeClassExpired(Map<String, Object> dataMap) throws SQLException {
		session.delete("LikeClass-Mapper.deleteLikeClassExpired", dataMap);
	}


	@Override
	public List<MemberClVO> selectIncompletedList() throws SQLException {
		return session.selectList("MyClass-Mapper.selectIncompletedList");
	}


	@Override
	public void updateMemClStatus(Map<String, Object> dataMap) throws SQLException {
		session.update("MyClass-Mapper.updateMemClStatus", dataMap);
	}

}
