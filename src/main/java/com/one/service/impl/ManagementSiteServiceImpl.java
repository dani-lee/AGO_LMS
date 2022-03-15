package com.one.service.impl;

import com.one.dao.impl.ManagementSiteDAOImpl;
import com.one.dto.SiteInfoVO;
import com.one.service.ManagementSiteService;

public class ManagementSiteServiceImpl implements ManagementSiteService{
	
	private ManagementSiteDAOImpl managementSiteDAO;
	public void setManagementSiteDAO(ManagementSiteDAOImpl managementSiteDAO) {
		this.managementSiteDAO = managementSiteDAO;
	}
	
	public void registSiteInfo(SiteInfoVO siteInfo) throws Exception{
		managementSiteDAO.insertSiteInfo(siteInfo);
	}
	
	public SiteInfoVO getSiteInfo() throws Exception{
		return managementSiteDAO.selectSiteInfo();
	}
	
	
}
