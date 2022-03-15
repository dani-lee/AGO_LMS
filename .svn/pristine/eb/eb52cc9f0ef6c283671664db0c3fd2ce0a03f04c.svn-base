package com.one.dao.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.Position;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.Criteria;
import com.one.dao.ManagementMemberDAO;
import com.one.dto.CommonVO;
import com.one.dto.DepartmentVO;
import com.one.dto.MemberVO;

public class ManagementMemberDAOImpl implements ManagementMemberDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> memberList = session.selectList("ManagementMember-Mapper.selectMemberList", cri, rowBounds);

		return memberList;
	}

	@Override
	public int selectMemberListCount(Criteria cri) throws SQLException {
		int totalcount = session.selectOne("ManagementMember-Mapper.selectMemberListCount",cri);
		return totalcount;
	}

	@Override
	public List<DepartmentVO> selectDepartment() throws SQLException {
		List<DepartmentVO> depList = session.selectList("ManagementMember-Mapper.selectDepartment");
		return depList;
	}


	@Override
	public List<MemberVO> selectSameDepartment(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBouds = new RowBounds(offset, limit);
		List<MemberVO> memberList = session.selectList("ManagementMember-Mapper.selectSameDepartment", cri, rowBouds);
		
		return memberList;
	}

	@Override
	public List<MemberVO> selectResignerList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> resignerList = session.selectList("ManagementMember-Mapper.selectResignerList", cri, rowBounds);

		return resignerList;
	}

	@Override
	public int selectResignerListCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("ManagementMember-Mapper.selectResignerListCount", cri);
		return totalCount;
	}

	@Override
	public List<MemberVO> selectMemberListExceptResigners(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> memListNoResigners = session.selectList("ManagementMember-Mapper.selectMemberListExceptResigners",cri,rowBounds);
		
		return memListNoResigners;
	}

	@Override
	public int selectMemberListExceptResignersCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("ManagementMember-Mapper.selectMemberListExceptResignersCount", cri);
		return totalCount;
	}

	@Override
	public void updateMemberStatus(MemberVO member) throws SQLException {
		session.selectOne("ManagementMember-Mapper.updateMemberStatus", member);
	}

	@Override
	public void updateCheckedMemberStatus(String[] memEmail) throws SQLException {
		session.update("ManagementMember-Mapper.updateCheckedMemberStatus",memEmail);
		
	}

}
