package com.one.dao.impl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.one.command.SiteInfoCommand;
import com.one.dto.SiteInfoVO;

public class ManagementSiteDAOImpl {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public void insertSiteInfo(SiteInfoVO siteInfo) throws SQLException{
		session.update("Site-Mapper.insertSiteInfo",siteInfo);
	}
	
	public SiteInfoVO selectSiteInfo() throws SQLException {
		SiteInfoVO siteInfo = null;
		siteInfo = session.selectOne("Site-Mapper.selectSiteInfo");
		return siteInfo;
	}

}
