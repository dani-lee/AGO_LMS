package com.one.service.scheduler.impl;

import com.one.dao.scheduler.impl.ScheduledCertificateDAOImpl;
import com.one.dto.CertificateVO;
import com.one.service.impl.CertificateServiceImpl;

public class ScheduledCertificateServiceImpl extends CertificateServiceImpl{
	
	private ScheduledCertificateDAOImpl scheduledCertificateDAO;
	public void setScheduledCertificateDAO(ScheduledCertificateDAOImpl scheduledCertificateDAO) {
		this.scheduledCertificateDAO = scheduledCertificateDAO;
	}
	
	public CertificateVO getCertificateByScheduled(String picture) throws Exception {
		return scheduledCertificateDAO.selectCertificateByScheduled(picture);
	}
}
