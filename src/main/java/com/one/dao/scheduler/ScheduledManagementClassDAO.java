package com.one.dao.scheduler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.dto.MemberClVO;
import com.one.dto.ClassVO.ClassListVO;


public interface ScheduledManagementClassDAO {

	public List<Integer> selectMainExposureClassList()throws SQLException;
	
	public void updateMainExposre(Map<String, Object> dataMap)throws SQLException;

	public List<Integer>selectOpenClassExpired() throws SQLException;
	
	public void deleteLikeClassExpired(Map<String, Object> dataMap) throws SQLException;

	public List<MemberClVO> selectIncompletedList() throws SQLException;
	
	public void updateMemClStatus(Map<String, Object> dataMap)throws SQLException;

}


