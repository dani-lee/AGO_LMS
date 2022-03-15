package com.one.dao.scheduler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.DstcsCommand;
import com.one.dto.ClassVO.ClassStasticsVO;

public interface ScheduledStasticsDAO {

	public List<ClassStasticsVO> selectStasticsClassInfo1()throws SQLException;
	
	public List<ClassStasticsVO> selectStasticsClassInfo2()throws SQLException;
	
	public void updateStcsCl(Map<String, Object> paramMap) throws SQLException;
	
	public List<ClassStasticsVO> selectClassInfoByDpId(String dpId) throws SQLException;
	
	public void updateStcsDp(DstcsCommand dstcsCMD) throws SQLException;
}
