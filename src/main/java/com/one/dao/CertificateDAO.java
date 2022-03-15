package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.command.MemberCriteria;
import com.one.dto.CertificateListVO;
import com.one.dto.CertificateVO;
import com.one.dto.MemberCertificateVO;

public interface CertificateDAO {
	
	public CertificateVO selectCertificate() throws SQLException;

	public void insertCertificate(CertificateVO certificate) throws SQLException;
	
	public List<CertificateListVO> selectCretificateListByEmail(MemberCriteria cri) throws SQLException;
	
	public MemberCertificateVO selectCretificateByEmail(String clCode, String memEmail) throws SQLException;
	
	public int countMemberCertificateList(MemberCriteria mCri) throws SQLException;
	
	public List<String> selectCertificateYear(String memEmail) throws SQLException;
}
