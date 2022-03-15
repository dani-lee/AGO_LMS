package com.one.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.ExamCommand;
import com.one.dto.ExamStastisDetailVO;
import com.one.dto.ExamStatisVO;

public interface ExamStatisDAO {

	public List<ExamStatisVO> selectExamStatisList(Criteria cri) throws SQLException;
	
	public List<ExamStatisVO> selectOnlyExamList() throws SQLException;
	
	public int countExamStatisList() throws SQLException;
	
	public ExamStastisDetailVO selectStatisDetail(int opcl) throws SQLException;
	
	// 수강인원
	public int countClassStudent(int opcl) throws SQLException;
	
	public int countStudentScore(ExamStastisDetailVO examDetail) throws SQLException;
	
	
	//중간 점수
	public String selectMidScoreAvg(int opcl)throws SQLException;
	
	//기말 점수 
	public String selectFinScoreAvg(int opcl) throws SQLException;
	
	//평균 점수 업데이트
	public void updateFinScoreAvg(ExamStatisVO examInfo) throws SQLException;
	
	public void updateBothScoreAvg(ExamStatisVO examInfo) throws SQLException;
}
