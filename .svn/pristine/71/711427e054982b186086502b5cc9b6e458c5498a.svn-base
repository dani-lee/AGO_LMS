package com.one.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.ExamRegistCommand;
import com.one.dto.ManageExamVO;
import com.one.dto.ClassVO.TestVO;

public interface ExamManagementService {

	public Map<String, Object> getManageExamList(Criteria cri)throws SQLException;
	
	public Map<String, Object> getNoExamClassList(Criteria cri) throws SQLException;
	
	public ManageExamVO getExamInfoDetail(String clCode) throws SQLException;

	public Map<String, Object> readExam(String fileName) throws Exception;

	public String getExcelTempPath() throws IOException;
	
	public void registExamFile(ExamRegistCommand examCMD)throws SQLException;
	
	public TestVO getTestInfo(int opcl) throws SQLException;
}
