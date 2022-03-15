package com.one.service;

import java.sql.SQLException;

import com.one.dto.MemberRemindSetVO;

public interface MemRemdSetService {

	public MemberRemindSetVO getMemRemdSetByMemEmail(String memEmail) throws SQLException;
	
	public void registMemRemdSetForUser(String memEmail) throws SQLException;
	
	public void regisetMemRemdSetForHead(String memEmail) throws SQLException;
	
	public void modifyReportDlFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void modifyIntrClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void modifyRealtimeClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void modifyDutyClFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void modifyMsgFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
	public void modifyReportChkFlag(MemberRemindSetVO memRemdSetVO) throws SQLException;
}
