package com.one.scheduler;

import java.sql.SQLException;

import com.one.service.scheduler.ScheduledManagementClassService;

public class UpdateMemClStatusScheduler {

	private ScheduledManagementClassService scheduledManagementClassService;
	public void setScheduledManagementClassService(ScheduledManagementClassService scheduledManagementClassService) {
		this.scheduledManagementClassService = scheduledManagementClassService;
	}
	
	public void updateMemClStatus() throws SQLException{
		scheduledManagementClassService.updateMemClStatus();
	}
	
}
