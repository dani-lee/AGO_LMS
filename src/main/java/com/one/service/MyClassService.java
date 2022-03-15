package com.one.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.ExtReportCommand;
import com.one.command.ExtReportCommand2;
import com.one.command.MemberClassCommand;
import com.one.command.MemberCriteria;
import com.one.command.MemberStudyClassCommand;
import com.one.command.ReportCommand;
import com.one.command.TestCommand;
import com.one.dto.MemberClVO;
import com.one.dto.MemberVO;
import com.one.dto.ClassVO.TestVO;

public interface MyClassService {

	public List<MemberStudyClassCommand> selectStudyClassList(String memEmail) throws SQLException;

	public List<ReportCommand> selectFinishClassList(String memEmail) throws SQLException;

	public Map<String, Object> selectMyClassMain(String memEmail) throws SQLException;

	public Map<String, Object> selectListMyStudyingClass(MemberCriteria cri) throws SQLException;

	public String getClassUploadPath() throws IOException;

	public void modifyMemCLByQrScan(MemberClVO memberCL) throws SQLException;

	public void regisetMemChap(MemberClVO memberCL) throws SQLException;

	public void modifyMemChap(MemberClVO memberCL) throws SQLException;

	public Map<String, Object> getMemberClList(MemberCriteria cri, String email) throws SQLException;

	public Map<String, Object> getExtList(MemberCriteria cri, String email) throws SQLException;

	public Map<String, Object> getExtReportList(MemberCriteria cri, String email) throws SQLException;

	public int getmemClNoByOpcl(MemberClassCommand memClassCMD) throws SQLException;

	public void modifyMemCLProgRate(MemberClVO memberCL) throws SQLException;

	public int getClChapterCnt(String clCode) throws SQLException;

	public Map<String, Object> readExam(String fileName) throws Exception;

	public int checkExam(TestCommand testCMD) throws Exception;

	public void modifyMidTestSco(MemberClVO memberCL) throws SQLException;

	public void modifyFinTestSco(MemberClVO memberCL) throws SQLException;

	public MemberClVO getMemCLByOpclAndEmail(MemberClVO memberCL) throws SQLException;

	public void modifyTestCpl(MemberClVO memberCL) throws SQLException;

	public void modifyStudyCpl(MemberClVO memberCL) throws SQLException;

	public void modifyStudyCplWithoutCtfDate(MemberClVO memberCL) throws SQLException;

	public void insertLog(MemberVO loginUser, Map<String, String> dataMap) throws SQLException, IOException;
	
	public ExtReportCommand2 getExtReportListByExtNo(String extNo) throws SQLException;
	
	public void modifyMemClState(MemberClVO memberCL) throws SQLException;
	
	public TestVO getTestByOpcl(int opcl) throws SQLException;
}
