package com.one.dto;

import java.util.ArrayList;
import java.util.List;

public class ExcelDTO {

	private String filePath;			//엑셀 파일 경로
	private List<String> outputColumns;	//추출할 컬럼명
	private int startRow;				//추출을 시작할 행 번호
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public List<String> getOutputColumns() {
		return outputColumns;
	}
	public void setOutputColumns(List<String> outputColumns) {
		this.outputColumns = outputColumns;
	}
	public void setOutputColumns(String...outputColumns) {
		
		if(this.outputColumns == null) {
			this.outputColumns = new ArrayList<String>();
		}
		
		for(String outputColumn : outputColumns) {
			this.outputColumns.add(outputColumn);
		}
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
	
}
