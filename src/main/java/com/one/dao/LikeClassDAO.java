package com.one.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.ClassVO.ClassDepartmentVO;
import com.one.dto.ClassVO.ClassStasticsVO;

public interface LikeClassDAO {

	public List<ClassStasticsVO> selectLikeClassList(String memEmail, Criteria cri)throws SQLException;
	
	public List<ClassStasticsVO> selectLikeClassCntAttendees()throws SQLException;
	
	public Integer selectLikeClPoint(String memEmail)throws SQLException;
	
	public Integer selectLikeCLPointByClCate(ClassStasticsVO smallInfo) throws SQLException;

	public void deleteLikeCls(Map<String, Object> dataMap)throws SQLException;

	public int selectLikeClassListCount(String memEmail) throws SQLException;
	
	public List<ClassDepartmentVO> selectClassOrderList() throws SQLException;
	
	public List<ClassDepartmentVO> selectDpIdsByOpcl(int opcl) throws SQLException;


}
