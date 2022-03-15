package com.one.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.ClassReviewCommand;
import com.one.command.Criteria;
import com.one.command.CriteriaDpCommand;
import com.one.command.DepartmentHeadReportCommand;
import com.one.command.DepartmentMemberClassCommand;
import com.one.command.DpFavClassCommand;
import com.one.command.OrderCommand;
import com.one.command.PageMaker;
import com.one.command.ReportClassCommand;
import com.one.dao.ClassDAO;
import com.one.dao.DpOrderDAO;
import com.one.dto.CertificateVO;
import com.one.dto.DpHeadDashVO;
import com.one.dto.DpHeadVO;
import com.one.dto.ExtReportVO;
import com.one.dto.IntReportVO;
import com.one.dto.MemberCertificateVO;
import com.one.dto.OrderClassVO;
import com.one.dto.ClassVO.ClassChapterVO;
import com.one.dto.ClassVO.ClassListVO;
import com.one.service.DpOrderService;
import com.one.utils.JsTreeJsonConversion;

public class DpOrderServiceImpl implements DpOrderService {

	private DpOrderDAO dpOrderDAO;
	public void setDpOrderDAO(DpOrderDAO dpOrderDAO) {
		this.dpOrderDAO = dpOrderDAO;
	}

 
	@Override
	public Map<String, Object> selectDpClassList(CriteriaDpCommand cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DpFavClassCommand> dpClassList = dpOrderDAO.selectDpClassList(cri);
		List<DpFavClassCommand> favList = dpOrderDAO.selectDpFavClassList(cri.getDpId());
		List<DpFavClassCommand> realList = new ArrayList<DpFavClassCommand>();
		for(DpFavClassCommand dpClass : dpClassList) {
			dpClass.setCount(dpOrderDAO.selectDpClassMemberCount(dpClass.getOpcl()));
			for(int i = 0; i < favList.size(); i++) {
				if(favList.get(i).getOpcl() == dpClass.getOpcl()){
					dpClass.setFav(true);
				}
			}
		}
		
		int totalCount = dpClassList.size();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("dpClassList", dpClassList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//즐겨찾기 목록
	@Override
	public Map<String, Object> getFavList(CriteriaDpCommand cri) throws SQLException {
		
		return null;
	}

	@Override
	public Map<String, Object> selectDpClass(int opcl, String clCode) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		DpFavClassCommand dpClass = dpOrderDAO.selectDpClass(opcl);
		List<ClassChapterVO> chapterList = dpOrderDAO.selectClassChapter(clCode);
		List<ClassReviewCommand> reviewList = dpOrderDAO.selectClassReview(opcl);
		/*for(ClassReviewCommand review : reviewList) {
			System.out.println("################################[수강후기]" + review.getMemId());
		}*/
		
		dataMap.put("dpClass", dpClass);
		dataMap.put("chapterList", chapterList);
		dataMap.put("reviewList", reviewList);
		
		return dataMap;
	}


	@Override
	public List<Map<String, String>> selectFav(String dpId) throws Exception {
		List<Map<String, String>> jsonData = null;
		List<ClassListVO> classList = dpOrderDAO.selectDpHeadFav(dpId);

		jsonData = JsTreeJsonConversion.conversion(classList);

		return jsonData;
	}

	@Override
	public void registFav(DpHeadVO fav) throws SQLException {
		dpOrderDAO.insertDpHeadFav(fav);
	}

	@Override
	public void removeFav(DpHeadVO fav) throws SQLException {
		dpOrderDAO.deleteDpHeadFav(fav);
	}

	@Override
	public void DepartmentOrderOpcl(OrderCommand orderCmd, String dpId) throws SQLException {
		int odId = dpOrderDAO.getOdId();
		DpHeadVO order = null;

		order = new DpHeadVO();
		order.setDpId(dpId);
		order.setOdId(odId);
		order.setOdMsg(orderCmd.getOdMsg());

		dpOrderDAO.insertDpHeadOd(order);

		String[] className = orderCmd.getClassName();
		for (String opclStr : className) {
			int opcl = Integer.parseInt(opclStr);
			order.setOpcl(opcl);
			dpOrderDAO.insertDpOdOpcl(order);
		}

		String[] memberName = orderCmd.getMemberName();
		for (String memEmail : memberName) {
			order.setMemEmail(memEmail);
			dpOrderDAO.insertDpOdMem(order);
		}
	}


	@Override
	public Boolean favCheck(DpHeadVO fav) throws SQLException {
		int chk = dpOrderDAO.favCheck(fav);

		Boolean bool = false;
		if(chk > 0) {
			bool = true;
		}
		return bool;
	}


	@Override
	public Map<String, Object> selectReportList(Criteria cri, String department) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DepartmentHeadReportCommand> reportList = dpOrderDAO.selectReportList(cri, department);
		int totalCount = dpOrderDAO.selectReportCount(cri, department);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Criteria dashCri = new Criteria();
		dashCri.setSortType("f");
		List<DepartmentHeadReportCommand> finishReportList = dpOrderDAO.selectDashReportList(dashCri, department);
		dashCri.setSortType("r");
		List<DepartmentHeadReportCommand> returnReportList = dpOrderDAO.selectDashReportList(dashCri, department);
		
		dataMap.put("reportList", reportList);
		dataMap.put("finishReportList", finishReportList);
		dataMap.put("returnReportList", returnReportList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	

	@Override
	public Map<String, Object> selectOrderClassMain(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String department = cri.getSortType();
		List<OrderClassVO> orderClassList = dpOrderDAO.selectOrderClassList(department);
		for(OrderClassVO order : orderClassList) {
		}
		List<DpHeadDashVO> memberClassList = dpOrderDAO.selectDashMemberClassList(cri);
		for(DpHeadDashVO memberClass : memberClassList) {
		}
		dataMap.put("orderClassList", orderClassList);
		dataMap.put("memberClassList", memberClassList);
		
		return dataMap;
	}


	@Override
	public List<DepartmentMemberClassCommand> selectMemberClassList(String department, int opcl) throws SQLException {
		List<DepartmentMemberClassCommand> memberClassList = dpOrderDAO.selectMemberClassCheckList(department, opcl);
		
		return memberClassList;
	}


	@Override
	public Map<String, Object> selectIntReport(int no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		IntReportVO report = dpOrderDAO.selectIntReport(no);
		ReportClassCommand classInfo = dpOrderDAO.selectIntReportClass(report.getMemClNo());
		MemberCertificateVO memCertificate = dpOrderDAO.selectCretificateByEmail(report.getMemClNo()+"", classInfo.getMemEmail());
		CertificateVO certificate = dpOrderDAO.selectCertificate();
		
		dataMap.put("certificate", certificate);
		dataMap.put("memCertificate", memCertificate);
		dataMap.put("report", report);
		dataMap.put("classInfo", classInfo);
		
		return dataMap;
	}


	@Override
	public Map<String, Object> selectExtReport(int no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		ExtReportVO report = dpOrderDAO.selectExtReport(no);
		ReportClassCommand classInfo = dpOrderDAO.selectExtReportClass(no);
		
		dataMap.put("report", report);
		dataMap.put("classInfo", classInfo);
		
		return dataMap;
	}


	@Override
	public void updateReportApproval(String reType, int no, String memClNo, int opcl, String memEmail) throws SQLException {
		if(reType.equals("I")) {
			dpOrderDAO.updateIntReportApproval(no);
			int point = dpOrderDAO.selectClPoint(opcl);
			String email = dpOrderDAO.selectMemEmail(memClNo);
			
			Map<String, Object> map = new HashMap<>();
			map.put("point", point);
			map.put("memEmail", email);
			dpOrderDAO.updateMemCredit(map);
			
		}else {
			dpOrderDAO.updateExtReportApproval(no);

			Map<String, Object> map = new HashMap<>();
			map.put("point", 10);
			map.put("memEmail", memEmail);
			dpOrderDAO.updateMemCredit(map);
		}
		
	}


	@Override
	public void updateReportReturn(String reType, int no) throws SQLException {
		if(reType.equals("I")) {
			dpOrderDAO.updateIntReportReturn(no);
		}else {
			dpOrderDAO.updateExtReportReturn(no);
		}
	}

	@Override
	public String selectAutograph(String dpId) throws SQLException {
		
		return dpOrderDAO.selectAutograph(dpId);
	}

	@Override
	public void updateDpSeal(String dpId, String fileName) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		map.put("dpId", dpId);
		map.put("fileName", fileName);
		
		dpOrderDAO.updateDpSeal(map);
		
	}






}
