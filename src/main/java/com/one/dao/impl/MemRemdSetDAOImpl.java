package com.one.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.one.dao.MemRemdSetDAO;
import com.one.dto.MemberRemindSetVO;

public class MemRemdSetDAOImpl implements MemRemdSetDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public MemberRemindSetVO selectMemRemdSetByMemEmail(String memEmail) throws SQLException {
		MemberRemindSetVO memAlarm = session.selectOne("MemRemdSet-Mapper.selectMemRemdSetByMemEmail", memEmail);
		return memAlarm;
	}

	@Override
	public void insertMemRemdSetForUser(String memEmail) throws SQLException {
		session.update("MemRemdSet-Mapper.insertMemRemdSetForUser", memEmail);
	}

	@Override
	public void insertMemRemdSetForHead(String memEmail) throws SQLException {
		session.update("MemRemdSet-Mapper.insertMemRemdSetForHead", memEmail);
	}

	@Override
	public void updateReportDlFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateReportDlFlag", memRemdSetVO);
	}

	@Override
	public void updateIntrClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateIntrClFlag", memRemdSetVO);
	}

	@Override
	public void updateRealtimeClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateRealtimeClFlag", memRemdSetVO);
	}

	@Override
	public void updateDutyClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateDutyClFlag", memRemdSetVO);
	}

	@Override
	public void updateMsgFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateMsgFlag", memRemdSetVO);
	}

	@Override
	public void updateReportChkFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		session.update("MemRemdSet-Mapper.updateReportChkFlag", memRemdSetVO);
	}

}
