package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.LikeClassDAO;
import com.one.dto.ClassVO.ClassDepartmentVO;
import com.one.dto.ClassVO.ClassStasticsVO;

public class LikeClassDAOImpl implements LikeClassDAO{

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ClassStasticsVO> selectLikeClassList(String memEmail, Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ClassStasticsVO> likeClassList = session.selectList("LikeClass-Mapper.selectLikeClassList", memEmail, rowBounds);
		
		return likeClassList;
	}

	@Override
	public List<ClassStasticsVO> selectLikeClassCntAttendees() throws SQLException {
		List<ClassStasticsVO> attendeesCnt = session.selectList("LikeClass-Mapper.selectLikeClassCntAttendees");
		
		return attendeesCnt;
	}

	@Override
	public Integer selectLikeClPoint(String memEmail) throws SQLException {
		Integer totalpoint = session.selectOne("LikeClass-Mapper.selectLikeClPoint", memEmail);
		if(totalpoint == null) {
			totalpoint = 0;
		}
		return totalpoint;
		
	}

	@Override
	public Integer selectLikeCLPointByClCate(ClassStasticsVO smallInfo) throws SQLException {
		Integer point = session.selectOne("LikeClass-Mapper.selectLikeCLPointByClCate", smallInfo);;
		if(point == null ) {
			point = 0;
		}
		return point;
	}

	@Override
	public void deleteLikeCls(Map<String, Object> dataMap) throws SQLException {
		session.delete("LikeClass-Mapper.deleteMyLikeCls", dataMap);
		
	}

	@Override
	public int selectLikeClassListCount(String memEmail) throws SQLException {
		return session.selectOne("LikeClass-Mapper.selectLikeClassListCount", memEmail);
	}

	@Override
	public List<ClassDepartmentVO> selectClassOrderList() throws SQLException {
		List<ClassDepartmentVO> orderClassList = session.selectList("LikeClass-Mapper.selectClassOrder");
		return orderClassList;
	}

	@Override
	public List<ClassDepartmentVO> selectDpIdsByOpcl(int opcl) throws SQLException {
		List<ClassDepartmentVO> dpIdListByOpcl = session.selectList("LikeClass-Mapper.selectDpIdsByOpcl", opcl);
		return dpIdListByOpcl;
	}

}
