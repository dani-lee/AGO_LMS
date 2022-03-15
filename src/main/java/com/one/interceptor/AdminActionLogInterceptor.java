package com.one.interceptor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.one.dto.ManagerVO;

public class AdminActionLogInterceptor extends HandlerInterceptorAdapter {

	private String savePath;
	private String saveFileName;

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		boolean tag = false;
		// 로그인 정보를 스트링으로 저장.
		String action = "";
		if (request.getServletPath().indexOf("regist") > 0) {
			action = "regist";
		} else if (request.getServletPath().indexOf("modify") > 0) {
			action = "modify";
		} else if (request.getServletPath().indexOf("remove") > 0) {
			action = "remove";
		}
		ManagerVO loginManager = (ManagerVO) request.getSession().getAttribute("loginManager");
		String head = "action,ServletPath,remoteAddr,date";
		String log = action + "," + request.getServletPath() + "," + request.getRemoteAddr() + "," + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String NEWLINE = System.lineSeparator();
		File file = new File(savePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		String logFilePath = savePath + File.separator + saveFileName;

		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		BufferedWriter bfw = null;

		if (!new File(logFilePath).exists()) {
			tag = true;
		}
		try {
			fos = new FileOutputStream(logFilePath, true);
			osw = new OutputStreamWriter(fos, "MS949");
			bfw = new BufferedWriter(osw);
			if (tag) {
				bfw.write(head);
				bfw.write(NEWLINE);
				tag = false;
			}
			bfw.write(log);
			bfw.write(NEWLINE);
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 닫기
			if (bfw != null) {
				try {
					bfw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (osw != null) {
				try {
					osw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
