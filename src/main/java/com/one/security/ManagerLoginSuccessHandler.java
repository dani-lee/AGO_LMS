package com.one.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.one.dto.ManagerVO;
import com.one.dto.MemberVO;
import com.one.service.CommonService;

public class ManagerLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private String savePath;
	private String saveFileName;
	private CommonService commonService;

	public void setCommonService(CommonService commonService) {
		this.commonService = commonService;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
		UserDetails userDetail = (UserDetails) authentication.getDetails();
		HttpSession session = request.getSession();
		String id = userDetail.getUsername();
		ManagerVO loginManager = null;

		try {
			loginManager = ((Manager) userDetail).getManagerVO();
			loginManager.setMember((MemberVO) session.getAttribute("manager"));
			loginManager.setDpName(commonService.getCodeName1ByCommonCode(loginManager.getDpId()));
			loginManager.setPositionName(commonService.getCodeName1ByCommonCode(loginManager.getPositionId()));
			loginManager.setAuthorityName(commonService.getCodeName1ByCommonCode(loginManager.getAuthorityId()));
			loginManager.setMemStatusName(commonService.getCodeName1ByCommonCode(loginManager.getMemStatus()));
		} catch (Exception e) {
			e.printStackTrace();
			// ExceptionLoggerHelper.write(request, e, memberService);
			// response.getWriter() 메세지전송(script)
		}

		saveLog(loginManager, request);
		session.setAttribute("loginManager", loginManager);
		session.setMaxInactiveInterval(60 * 60);
		super.onAuthenticationSuccess(request, response, authentication);
	}

	public void saveLog(ManagerVO loginManager, HttpServletRequest request) throws IOException {
		// 로그인 정보를 스트링으로 저장.
		boolean tag = false;

		String head = "action,ServletPath,memName,memPhone,memEmail,remoteAddr,date";
		String log = "login," + request.getServletPath() + "," + loginManager.getMemName() + "," + loginManager.getMemPhone() + "," + loginManager.getMemEmail() + "," + request.getRemoteAddr() + "," + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
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
		} catch (

		Exception e) {
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
