package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.command.ExamRegistCommand;
import com.one.dto.ManageExamVO;
import com.one.dto.ClassVO.TestVO;

public interface ExamManagementDAO {

	//등록된 시험 전체 목록
	public List<ManageExamVO> selectManagementExamList(Criteria cri)throws SQLException;
	
	public int selectManagementExamListCount(Criteria cri) throws SQLException;
	//시험 미등록된 목록
	public List<ManageExamVO> selectNoExamClass(Criteria cri)throws SQLException;
	
	public int selectNoExamClassCount(Criteria cri)throws SQLException;
	//시험 정보 상세
	public ManageExamVO selectExamInfo(String clCode) throws SQLException;
	
	public void updateExamFileInfo(ExamRegistCommand examCMD)throws SQLException;

	//등록된 시험 정보 가져오기
	public TestVO selectTestInfo(int opcl) throws SQLException;
}
