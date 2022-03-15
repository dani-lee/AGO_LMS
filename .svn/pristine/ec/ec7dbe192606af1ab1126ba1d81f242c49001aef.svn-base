package com.one.scheduler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.DstcsCommand;
import com.one.dao.ExamStatisDAO;
import com.one.dao.ManagementMemberDAO;
import com.one.dto.DepartmentVO;
import com.one.dto.ExamStatisVO;
import com.one.dto.ClassVO.ClassStasticsVO;
import com.one.service.ExamManagementService;
import com.one.service.ExamStatisService;
import com.one.service.scheduler.ScheduledStasticsService;

public class StasticsUpdateScheduler {

	private ScheduledStasticsService scheduledStasticsService;
	public void setScheduledStasticsService(ScheduledStasticsService scheduledStasticsService) {
		this.scheduledStasticsService = scheduledStasticsService;
	}
	private ManagementMemberDAO managementMemberDAO;
	public void setManagementMemberDAO(ManagementMemberDAO managementMemberDAO) {
		this.managementMemberDAO = managementMemberDAO;
	}
	private ExamManagementService examManagementService;
	public void setExamManagementService(ExamManagementService examManagementService) {
		this.examManagementService = examManagementService;
	}
	private ExamStatisDAO examStatisDAO;
	public void setExamStatisDAO(ExamStatisDAO examStatisDAO) {
		this.examStatisDAO = examStatisDAO;
	}

	
	
	
	public void updateStasticsInfo()throws SQLException{
		scheduledStasticsService.updateStcsClInfo();
	}
	
	public void updateDstcsData()throws SQLException{
		DstcsCommand dstcsCMD = new DstcsCommand();
		
		List<DepartmentVO> depList = managementMemberDAO.selectDepartment();
		//System.out.println(depList);
		for(DepartmentVO department : depList) {
			List<ClassStasticsVO> blankList = scheduledStasticsService.getClassInfoByDpId(department.getCommonCode());
			dstcsCMD.setDpId(department.getCommonCode());
			dstcsCMD.setDstcsFirst(blankList.get(0).getStcsClsNo());
			dstcsCMD.setDstcsSecond(blankList.get(1).getStcsClsNo());
			dstcsCMD.setDstcsThird(blankList.get(2).getStcsClsNo());
			scheduledStasticsService.updateStcsDp(dstcsCMD);
		}
	}
	
	//시험 평균 점수 test에 opcl별로 insert하려고
	public void updateAvgScoresByOpcl() throws SQLException{
		//시험이 있는 목록
		List<ExamStatisVO> examStatisList = examStatisDAO.selectOnlyExamList();
		for(ExamStatisVO examInfo : examStatisList) {
			if(examInfo.getMtestFile() == null) {
				//최종평가만 있어
				String finScoreAvg = examStatisDAO.selectFinScoreAvg(examInfo.getOpcl());
				if(finScoreAvg != null) {
					examInfo.setFtestAvgSco(Double.parseDouble(finScoreAvg));
					examStatisDAO.updateFinScoreAvg(examInfo);
				}
			}else{
				//중간, 최종 둘다 있어
				String midScoreAvg = examStatisDAO.selectMidScoreAvg(examInfo.getOpcl());
				String finScoreAvg = examStatisDAO.selectFinScoreAvg(examInfo.getOpcl());
				if(finScoreAvg != null && midScoreAvg != null) {
					examInfo.setMtestAvgSco(Double.parseDouble(midScoreAvg));
					examInfo.setFtestAvgSco(Double.parseDouble(finScoreAvg));
					examStatisDAO.updateBothScoreAvg(examInfo);
				}
			}
		}
		
	}
}
