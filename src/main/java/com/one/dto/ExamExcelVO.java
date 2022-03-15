package com.one.dto;

public class ExamExcelVO {

	private Integer testNum;

	private String examQuestions;

	private Integer testAnswer;

	private Integer correctAnswers;

	private String testNumber1;
	
	private String testNumber2;
	
	private String testNumber3;
	
	private String testNumber4;

	private Integer total;

	public Integer getTestNum() {
		return testNum;
	}

	public void setTestNum(Integer testNum) {
		this.testNum = testNum;
	}

	public String getExamQuestions() {
		return examQuestions;
	}

	public void setExamQuestions(String examQuestions) {
		this.examQuestions = examQuestions;
	}
	
	public Integer getTestAnswer() {
		return testAnswer;
	}

	public void setTestAnswer(Integer testAnswer) {
		this.testAnswer = testAnswer;
	}

	public Integer getCorrectAnswers() {
		return correctAnswers;
	}

	public void setCorrectAnswers(Integer correctAnswers) {
		this.correctAnswers = correctAnswers;
	}
	
	public String getTestNumber1() {
		return testNumber1;
	}

	public void setTestNumber1(String testNumber1) {
		this.testNumber1 = testNumber1;
	}

	public String getTestNumber2() {
		return testNumber2;
	}

	public void setTestNumber2(String testNumber2) {
		this.testNumber2 = testNumber2;
	}

	public String getTestNumber3() {
		return testNumber3;
	}

	public void setTestNumber3(String testNumber3) {
		this.testNumber3 = testNumber3;
	}

	public String getTestNumber4() {
		return testNumber4;
	}

	public void setTestNumber4(String testNumber4) {
		this.testNumber4 = testNumber4;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "ExamExcelVO [testNum=" + testNum + ", examQuestions=" + examQuestions + ", testAnswer=" + testAnswer
				+ ", correctAnswers=" + correctAnswers + ", testNumber1=" + testNumber1 + ", testNumber2=" + testNumber2
				+ ", testNumber3=" + testNumber3 + ", testNumber4=" + testNumber4 + ", total=" + total + "]";
	}

	
	

}
