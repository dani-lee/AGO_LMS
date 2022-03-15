package com.one.dao;

import java.sql.SQLException;

import com.one.dto.SiteInfoVO;

public interface ManagementSiteDAO {
	
	//사이트 정보 등록
	public void insertSiteInfo(SiteInfoVO siteInfo) throws SQLException;
	
	
}
