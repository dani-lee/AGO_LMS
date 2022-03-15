package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.dto.CommonVO;
import com.one.dto.MemberVO;
import com.one.dto.ClassVO.ClassRegistFormVO;

public interface CommonDAO {

	public  List<CommonVO> selectCommonByGroupCode(String groupCode) throws SQLException;

	public CommonVO selectCommonByCommonCode(String CommonCode) throws SQLException;

	public String selectPositionByKeyword(String keyword) throws SQLException;
	
	public List<ClassRegistFormVO> getStudyDate() throws SQLException;
	
	public List<ClassRegistFormVO> getClFormat() throws SQLException;
	
	public List<ClassRegistFormVO> getClDivision() throws SQLException;
	
	public MemberVO getConvertPositionAndDpBymemInfo(MemberVO member) throws SQLException;
}
