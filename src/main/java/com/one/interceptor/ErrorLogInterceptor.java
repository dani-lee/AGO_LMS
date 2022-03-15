package com.one.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ErrorLogInterceptor extends HandlerInterceptorAdapter {
	
	private String savePath;
	private String saveFileName;

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		if (ex != null) {
			ex.printStackTrace();
			String exceptName = ex.getClass().getName();
			String fullStackTrace = ExceptionUtils.getStackTrace(ex);
			StackTraceElement[] stackTrace = ex.getStackTrace();
			String issueClass = stackTrace[0].getClassName();
			String message = ex.getMessage();

			System.out.println("exceptName : " + exceptName + " , fullStackTrace : " + fullStackTrace + " , issueClass : " + issueClass + " , message : " + message);
		}
		super.afterCompletion(request, response, handler, ex);
	}
}
