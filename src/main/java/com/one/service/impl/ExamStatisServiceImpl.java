package com.one.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.CommonDAO;
import com.one.dao.ExamStatisDAO;
import com.one.dto.ExamExcelVO;
import com.one.dto.ExamStastisDetailVO;
import com.one.dto.ExamStatisVO;
import com.one.dto.ExcelDTO;
import com.one.service.ExamStatisService;
import com.one.utils.ExcelUtil;

public class ExamStatisServiceImpl implements ExamStatisService {
	
	private ExamStatisDAO examStatisDAO;
	public void setExamStatisDAO(ExamStatisDAO examStatisDAO) {
		this.examStatisDAO = examStatisDAO;
	}

	private CommonDAO commonDAO;
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	@Override
	public Map<String, Object> getExamStatisList(Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<>();

		List<ExamStatisVO> examStatisList = examStatisDAO.selectExamStatisList(cri);

		for (ExamStatisVO examStatis : examStatisList) {
			examStatis.setClCateName(commonDAO.selectCommonByCommonCode(examStatis.getClCate()).getCodeName1());
			examStatis.setClDivisionName(commonDAO.selectCommonByCommonCode(examStatis.getClDivision()).getCodeName1());
			examStatis.setClFormatName(commonDAO.selectCommonByCommonCode(examStatis.getClFormat()).getCodeName1());
		}

		int totalCount = examStatisDAO.countExamStatisList();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("examStatisList", examStatisList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ExamStastisDetailVO getExamStastisDetail(int opcl, String excelTempPath) throws Exception {
		ExamStastisDetailVO examDetail = examStatisDAO.selectStatisDetail(opcl);

		examDetail.setStudent(examStatisDAO.countClassStudent(opcl));
		
		List<ExamExcelVO> excel = new ArrayList<ExamExcelVO>();
		int totalCount = 0;
		// 중간 시험번호별 정답률
		if (examDetail.getMtestFile() != null) {
			excel = readExamExcel(examDetail.getMtestFile(), excelTempPath);
			List<Double> mTestStatis = new ArrayList<Double>();
			for (ExamExcelVO exam : excel) {
				if(exam.getCorrectAnswers() != null && excel.get(0).getTotal() != null)
					mTestStatis.add((double) Math.round(((double) exam.getCorrectAnswers() / (double) excel.get(0).getTotal()) * 100.0));
			}
			examDetail.setmTest(mTestStatis);
			
			int[] mScoreCount = new int[3];
			double[] mScorePersent = new double[3];
			examDetail.setTestType("m");
			for (int i = 0; i < 3; i++) {
				examDetail.setScoreType(Integer.toString(i));
				mScoreCount[i] = examStatisDAO.countStudentScore(examDetail);
				mScorePersent[i] = (double)mScoreCount[i]/(double)examDetail.getStudent() * 100.0;
				totalCount += mScoreCount[i];
			}
			examDetail.setmScorePersent(mScorePersent);
			examDetail.setmScoreCount(mScoreCount);
			examDetail.setmTotalCount(totalCount);
			if (mScoreCount[2] != 0 && totalCount != 0) {
				examDetail.setmPassRate(((double)mScoreCount[2] / (double)totalCount) * 100.0);
			} else {
				examDetail.setmPassRate(0);
			}
		}
		
		excel = readExamExcel(examDetail.getFtestFile(), excelTempPath);
		// 기말 시험번호별 정답률
		List<Double> fTestStatis = new ArrayList<Double>();
		for (ExamExcelVO exam : excel) {
			if(exam.getCorrectAnswers() != null && excel.get(0).getTotal() != null)
				fTestStatis.add((double) Math.round(((double) exam.getCorrectAnswers() / (double) excel.get(0).getTotal()) * 100.0));
		}
		examDetail.setfTest(fTestStatis);

		totalCount = 0;
		int[] fScoreCount = new int[3];
		double[] fScorePersent = new double[3];
		examDetail.setTestType("f");
		for (int i = 0; i < 3; i++) {
			examDetail.setScoreType(Integer.toString(i));
			fScoreCount[i] = examStatisDAO.countStudentScore(examDetail);
			fScorePersent[i] = (double)fScoreCount[i]/(double)examDetail.getStudent() * 100.0;
			totalCount += fScoreCount[i];
		}
		examDetail.setfScorePersent(fScorePersent);
		examDetail.setfScoreCount(fScoreCount);
		examDetail.setfTotalCount(totalCount);
		if (fScoreCount[2] != 0 && totalCount != 0 && excel.get(0).getTotal() != null)
			examDetail.setfPassRate((double) fScoreCount[2] / (double) totalCount * 100.0);
		return examDetail;
	}
	
	public List<ExamExcelVO> readExamExcel(String fileName, String excelTempPath) throws Exception{
		ExcelDTO excelDTO = new ExcelDTO();

		// 파일경로 추가
		excelDTO.setFilePath(excelTempPath + fileName);
		// 컬럼명 추가
		excelDTO.setOutputColumns("A", "B", "C", "D", "E", "F", "G", "H", "I");
		// 시작행
		excelDTO.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelUtil.read(excelDTO);
		List<ExamExcelVO> examList = new ArrayList<ExamExcelVO>();
		for (Map<String, String> test : excelContent) {
			ExamExcelVO examExcel = new ExamExcelVO();

			examExcel.setTestNum((int) Float.parseFloat(test.get("A")));
			examExcel.setExamQuestions(test.get("B"));
			examExcel.setTestAnswer((int) Double.parseDouble(test.get("C").toString()));
			if (test.get("D") != null && !test.get("D").isEmpty()) {
				examExcel.setCorrectAnswers((int) Float.parseFloat(test.get("D")));
			}
			examExcel.setTestNumber1(test.get("E"));
			examExcel.setTestNumber2(test.get("F"));
			examExcel.setTestNumber3(test.get("G"));
			examExcel.setTestNumber4(test.get("H"));
			if (test.get("I") != null && !test.get("I").isEmpty())
				examExcel.setTotal((int) Float.parseFloat(test.get("I")));

			examList.add(examExcel);
		}

		return examList;
	}
}
