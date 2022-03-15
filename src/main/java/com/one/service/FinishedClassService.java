package com.one.service;

import java.sql.SQLException;
import java.util.Map;

import com.one.command.ExtReportCommand;
import com.one.command.MemberCriteria;
import com.one.dto.ExtReportVO;
import com.one.dto.IntReportVO;
import com.one.dto.ClassVO.ClassReviewVO;

public interface FinishedClassService {
	
	// 내부강의
	public Map<String, Object> getIntFinishedClassList(MemberCriteria mCri, String memId) throws Exception;
	
	// 외부 강의
	public Map<String, Object> getExtFinishedClassList(MemberCriteria mCri, String memId) throws Exception;
	
	// 내부 보고서
	public IntReportVO getIntReport(int memClNo) throws Exception;
	
	// 내부 보고서 작성
	public IntReportVO getIntReportInsertForm(int memClNo) throws Exception;
	
	// 내부 보고서 등록
	public void registIntReport(IntReportVO intreport) throws SQLException;
	
	// 외부 보고서
	public ExtReportVO getExtReport(int extNo) throws Exception;
	
	// 외부 보고서 등록
	public void registExtReport(ExtReportVO extReport) throws SQLException;
	
	// 수강후기 등록
	public void registClassReview(ClassReviewVO myReview) throws Exception;
	
	// 수강후기 등록 폼
	public ClassReviewVO getIntClassReviewForm(int memClNo) throws SQLException;
	
	// 수강내역 외부보고서 등록
	public void registExtReportUsingCompleted(ExtReportVO extReport) throws SQLException;
	
	// HRD 삭제
	public void deleteHRDByExtNo(ExtReportCommand ext) throws SQLException;
	
	//외부수료증 수정
	public void modifyExtReport(ExtReportVO ext) throws SQLException;
	
}
