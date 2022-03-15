package com.one.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.one.dto.ExcelDTO;

public class ExcelUtil {

	public static List<Map<String,String>> read(ExcelDTO excelDTO) throws IOException{
//		System.out.println("filePath" + excelDTO.getFilePath());
//		System.out.println("outputColumns" + excelDTO.getOutputColumns());
//		System.out.println("startRow" + excelDTO.getStartRow());
		//엑셀파일 읽기
		XSSFWorkbook workbook = new XSSFWorkbook(excelDTO.getFilePath());

		// 첫번째 시트 불러오기
		XSSFSheet sheet = workbook.getSheetAt(0);

		//유효한 데이터가 있는 행의 갯수를 가져온다
		int numOfRows = sheet.getPhysicalNumberOfRows();
		System.out.println("행 갯수  + [      "+numOfRows + "        ]");
		int numOfCells = 0;
		
		XSSFRow row = null;
		XSSFCell cell = null;
		
		String cellName = "";
		
		Map<String,String> map = null;
		
		List<Map<String,String>> result = new ArrayList<Map<String,String>>();
		
		for(int rowIndex = excelDTO.getStartRow() -1; rowIndex < numOfRows; rowIndex++) {
			row = sheet.getRow(rowIndex);
			
			if(row != null) {
				numOfCells = row.getPhysicalNumberOfCells();
				map = new HashMap<String, String>();
				
				for(int cellIndex = 0; cellIndex < numOfCells; cellIndex++) {
					cell = row.getCell(cellIndex);
					
					cellName = GetExcelColumnName.getName(cell,cellIndex);
					
					if(!excelDTO.getOutputColumns().contains(cellName)) {
						continue;
					}
					
					map.put(cellName, GetExcelColumnName.getValue(cell));
				}
				
				result.add(map);
			}
		}
		return result;
	}
}
