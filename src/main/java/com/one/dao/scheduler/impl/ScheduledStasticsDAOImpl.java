package com.one.dao.scheduler.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.one.command.DstcsCommand;
import com.one.dao.scheduler.ScheduledStasticsDAO;
import com.one.dto.ClassVO.ClassStasticsVO;

public class ScheduledStasticsDAOImpl implements ScheduledStasticsDAO{

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public List<ClassStasticsVO> selectStasticsClassInfo1() throws SQLException {
		return session.selectList("Stastics-Mapper.selectStasticsClassInfo1");
	}

	@Override
	public List<ClassStasticsVO> selectStasticsClassInfo2() throws SQLException {
		return session.selectList("Stastics-Mapper.selectStasticsClassInfo2");
	}


	@Override
	public void updateStcsCl(Map<String, Object> paramMap) throws SQLException {
		session.update("Stastics-Mapper.updateStcsCl", paramMap);
		
	}


	@Override
	public List<ClassStasticsVO> selectClassInfoByDpId(String dpId) throws SQLException {
		return session.selectList("Stastics-Mapper.selectClassInfoByDpId", dpId);
	}


	@Override
	public void updateStcsDp(DstcsCommand dstcsCMD) throws SQLException {
		session.update("Stastics-Mapper.updateStcsDp", dstcsCMD);
		
	}

}
