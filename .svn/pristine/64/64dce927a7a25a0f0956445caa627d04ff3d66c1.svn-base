package com.one.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.one.utils.MakeFileName;

@RestController
public class SummernoteController {

	@Resource(name="summernoteImg")
	private String summernoteImg;
	
	@RequestMapping("/uploadImg")
	public ResponseEntity<String> uploadImg(MultipartFile file, HttpServletRequest request) throws Exception{
		
		ResponseEntity<String> result = null;
		
		int fileSize = 1024 * 1024 * 5;
		
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.", HttpStatus.BAD_REQUEST);
		}
		
		String savePath = summernoteImg.replace("/", File.separator);
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		String fileName = MakeFileName.toUUIDFileName("."+fileFormat, "");
		
		File saveFile = new File(savePath, fileName);
		
		saveFile.mkdirs();
		
		try {
			file.transferTo(saveFile);
			
			result = new ResponseEntity<String>(request.getContextPath() + "/getImg.do?fileName=" + fileName,HttpStatus.OK);
		} catch (IOException e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
		
	}
	
	@RequestMapping("/getImg")
	public ResponseEntity<byte[]> getImg(String fileName, HttpServletRequest request) throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		
		String savePath = summernoteImg.replace("/", File.separator);
		File sendFile = new File(savePath, fileName);
		
		InputStream in = null;
		
		try {
			in = new FileInputStream(sendFile);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	@RequestMapping("/deleteImg")
	public ResponseEntity<String> deleteImg(@RequestBody Map<String,String> data) throws Exception{
		
		ResponseEntity<String> result = null;
		
		String savePath = summernoteImg.replace("/", File.separator);
		File target = new File(savePath, data.get("fileName"));
		
		if(!target.exists()) {
			result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}else {
			try {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch (Exception e) {
				result = new ResponseEntity<String>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return result;
	}

	
}

