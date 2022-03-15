package com.one.service.impl;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.one.command.ExtReportCommand;
import com.one.command.MemberCriteria;
import com.one.command.PageMaker;
import com.one.dao.CommonDAO;
import com.one.dao.FinishedClassDAO;
import com.one.dto.CommonVO;
import com.one.dto.ExtReportVO;
import com.one.dto.FinishedClassVO;
import com.one.dto.IntReportVO;
import com.one.dto.ClassVO.ClassReviewVO;
import com.one.service.FinishedClassService;

public class FinishedClassServiceImpl implements FinishedClassService {

	private FinishedClassDAO finishedClassDAO;

	public void setFinishedClassDAO(FinishedClassDAO finishedClassDAO) {
		this.finishedClassDAO = finishedClassDAO;
	}

	private CommonDAO commonDAO;

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	@Override
	public Map<String, Object> getIntFinishedClassList(MemberCriteria mCri, String memId) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<FinishedClassVO> intClassList = finishedClassDAO.selectIntFinishedClassList(mCri);
		ClassReviewVO myInfoSet = new ClassReviewVO();
		int cnt = 0;

		myInfoSet.setMemId(memId);

		for (FinishedClassVO finishedClass : intClassList) {

			if (finishedClass.getCtfDate() != null) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(finishedClass.getCtfDate());

				cal.add(Calendar.DATE, 7); // 7일 더하기
				intClassList.get(cnt).setReportDeadLine(cal.getTime());

				cal.setTime(finishedClass.getCtfDate());
				cal.add(Calendar.DATE, 15); // 15일 더하기
				intClassList.get(cnt).setReviewDeadLine(cal.getTime());
			}
			IntReportVO intReport = finishedClassDAO.selectIntReport(finishedClass.getMemClNo());
			if (intReport != null) {
				String intStateName = commonDAO.selectPositionByKeyword(intReport.getIntState());
				intReport.setIntStateName(intStateName);
			}

			myInfoSet.setOpcl(finishedClass.getOpcl());
			ClassReviewVO myReview = finishedClassDAO.selectIntClassReview(myInfoSet);

			intClassList.get(cnt).setIntReport(intReport);
			intClassList.get(cnt).setClassReview(myReview);

			cnt++;
		}

		int totalCount = finishedClassDAO.countIntClass(mCri.getMemEmail());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(mCri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("intClassList", intClassList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getExtFinishedClassList(MemberCriteria mCri, String memId) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<FinishedClassVO> extClassList = finishedClassDAO.selectExtFinishedClassList(mCri);
		int cnt = 0;
		for (FinishedClassVO finishedClass : extClassList) {
			ExtReportVO extReport = finishedClassDAO.selectExtReport(finishedClass.getExtNo());
			if (extReport != null)
				extReport.setExtStateName(commonDAO.selectPositionByKeyword(extReport.getExtState()));
			
			if (finishedClass.getCtfDate() != null) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(finishedClass.getCtfDate());

				cal.add(Calendar.DATE, 7); // 7일 더하기
				extClassList.get(cnt).setReportDeadLine(cal.getTime());

				cal.setTime(finishedClass.getCtfDate());
				cal.add(Calendar.DATE, 15); // 15일 더하기
				extClassList.get(cnt).setReviewDeadLine(cal.getTime());
			}
			
			finishedClass.setExtReport(extReport);
			cnt++;
		}

		int totalCount = finishedClassDAO.countExtClass(mCri.getMemEmail());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(mCri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("extClassList", extClassList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public IntReportVO getIntReport(int memClNo) throws Exception {
		IntReportVO report = finishedClassDAO.selectIntReport(memClNo);
		if(report != null) {
			CommonVO common = commonDAO.selectCommonByCommonCode(report.getClCate());
			report.setClCateName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getDpId());
			report.setDpName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getPositionId());
			report.setPositionName(common.getCodeName1());
		}

		return report;
	}

	@Override
	public ExtReportVO getExtReport(int extNo) throws Exception {
		ExtReportVO report = finishedClassDAO.selectExtReport(extNo);
		
		if(report != null) {
			CommonVO common = commonDAO.selectCommonByCommonCode(report.getExtState());
			report.setExtStateName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getDpId());
			report.setDpName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getPositionId());
			report.setPositionName(common.getCodeName1());
		}

		return report;
	}

	@Override
	public IntReportVO getIntReportInsertForm(int memClNo) throws Exception {
		IntReportVO report = finishedClassDAO.selectIntReportInsertForm(memClNo);
		if(report != null) {
			CommonVO common = commonDAO.selectCommonByCommonCode(report.getClCate());
			report.setClCateName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getDpId());
			report.setDpName(common.getCodeName1());
			
			common = commonDAO.selectCommonByCommonCode(report.getPositionId());
			report.setPositionName(common.getCodeName1());
		}
		return report;
	}

	@Override
	public void registIntReport(IntReportVO intreport) throws SQLException {
		if(intreport.getIntNo() != 0) {
			finishedClassDAO.updateIntReport(intreport);
		}else {
			finishedClassDAO.insertIntReport(intreport);
		}
	}

	@Override
	public void registClassReview(ClassReviewVO myReview) throws Exception {
		finishedClassDAO.insertClassReview(myReview);
	}

	@Override
	public void registExtReport(ExtReportVO extReport) throws SQLException {
		if(extReport.getExtNo() == 0) {
			finishedClassDAO.insertExtReport(extReport);
			finishedClassDAO.updateExtNo(extReport);
		}else {
			finishedClassDAO.updateExtReport(extReport);
		}
	}
	@Override
	public void registExtReportUsingCompleted(ExtReportVO extReport) throws SQLException {
		int extNo = finishedClassDAO.insertExtReport(extReport);
		
	}

	@Override
	public ClassReviewVO getIntClassReviewForm(int memClNo) throws SQLException {
		return finishedClassDAO.selectIntClassReviewForm(memClNo);
	}

	@Override
	public void deleteHRDByExtNo(ExtReportCommand ext) throws SQLException {
		finishedClassDAO.deleteHRDByExtNo(ext);
	}

	@Override
	public void modifyExtReport(ExtReportVO ext) throws SQLException {
		finishedClassDAO.updateExtReport(ext);
		
	}



}
