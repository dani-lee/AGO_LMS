package com.one.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.one.dto.AttachVO;


public class MakeFileName {
	// uuid를 주는 함수
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}

	// uuid를 빼는 함수
	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1];
	}
	
	public static String realFileName(String fileName, String delimiter) {
		String realFileName = fileName.substring(fileName.lastIndexOf("$")+1);
		return realFileName;
	}

	public static List<AttachVO> parseFileNameFromAttaches(List<AttachVO> attachList, String delimiter){
		List<AttachVO> renamedArrachList = new ArrayList<AttachVO>();
		
		if(attachList != null) {
			for(AttachVO attach : attachList) {
				String fileName = attach.getFileName(); // DB상의 fileName
				fileName = parseFileNameFromUUID(fileName, delimiter); // uuid가 제거된 fileName
				attach.setFileName(fileName);
				attach.setFileRealName(realFileName(fileName, delimiter));
				renamedArrachList.add(attach);
			}
		}
		return renamedArrachList;
	}
}
