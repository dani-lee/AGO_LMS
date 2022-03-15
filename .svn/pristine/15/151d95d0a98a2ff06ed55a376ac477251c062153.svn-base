package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.one.dao.CommonDAO;
import com.one.dto.CommonVO;
import com.one.dto.MemberVO;
import com.one.dto.ClassVO.ClassRegistFormVO;

public class CommonDAOImpl implements CommonDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<CommonVO> selectCommonByGroupCode(String groupCode) throws SQLException {
		List<CommonVO> commonList = session.selectList("Common-Mapper.selectCommonByGroupCode", groupCode);
		return commonList;
	}

	@Override
	public String selectPositionByKeyword(String keyword) throws SQLException {
		String posion = session.selectOne("Common-Mapper.selectPositionByKeyword", keyword);
		return posion;
	}

	@Override
	public CommonVO selectCommonByCommonCode(String CommonCode) throws SQLException {
		CommonVO common = session.selectOne("Common-Mapper.selectCommonByCommonCode", CommonCode);
		return common;
	}

	@Override
	public List<ClassRegistFormVO> getStudyDate() throws SQLException {
		List<ClassRegistFormVO> studyDateList = session.selectList("Common-Mapper.getStudyDate");
		return studyDateList;
	}

	@Override
	public List<ClassRegistFormVO> getClFormat() throws SQLException {
		List<ClassRegistFormVO> clFormat = session.selectList("Common-Mapper.getClFormat");
		return clFormat;
	}

	@Override
	public List<ClassRegistFormVO> getClDivision() throws SQLException {
		List<ClassRegistFormVO> DivisionList = session.selectList("Common-Mapper.getClDivision");
		return DivisionList;
	}

	@Override
	public MemberVO getConvertPositionAndDpBymemInfo(MemberVO member) throws SQLException {
		MemberVO convertMember = new MemberVO();
			String position = 	session.selectOne("Common-Mapper.getConvertPositionByMemInfo",member.getPositionId());
			String DP = session.selectOne("Common-Mapper.getConvertDPByMemInfo",member.getDpId());
			
			convertMember.setPositionId(position);
			convertMember.setDpId(DP);
		return convertMember;
	}



}
