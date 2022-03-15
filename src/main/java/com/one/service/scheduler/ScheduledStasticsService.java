package com.one.service.scheduler;

import java.sql.SQLException;
import java.util.List;

import com.one.command.DstcsCommand;
import com.one.dto.ClassVO.ClassStasticsVO;

public interface ScheduledStasticsService {

	public List<ClassStasticsVO> getStasticsClassInfos() throws SQLException;

	public void updateStcsClInfo() throws SQLException;
	
	public List<ClassStasticsVO> getClassInfoByDpId(String dpId) throws SQLException;
	
	public void updateStcsDp(DstcsCommand dstcsCMD) throws SQLException;
}
