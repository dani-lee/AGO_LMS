package com.one.service.impl;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.configuration2.sync.SynchronizerSupport;

import com.one.command.DpFavClassCommand;
import com.one.command.MemberClassCommand;
import com.one.command.MemberCriteria;
import com.one.command.MemberStudyClassCommand;
import com.one.command.ReportCommand;
import com.one.dao.ClassDAO;
import com.one.dao.CommonDAO;
import com.one.dao.DpOrderDAO;
import com.one.dao.FinishedClassDAO;
import com.one.dao.ManagerDAO;
import com.one.dao.MemberDAO;
import com.one.dao.MyClassDAO;
import com.one.dao.NoticeDAO;
import com.one.dto.DepartmentVO;
import com.one.dto.DpHeadVO;
import com.one.dto.ExcelDTO;
import com.one.dto.ExtReportVO;
import com.one.dto.FinishedClassVO;
import com.one.dto.IntReportVO;
import com.one.dto.ManagerVO;
import com.one.dto.MemberClVO;
import com.one.dto.MemberRemindSetVO;
import com.one.dto.MemberRemindVO;
import com.one.dto.MemberVO;
import com.one.dto.NewRemindCheckVO;
import com.one.dto.NoticeVO;
import com.one.dto.ClassVO.ClassListVO;
import com.one.dto.ClassVO.ClassVO;
import com.one.service.MemberService;
import com.one.utils.ExcelUtil;
import com.one.utils.JsTreeJsonConversion;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	private ManagerDAO managerDAO;
	private CommonDAO commonDAO;
	private MyClassDAO myClassDAO;
	private ClassDAO classDAO;
	private NoticeDAO noticeDAO;
	private FinishedClassDAO finishedClassDAO;
	private DpOrderDAO dpOrderDAO;

	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	public void setMyClassDAO(MyClassDAO myClassDAO) {
		this.myClassDAO = myClassDAO;
	}
	public void setClassDAO(ClassDAO classDAO) {
		this.classDAO = classDAO;
	}
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	public void setFinishedClassDAO(FinishedClassDAO finishedClassDAO) {
		this.finishedClassDAO = finishedClassDAO;
	}
	public void setDpOrderDAO(DpOrderDAO dpOrderDAO) {
		this.dpOrderDAO = dpOrderDAO;
	}
	@Override
	public MemberVO getMember(String memId) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(memId);
		return member;
	}

	@Override
	public MemberVO getMemberByEmail(String memEmail) throws SQLException {
		MemberVO member = memberDAO.selectMemberByEmail(memEmail);
		return member;
	}

	@Override
	public List<Map<String, String>> getMemberByDpId(String dpId) throws Exception {
		List<Map<String, String>> jsonData = null;
		List<MemberVO> memberList = memberDAO.selectMemberByDpId(dpId);

		jsonData = JsTreeJsonConversion.conversion(memberList);

		return jsonData;
	}

	@Override
	public List<Map<String, String>> getMemberByDpIdNoIcon(String dpId) throws Exception {
		List<Map<String, String>> jsonData = null;
		List<MemberVO> memberList = memberDAO.selectMemberByDpId(dpId);

		jsonData = JsTreeJsonConversion.NoIconConversion(memberList);

		return jsonData;
	}

	@Override
	public List<Map<String, String>> getMemberClByOpcl(int opcl) throws Exception {
		List<Map<String, String>> jsonData = null;
		List<MemberClVO> memberClList = memberDAO.selectMemberClByOpcl(opcl);
		for (MemberClVO memberCl : memberClList) {
			memberCl.changeId();
		}
		jsonData = JsTreeJsonConversion.NoIconConversion(memberClList);

		return jsonData;
	}

	@Override
	public void insertIdAndPwd(MemberVO member) throws SQLException {
		memberDAO.insertIdAndPwd(member);

	}

	@Override
	public Map<String, Object> getManagerByEmail(String memEmail) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		MemberVO member = memberDAO.selectMemberByEmail(memEmail);
		ManagerVO manager = managerDAO.selectManager();

		dataMap.put("member", member);
		dataMap.put("manager", manager);

		return dataMap;
	}

	@Override
	public void registMember(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);
	}

	@Override
	public void registMembersFromExcel(File uploadFile) throws IOException, SQLException {

		ExcelDTO excelDTO = new ExcelDTO();

		// 파일경로 추가
		excelDTO.setFilePath(uploadFile.getAbsolutePath());
		// 컬럼명 추가
		excelDTO.setOutputColumns("A", "B", "C", "D", "E", "F", "G", "H");
		// 시작행
		excelDTO.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelUtil.read(excelDTO);
		System.out.println("List                     : " + excelContent);

		for (Map<String, String> map : excelContent) {
			for (String key : map.keySet()) {
				if (key.equals("E")) {
					String ps = commonDAO.selectPositionByKeyword(map.get("E"));
					map.put("E", ps);
				}

				if (key.equals("F")) {
					String dp = commonDAO.selectPositionByKeyword(map.get("F"));
					map.put("F", dp);
				}

				if (key.equals("G")) {
					String auth = commonDAO.selectPositionByKeyword(map.get("G"));
					map.put("G", auth);
				}

				if (key.equals("H")) {
					String status = commonDAO.selectPositionByKeyword(map.get("H"));
					map.put("H", status);
				}
			}
		}

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("excelContent", excelContent);

		System.out.println(paramMap);

		try {
			memberDAO.insertMembers(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Map<String, Object> getMemberDetail(String memEmail) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 해당 회원에 대한 회원 정보
		MemberVO member = memberDAO.selectMemberByEmail(memEmail);

		// 해당 회원의 수강내역에 대한 정보
		List<MemberClassCommand> classList = memberDAO.selectMemberClassList(memEmail);
		for (int i = 0; i < classList.size(); i++) {
			int opcl = classList.get(i).getOpcl();
			ClassVO memClass = memberDAO.selectMemberClassName(opcl);
			classList.get(i).setClName(memClass.getClName());
			classList.get(i).setClCode(memClass.getClCode());

		}
		List<DepartmentVO> departmentList = memberDAO.selectMemberDepartment();
		List<DepartmentVO> positionList = memberDAO.selectMemberPosition();
		List<DepartmentVO> authorityList = memberDAO.selectMemberAuthority();
		/* System.out.println("----------------------"+classList.get(0).getClCode()); */
		dataMap.put("member", member);
		dataMap.put("classList", classList);
		dataMap.put("departmentList", departmentList);
		dataMap.put("positionList", positionList);
		dataMap.put("authorityList", authorityList);
		return dataMap;
	}

	@Override
	public void updateMemberAuthority(MemberVO member) throws SQLException {
		memberDAO.updateMemberAuthority(member);

	}

	@Override
	public void modifyMemberPwd(MemberVO member) throws SQLException {
		memberDAO.updateMemberPwd(member);

	}

	@Override
	public List<DepartmentVO> selectMemberDepartment() throws SQLException {
		List<DepartmentVO> department = memberDAO.selectMemberDepartment();
		return department;
	}

	@Override
	public void modifyPwdById(MemberVO member) throws SQLException {
		memberDAO.updatePwdById(member);
	}

	@Override
	public Map<String, Object> getMemberMainInfo(MemberCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<>();

		// 학습중인 강의
		List<MemberStudyClassCommand> myClassList = myClassDAO.selectListStudyingClass(cri);
		int myClassListCount = myClassDAO.selectListStudyingClassCount(cri);

		// 필수강의
		List<MemberStudyClassCommand> essentialList = myClassDAO.selectMemEssentialList(cri.getMemEmail());

		// 종료된강의
		List<ReportCommand> finishClassList = myClassDAO.selectFinishClass(cri.getMemEmail());
		for (int i = 0; i < finishClassList.size(); i++) {
			IntReportVO report = finishedClassDAO.selectIntReport(finishClassList.get(i).getMemClNo());

			if (report != null) {
				finishClassList.get(i).setIntNo(report.getIntNo());
				finishClassList.get(i).setMemClNo(report.getMemClNo());
				finishClassList.get(i).setOpcl(report.getOpcl());
				finishClassList.get(i).setEduContent(report.getEduContent());
				finishClassList.get(i).setEduReview(report.getEduReview());
				finishClassList.get(i).setIntState(report.getIntState());
				finishClassList.get(i).setIntDate(report.getIntDate());
			}

			if (finishClassList.get(i).getdDate() != null) {
				Date endDate = new Date(finishClassList.get(i).getdDate().getTime());
				Date today = new Date(System.currentTimeMillis());
				long calculate = endDate.getTime() - today.getTime();
				int dDays = (int) (calculate / (24 * 60 * 60 * 1000)) + 1;
				finishClassList.get(i).setdDays(dDays);
			}
		}

		// 공지사항
		List<NoticeVO> importantNoticeList = noticeDAO.selectImportantNoticeList(cri);
		importantNoticeList.remove(2);
		List<NoticeVO> noticeList = noticeDAO.selectNomalNoticeList(cri);

		// 메인 노출 강의
		List<ClassListVO> mainEPList = classDAO.selectMainEPList();
		
		
		//부서장 수강 지시 강의
		//부서장 지시 목록
		List<DpHeadVO> memDpOdList = dpOrderDAO.selectMemDpOdList(cri.getMemEmail());
		
		//지시 목록에 대한 강의 정보
		List<DpFavClassCommand> dpClassInfoList = new ArrayList<>();
		for(DpHeadVO memDpOd : memDpOdList) {
			DpFavClassCommand dpClassInfo = dpOrderDAO.selectDpClass(memDpOd.getOpcl());
			dpClassInfoList.add(dpClassInfo);
		}

		dataMap.put("myClassList", myClassList);
		dataMap.put("myClassListCount", myClassListCount);
		dataMap.put("essentialList", essentialList);
		dataMap.put("finishClassList", finishClassList);
		dataMap.put("importantNoticeList", importantNoticeList);
		dataMap.put("noticeList", noticeList);
		dataMap.put("mainEPList", mainEPList);
		dataMap.put("dpClassInfoList", dpClassInfoList);

		return dataMap;
	}

	@Override
	public boolean memberStatusChk(MemberVO member) throws SQLException {
		boolean statusChk = false;

		String status = memberDAO.memberStatusChk(member);

		if (status != null && status.equals("A401"))
			statusChk = true;
		else
			statusChk = false;
		return statusChk;
	}

	@Override
	public MemberRemindSetVO getMemberRemindSet(String memEmail) throws SQLException {
		return memberDAO.selectMemberRemindSet(memEmail);
	}

	@Override
	public List<MemberRemindVO> getMemberNotReadRemind(String memEmail) throws SQLException {
		return memberDAO.selectMemberNotReadRemind(memEmail);
	}

	@Override
	public Map<String, Object> registMemberNewRemind(MemberVO loginUser, MemberRemindSetVO remindSet) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<>();
		
		// 관심 강의 마감일 알람 가야 하는 것들
		List<NewRemindCheckVO> intrClassList = memberDAO.selectMemberIntrClass(loginUser.getMemEmail());
		
		// 오늘 실시간 강의있는 경우 알림
		List<NewRemindCheckVO> realTimeClassList = memberDAO.selectMemberRealTimeClass(loginUser.getMemEmail());
		
		// 보고서 마감 알림 (3일전)
		List<FinishedClassVO> emergencyReportList = new ArrayList<>();
		List<FinishedClassVO> intCtfClassList = memberDAO.selectMemberIntCtfClass(loginUser.getMemEmail());
		if(intCtfClassList != null) {
			int cnt = 0;
			for(FinishedClassVO intCtfClass : intCtfClassList) {
				IntReportVO intReport = finishedClassDAO.selectIntReport(intCtfClass.getMemClNo());
				if (intReport != null && intReport.getIntState().equals("B103")) {
					String intStateName = commonDAO.selectPositionByKeyword(intReport.getIntState());
					intReport.setIntStateName(intStateName);
					intCtfClassList.get(cnt).setIntReport(intReport);
					emergencyReportList.add(intCtfClassList.get(cnt));
				} else if(intReport == null) {
					intCtfClassList.get(cnt).setIntReport(intReport);
					emergencyReportList.add(intCtfClassList.get(cnt));
				}
				cnt++;
			}
		}
		
//		List<FinishedClassVO> extCtfClassList = memberDAO.selectMemberExtCtfClass(loginUser.getMemEmail());
//		if(extCtfClassList != null) {
//			int cnt = 0;
//			for(FinishedClassVO extCtfClass : extCtfClassList) {
//				ExtReportVO extReport = finishedClassDAO.selectExtReport(extCtfClass.getExtNo());
//				if (extReport != null && extReport.getExtState().equals("B103")) {
//					String extStateName = commonDAO.selectPositionByKeyword(extReport.getExtState());
//					extReport.setExtStateName(extStateName);
//					extCtfClassList.get(cnt).setExtReport(extReport);
//					emergencyReportList.add(extCtfClassList.get(cnt));
//				} else if(extReport == null) {
//					extCtfClassList.get(cnt).setExtReport(extReport);
//					emergencyReportList.add(extCtfClassList.get(cnt));
//				}
//				cnt++;
//			}
//		}
		
		
		// 부서장 밀린 보고서 결재
		int cnt = 0;
		cnt += memberDAO.countExtReport(loginUser.getDpId());
		cnt += memberDAO.countIntReport(loginUser.getDpId());
		
		int totalRemindCount = 0;
		if(remindSet != null) {
			if(remindSet.getIntrClFlag() == 1) {
				totalRemindCount += intrClassList.size();
			}
			if(remindSet.getRealtimeClFlag() == 1) {
				totalRemindCount += realTimeClassList.size();
			}
			if(remindSet.getReportDlFlag() == 1) {
				totalRemindCount += emergencyReportList.size();
			}
		}
		
		dataMap.put("totalRemindCount", totalRemindCount);
		dataMap.put("intrClassList", intrClassList);
		dataMap.put("realTimeClassList", realTimeClassList);
		dataMap.put("emergencyReportList", emergencyReportList);
		dataMap.put("reportCnt", cnt);
		
		return dataMap;
	}

}






































