package com.one.service.scheduler.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hpsf.Array;

import com.one.dao.scheduler.ScheduledManagementClassDAO;
import com.one.dto.MemberClVO;
import com.one.dto.ClassVO.ClassListVO;
import com.one.service.scheduler.ScheduledManagementClassService;

public class ScheduledManagementClassServiceImpl implements ScheduledManagementClassService {

	private ScheduledManagementClassDAO scheduledManagementClassDAO;
	public void setScheduledManagementClassDAO(ScheduledManagementClassDAO scheduledManagementClassDAO) {
		this.scheduledManagementClassDAO = scheduledManagementClassDAO;
	}

	@Override
	public List<Integer> getMainExposureClassList() throws SQLException {
		List<Integer> classList = scheduledManagementClassDAO.selectMainExposureClassList();
		
		return classList;
	}

	@Override
	public void updateMainExposure() throws SQLException {
		List<Integer> classList = getMainExposureClassList();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("opcl", classList);
		if(classList.size() != 0) {
			scheduledManagementClassDAO.updateMainExposre(dataMap);
		}
		
	}

	@Override
	public void deleteExpiredLikeClasses() throws SQLException {
		List<Integer> classList = scheduledManagementClassDAO.selectOpenClassExpired();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("opcl", classList);
		if(classList.size() != 0) {
			scheduledManagementClassDAO.deleteLikeClassExpired(dataMap);
		}
		
		
	}

	@Override
	public void updateMemClStatus() throws SQLException {
		List<MemberClVO> IncompledList = scheduledManagementClassDAO.selectIncompletedList();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memclInfo", IncompledList);
		
		scheduledManagementClassDAO.updateMemClStatus(dataMap);
	}
	
	

}
