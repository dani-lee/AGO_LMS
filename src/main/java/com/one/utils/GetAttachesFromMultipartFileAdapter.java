package com.one.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.one.dto.AttachVO;

public class GetAttachesFromMultipartFileAdapter {

	public static List<AttachVO> save(List<MultipartFile> multiFiles, String savePath) throws Exception {
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if (multiFiles != null && multiFiles.get(0).getSize() > 0) {
				
			for (MultipartFile multi : multiFiles) {
				String fileName = "";
				if(multi.getOriginalFilename() != null)
				fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
				/* System.out.println("filename : "+fileName); */
				File target = new File(savePath, fileName);
				/* System.out.println("targetName : "+target); */
				target.mkdirs();

				multi.transferTo(target);

				AttachVO attach = new AttachVO();
				attach.setFileName(fileName);
				attachList.add(attach);

			}
		}
		return attachList;
	}
}
