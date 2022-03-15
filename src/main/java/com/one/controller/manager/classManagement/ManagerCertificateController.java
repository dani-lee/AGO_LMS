package com.one.controller.manager.classManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.one.dto.CertificateVO;
import com.one.service.impl.CertificateServiceImpl;

@Controller
@RequestMapping("/manager/certificateManagement")
public class ManagerCertificateController {
	
	@Autowired
	private CertificateServiceImpl certificateService;
	
	// 수료증 관리
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mnv) throws Exception {
		String url = "/manager/certificateManagement/certificateManagement";
		
		CertificateVO certificate = null;
		certificate = certificateService.getCertificate();
		
		mnv.setViewName(url);
		mnv.addObject("certificate", certificate);
		
		return mnv;
	}
	
	//수료증 등록
	@RequestMapping(value = "/certificateregist.do", method = RequestMethod.POST)
	public String registCertificate(CertificateVO certificate) throws Exception {
		String url = "redirect:/manager/certificateManagement/main.do";
		
		System.out.println(certificate);
		
		certificateService.registCertificate(certificate);
		
		return url;
	}

	// 수료증 발급, 수료증 미리보기
	@RequestMapping(value = "/certificate.pop", method = RequestMethod.GET)
	public ModelAndView certificate(ModelAndView mnv, CertificateVO certificate) throws Exception {
		String url = "/manager/certificateManagement/certificate";
		
		mnv.setViewName(url);
		mnv.addObject("certificate", certificate);
		
		return mnv;
	}

}















