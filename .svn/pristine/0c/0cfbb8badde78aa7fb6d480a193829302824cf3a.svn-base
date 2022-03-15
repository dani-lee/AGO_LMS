package com.one.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.one.command.MemberCriteria;
import com.one.dao.CertificateDAO;
import com.one.dto.CertificateListVO;
import com.one.dto.CertificateVO;
import com.one.dto.MemberCertificateVO;

public class CertificateDAOImpl implements CertificateDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public CertificateVO selectCertificate() throws SQLException{
		CertificateVO certificate = null;
		
		certificate = session.selectOne("Certificate-Mapper.selectCertificate");
		
		return certificate;
	}

	@Override
	public void insertCertificate(CertificateVO certificate) throws SQLException {
		session.update("Certificate-Mapper.insertCertificate",certificate);
	}

	@Override
	public List<CertificateListVO> selectCretificateListByEmail(MemberCriteria mCri) throws SQLException {
		int offset = mCri.getStartRowNum();
		int limit = mCri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<CertificateListVO> userCertificateList = null;
		userCertificateList = session.selectList("Certificate-Mapper.selectCretificateListByEmail", mCri, rowBounds);
		return userCertificateList;
	}

	@Override
	public MemberCertificateVO selectCretificateByEmail(String clCode, String memEmail) throws SQLException {
		MemberCertificateVO memCertificate = new MemberCertificateVO();
		memCertificate.setClCode(clCode);
		memCertificate.setMemEmail(memEmail);
		return session.selectOne("Certificate-Mapper.selectCretificateByEmail",memCertificate);
	}

	@Override
	public int countMemberCertificateList(MemberCriteria mCri) throws SQLException {
		return session.selectOne("Certificate-Mapper.countMemberCertificateList", mCri);
	}

	@Override
	public List<String> selectCertificateYear(String memEmail) throws SQLException {
		return session.selectList("Certificate-Mapper.selectCertificateYear", memEmail);
	}

}
