package com.one.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.one.dto.OpclVO;
import com.one.dto.ClassVO.ClassChapterVO;
import com.one.dto.ClassVO.ClassVO;

public class RegistClassCommand {

	private String clImg;
	private String clName;
	private String clIntro;
	private String clCode;

	private String clPoint;
	private String clCreditTime;
	private String clFormat;
	private String clCate;
	private String clDivision;
	
	private String openRound;
	private String opcl;
	private String clRoomNo;
	private String clRoomNo1;
	private String cutline;
	private String enrPers;
	private String lecDate = null;
	private String lecDateTime;
	
	private String testStatus;
	private String postSdate;	
	private String postEdate;	
	private String studyDate = "D103";
	private List<String> dpId;

	private MultipartFile clChapName;

	private List<MultipartFile> clDocName;

	private List<MultipartFile> mtestFile;

	private List<MultipartFile> ftestFile;


	
	

	public String getLecDateTime() {
		return lecDateTime;
	}

	public void setLecDateTime(String lecDateTime) {
		this.lecDateTime = lecDateTime;
	}

	public List<String> getDpId() {
		return dpId;
	}

	public void setDpId(List<String> dpId) {
		this.dpId = dpId;
	}

	public String getLecDate() {
		return lecDate;
	}

	public void setLecDate(String lecDate) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@dto" + lecDate);
		this.lecDate = lecDate;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public String getOpenRound() {
		return openRound;
	}

	public void setOpenRound(String openRound) {
		this.openRound = openRound;
	}

	public String getOpcl() {
		return opcl;
	}

	public void setOpcl(String opcl) {
		this.opcl = opcl;
	}

	public String getClRoomNo1() {
		return clRoomNo1;
	}

	public void setClRoomNo1(String clRoomNo1) {
		this.clRoomNo1 = clRoomNo1;
	}

	public String getClCode() {
		return clCode;
	}

	public void setClCode(String clCode) {
		this.clCode = clCode;
	}

	public String getStudyDate() {
		return studyDate;
	}

	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}	

	public ClassVO toClassVO() {
		ClassVO classinfo = new ClassVO();

		classinfo.setClImg(this.clImg);
		classinfo.setClCate(this.clCate);
		classinfo.setClCreditTime(Integer.parseInt(this.clCreditTime));
		classinfo.setClDivision(this.clDivision);
		classinfo.setClFormat(this.clFormat);
		classinfo.setClIntro(this.clIntro);
		classinfo.setClName(this.clName);
		classinfo.setClPoint(Integer.parseInt(this.clPoint));

		return classinfo;
	}

	public String getClImg() {
		return clImg;
	}

	public void setClImg(String clImg) {
		this.clImg = clImg;
	}

	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public String getClIntro() {
		return clIntro;
	}

	public void setClIntro(String clIntro) {
		this.clIntro = clIntro;
	}

	public String getClPoint() {
		return clPoint;
	}

	public void setClPoint(String clPoint) {
		this.clPoint = clPoint;
	}

	public String getClCreditTime() {
		return clCreditTime;
	}

	public void setClCreditTime(String clCreditTime) {
		this.clCreditTime = clCreditTime;
	}

	public String getClFormat() {
		return clFormat;
	}

	public void setClFormat(String clFormat) {
		this.clFormat = clFormat;
	}

	public String getClCate() {
		return clCate;
	}

	public void setClCate(String clCate) {
		this.clCate = clCate;
	}

	public String getClDivision() {
		return clDivision;
	}

	public void setClDivision(String clDivision) {
		this.clDivision = clDivision;
	}

	public String getClRoomNo() {
		return clRoomNo;
	}

	public void setClRoomNo(String clRoomNo) {
		this.clRoomNo = clRoomNo;
	}

	public String getCutline() {
		return cutline;
	}

	public void setCutline(String cutline) {
		this.cutline = cutline;
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

	public MultipartFile getClChapName() {
		return clChapName;
	}

	public void setClChapName(MultipartFile clChapName) {
		this.clChapName = clChapName;
	}

	public List<MultipartFile> getClDocName() {
		return clDocName;
	}

	public void setClDocName(List<MultipartFile> clDocName) {
		this.clDocName = clDocName;
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

	public OpclVO toOpclVO(String clCode) throws Exception{
		OpclVO opclinfo = new OpclVO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date Sdate =  new Date(sdf.parse(this.postSdate).getTime());
		Date Edate = new Date(sdf.parse(this.postEdate).getTime());
		if(this.openRound == null) {
			opclinfo.setOpenRound(1);
		}
		opclinfo.setCutline(this.cutline);
		opclinfo.setPostSdate(Sdate);
		opclinfo.setPostEdate(Edate);
		opclinfo.setEnrPers(this.enrPers);
		opclinfo.setClCode(clCode);
		if(this.clRoomNo != null) {
			opclinfo.setClRoomNo(Integer.parseInt(this.clRoomNo));			
		}else {
			opclinfo.setClRoomNo(Integer.parseInt(this.clRoomNo1));
		}
		
		opclinfo.setStudyDate(this.studyDate);
		if(!this.lecDate.isEmpty() && !this.lecDateTime.isEmpty()) {
			System.out.println("@@@@@@@@ LECDATE               "+this.lecDate);
			String realLecDate = this.lecDate + " " + this.lecDateTime;
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date lecFormatDate = new Date(sdf2.parse(realLecDate).getTime());
			
			opclinfo.setLecDate(lecFormatDate);		
		}
		return opclinfo;
	}

	public OpclVO toNextOpclVO() throws Exception{
		OpclVO opclinfo = new OpclVO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date Sdate =  new Date(sdf.parse(this.postSdate).getTime());
		Date Edate = new Date(sdf.parse(this.postEdate).getTime());
		opclinfo.setOpenRound(Integer.parseInt(this.openRound));
		opclinfo.setCutline(this.cutline);
		opclinfo.setPostSdate(Sdate);
		opclinfo.setPostEdate(Edate);
		opclinfo.setEnrPers(this.enrPers);
		opclinfo.setClCode(clCode);
		if(this.clRoomNo != null) {
			opclinfo.setClRoomNo(Integer.parseInt(this.clRoomNo));			
		}else {
			opclinfo.setClRoomNo(Integer.parseInt(this.clRoomNo1));
		}
		if(this.lecDate != null) {
			String realLecDate = this.lecDate + " " + this.lecDateTime;
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date lecFormatDate = new Date(sdf2.parse(realLecDate).getTime());			
			opclinfo.setLecDate(lecFormatDate);		
		}
		opclinfo.setStudyDate(this.studyDate);

		return opclinfo;
	}	
	
}
