package com.one.dao.scheduler.impl;


import org.apache.ibatis.session.SqlSession;

import com.one.dao.impl.CertificateDAOImpl;
import com.one.dto.CertificateVO;

public class ScheduledCertificateDAOImpl extends CertificateDAOImpl{
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CertificateVO selectCertificateByScheduled(String picture) throws Exception {
		CertificateVO certificate = new CertificateVO();
		
		certificate = sqlSession.selectOne("Certificate-Mapper.selectCertificateByScheduled", picture);
		
		return certificate;
	}

}
