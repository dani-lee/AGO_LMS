package com.one.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.dto.OpclVO;
import com.one.dto.ClassVO.ClassVO;

public class ClassModifyCommand {


	
	private String clCode;
	private String enrPers;
	private String postSdate;
	private String postEdate;
	private String studyDate;
	private String cutline;
	private String testNo;
	
	private String clRoomNo;
	private String lecDate;
	private String lecTime;
	private String opcl;
	private String mtestCheck;
	private String ftestCheck;
	private String clFormat;
	private String openRound;


	private List<MultipartFile> mtestFile;

	private List<MultipartFile> ftestFile;
	
	
	

	
	
	public String getLecTime() {
		return lecTime;
	}

	public void setLecTime(String lecTime) {
		this.lecTime = lecTime;
	}

	public String getOpenRound() {
		return openRound;
	}

	public void setOpenRound(String openRound) {
		this.openRound = openRound;
	}

	public String getClRoomNo() {
		return clRoomNo;
	}

	public void setClRoomNo(String clRoomNo) {
		this.clRoomNo = clRoomNo;
	}

	public String getLecDate() {
		return lecDate;
	}

	public void setLecDate(String lecDate) {
		this.lecDate = lecDate;
	}

	public String getClFormat() {
		return clFormat;
	}

	public void setClFormat(String clFormat) {
		this.clFormat = clFormat;
	}

	public String getOpcl() {
		return opcl;
	}

	public void setOpcl(String opcl) {
		this.opcl = opcl;
	}

	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	public String getEnrPers() {
		return enrPers;
	}

	public void setEnrPers(String enrPers) {
		this.enrPers = enrPers;
	}

	public String getPostSdate() {
		return postSdate;
	}

	public void setPostSdate(String postSdate) {
		this.postSdate = postSdate;
	}

	public String getPostEdate() {
		return postEdate;
	}

	public void setPostEdate(String postEdate) {
		this.postEdate = postEdate;
	}

	public String getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}

	public String getCutline() {
		return cutline;
	}

	public void setCutline(String cutline) {
		this.cutline = cutline;
	}

	public String getTestNo() {
		return testNo;
	}

	public void setTestNo(String testNo) {
		this.testNo = testNo;
	}

	public String getMtestCheck() {
		return mtestCheck;
	}

	public void setMtestCheck(String mtestCheck) {
		this.mtestCheck = mtestCheck;
	}

	public String getFtestCheck() {
		return ftestCheck;
	}

	public void setFtestCheck(String ftestCheck) {
		this.ftestCheck = ftestCheck;
	}

	public List<MultipartFile> getMtestFile() {
		return mtestFile;
	}

	public void setMtestFile(List<MultipartFile> mtestFile) {
		this.mtestFile = mtestFile;
	}

	public List<MultipartFile> getFtestFile() {
		return ftestFile;
	}

	public void setFtestFile(List<MultipartFile> ftestFile) {
		this.ftestFile = ftestFile;
	}

	
	
	

	@Override
	public String toString() {
		return "ClassModifyCommand [clCode=" + clCode + ", enrPers=" + enrPers + ", postSdate=" + postSdate
				+ ", postEdate=" + postEdate + ", studyDate=" + studyDate + ", cutline=" + cutline + ", testNo="
				+ testNo + ", clRoomNo=" + clRoomNo + ", lecDate=" + lecDate + ", opcl=" + opcl + ", mtestCheck="
				+ mtestCheck + ", ftestCheck=" + ftestCheck + ", clFormat=" + clFormat + ", openRound=" + openRound
				+ ", mtestFile=" + mtestFile + ", ftestFile=" + ftestFile + "]";
	}

	public OpclVO toOpclVO() throws Exception{
		
		OpclVO opcl = new OpclVO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date Sdate =  new Date(sdf.parse(this.postSdate).getTime());
		Date Edate = new Date(sdf.parse(this.postEdate).getTime());
		opcl.setOpcl(Integer.parseInt(this.opcl));
		opcl.setEnrPers(this.enrPers);
		opcl.setPostSdate(Sdate);
		opcl.setPostEdate(Edate);
		opcl.setStudyDate(this.studyDate);
		opcl.setCutline(this.cutline);
		if(!this.clFormat.equals("온라인")) {
			String dateTime = this.lecDate +" " +this.lecTime;
			System.out.println("@@@@@@@@@@@@@@@@                dateTime[" + dateTime+"]");
			opcl.setClRoomNo(Integer.parseInt(this.clRoomNo));
			System.out.println("@@@@@@@        투오피씨엘 룸넘버   "+opcl.getClRoomNo());
			Date formatLecDate = new Date(sdf2.parse(dateTime).getTime());
			System.out.println("@@@@@@@@@@    포멧렉데이트 ["+formatLecDate+"]");
			opcl.setLecDate(formatLecDate);			
		}else {
			opcl.setClRoomNo(0);
			
		}
		 return opcl;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
