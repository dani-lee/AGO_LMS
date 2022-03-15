package com.one.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class GetExcelFileType {

	public static Workbook getWorkbook(String filePath) {
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e.getMessage());
		}
		
		Workbook workbook = null;
		
		if(filePath.toUpperCase().endsWith(".XLS")) {
			try {
				workbook = new HSSFWorkbook(fis);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		else if(filePath.toUpperCase().endsWith(".XLSX")) {
			try {
				workbook = new XSSFWorkbook(fis);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return workbook;
	}
}
