package com.one.command;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.one.dto.ClassVO.ClassReviewVO;

@SuppressWarnings("serial")
public class ClassReviewCommand extends ClassReviewVO implements Serializable{
	
	private String memId;
	
	private double scope;
	private int frontScope;
	private int backScope;
	private int restScope = 5;
	private String icons="";
	private String date;
	
	String pattern = "yyyy.MM.dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getRestScope() {
		return restScope;
	}
	public void setRestScope(int restScope) {
		this.restScope = restScope;
	}
	public double getScope() {
		return scope;
	}
	
	@Override
	public void setReviewScore(double reviewScore) {
		setScope(reviewScore);
	}
	
	public void setScope(double scope) {
		this.scope = scope;
		setFrontScope((int)(scope*10)/10);
		setBackScope((int)(scope*10)%10);
		int sum = 0;
		if(backScope==5)
			sum = sum+1;
		sum = sum+frontScope;
		setRestScope(5-sum);
		
	}
	public int getFrontScope() {
		return frontScope;
	}
	public void setFrontScope(int frontScope) {
		this.frontScope = frontScope;
	}
	public int getBackScope() {
		return backScope;
	}
	public void setBackScope(int backScope) {
		this.backScope = backScope;
	}
	public String getIcons() {
		return icons;
	}
	
	@Override
	public void setReviewRegdate(Date reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
		setDate(simpleDateFormat.format(reviewRegdate));
	}
	

	public void setIcons(String icons) {
		this.icons = icons;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
