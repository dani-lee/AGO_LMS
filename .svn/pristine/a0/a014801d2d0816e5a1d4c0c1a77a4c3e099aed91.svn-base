package com.one.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.ClassVO.ClassStasticsVO;

public interface ClassStasticsService {

	public List<ClassStasticsVO> selectStasticsClassInfoList()throws SQLException;
	
	public Map<String, Object> getAgeSpecificPreferenceData()throws SQLException;
	
	public Map<String, Object> getClassGraphInfo()throws SQLException;
	
	public Map<String, Object> getClassGraphInfoByDpId()throws SQLException;
	
	//전체 강의 목록 가져오기
	public Map<String, Object>getTotalOpenClass(Criteria cri)throws SQLException;
	
	public ClassStasticsVO getClassDetailByOpcl(int opcl)throws SQLException;
	
	//상세 그래프 데이터
	public Map<String, Object> getDetailGraphData(int opcl) throws SQLException;
	
	//노출상태 null값이 아닌 갯수 가져오기 
	public List<ClassStasticsVO> getListMainExposure()throws SQLException;
	
	public void modifyMainExposureStatus(ClassStasticsVO modifyInfo)throws SQLException;
	
}
