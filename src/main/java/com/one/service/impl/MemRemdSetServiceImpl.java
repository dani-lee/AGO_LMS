package com.one.service.impl;

import java.sql.SQLException;

import com.one.dao.MemRemdSetDAO;
import com.one.dto.MemberRemindSetVO;
import com.one.service.MemRemdSetService;

public class MemRemdSetServiceImpl implements MemRemdSetService{

	private MemRemdSetDAO memRemdSetDAO;
	public void setMemRemdSetDAO(MemRemdSetDAO memRemdSetDAO) {
		this.memRemdSetDAO = memRemdSetDAO;
	}

	@Override
	public MemberRemindSetVO getMemRemdSetByMemEmail(String memEmail) throws SQLException {
		MemberRemindSetVO memAlarm = memRemdSetDAO.selectMemRemdSetByMemEmail(memEmail);
		return memAlarm;
	}

	@Override
	public void registMemRemdSetForUser(String memEmail) throws SQLException {
		memRemdSetDAO.insertMemRemdSetForUser(memEmail);
	}

	@Override
	public void regisetMemRemdSetForHead(String memEmail) throws SQLException {
		memRemdSetDAO.insertMemRemdSetForHead(memEmail);
	}

	@Override
	public void modifyReportDlFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateReportDlFlag(memRemdSetVO);
	}

	@Override
	public void modifyIntrClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateIntrClFlag(memRemdSetVO);
	}

	@Override
	public void modifyRealtimeClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateRealtimeClFlag(memRemdSetVO);
	}

	@Override
	public void modifyDutyClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateDutyClFlag(memRemdSetVO);
	}

	@Override
	public void modifyMsgFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateMsgFlag(memRemdSetVO);
	}

	@Override
	public void modifyReportChkFlag(MemberRemindSetVO memRemdSetVO) throws SQLException {
		memRemdSetDAO.updateReportChkFlag(memRemdSetVO);
	}

	
}
