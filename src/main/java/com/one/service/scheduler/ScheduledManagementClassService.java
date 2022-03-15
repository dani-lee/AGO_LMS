package com.one.service.scheduler;

import java.sql.SQLException;
import java.util.List;


public interface ScheduledManagementClassService {

	public List<Integer> getMainExposureClassList()throws SQLException;
	
	public void updateMainExposure()throws SQLException;
	
	public void deleteExpiredLikeClasses()throws SQLException;

	public void updateMemClStatus()throws SQLException;
}
