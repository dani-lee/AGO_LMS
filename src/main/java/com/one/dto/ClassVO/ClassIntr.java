package com.one.dto.ClassVO;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ClassIntr extends ClassListVO{
	private String memEmail;
	private int opcl     ;
	
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	
	private String posts = "";
	private String poste = "";
	private String studyTime;
	

	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getOpcl() {
		return opcl;
	}
	public void setOpcl(int opcl) {
		this.opcl = opcl;
	}
	public void setPostSdate(Date postSdate) {
		this.postSdate = postSdate;
		posts = simpleDateFormat.format(postSdate);
	}
	
	public void setPostEdate(Date postEdate) {
		this.postEdate = postEdate;
		poste = simpleDateFormat.format(postEdate);
	}

	public String getPosts() {
		return posts;
	}

	public String getPoste() {
		return poste;
	}
	
	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
		if(studyDate.equals("D101"))
			setStudyTime("7");
		if(studyDate.equals("D102"))
			setStudyTime("30");
		if(studyDate.equals("D103"))
			setStudyTime("제한없음");
	//	System.out.println("studyTime==============================="+studyTime);
	}
	
	public String getStudyTime() {
		return studyTime;
	}

	public void setStudyTime(String studyTime) {
		this.studyTime = studyTime;
	}
	
}
