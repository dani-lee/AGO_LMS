package com.one.scheduler;

import java.io.File;

import com.one.service.scheduler.impl.ScheduledCertificateServiceImpl;

public class RemoveCertificateScheduler {
	
	private ScheduledCertificateServiceImpl scheduledCertificateService;
	public void setScheduledCertificateService(ScheduledCertificateServiceImpl scheduledCertificateService) {
		this.scheduledCertificateService = scheduledCertificateService;
	}

	private String picturePath;
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public void removePicture() throws Exception {

		File dir = new File(picturePath);
		File[] files = dir.listFiles();

		if (files != null) {
			for (File file : files) {
				if (scheduledCertificateService.getCertificateByScheduled(file.getName()) == null) {
					file.delete();
				}
			}
		}
	}
	
}
