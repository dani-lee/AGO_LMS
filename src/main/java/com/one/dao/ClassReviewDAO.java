package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.ClassReviewCommand;
import com.one.command.Criteria;
import com.one.dto.ClassVO.ClassReviewVO;
import com.one.dto.ClassVO.ClassVO;

public interface ClassReviewDAO {
	
	// 최근 등록된 수강후기 30개
	public List<ClassReviewCommand> selectClassReviewList(Criteria cri) throws SQLException;
	
	public int selectClassListCount() throws SQLException;
	
	// 후기 클릭시 강의 상세
	public ClassVO selectClassDetail(int opcl) throws SQLException;
	
	// 강의 평점 평균
	public double selectReviewAVG(int opcl) throws Exception;
	
	// 점수대별 인원수
	public List<Integer> countReviewScore(int opcl) throws SQLException;
	
	// 상세 리뷰 리스트
	public List<ClassReviewCommand> selectDetailReviewList(int opcl) throws SQLException;
	
}
