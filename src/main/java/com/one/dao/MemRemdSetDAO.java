package com.one.dao;

import java.sql.SQLException;

import com.one.dto.MemberRemindSetVO;

public interface MemRemdSetDAO {

	public MemberRemindSetVO selectMemRemdSetByMemEmail(String memEmail) throws SQLException;
	
	public void insertMemRemdSetForUser(String memEmail) throws SQLException;
	
	public void insertMemRemdSetForHead(String memEmail) throws SQLException;
	
	public void updateReportDlFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void updateIntrClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void updateRealtimeClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void updateDutyClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void updateMsgFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void updateReportChkFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	
	
}
