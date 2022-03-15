package com.one.controller.user.myPage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;
import com.one.command.ExtReportCommand;
import com.one.command.ExtReportCommand2;
import com.one.command.MemberCriteria;
import com.one.dto.AttachVO;
import com.one.dto.ExtReportVO;
import com.one.dto.FinishedClassVO;
import com.one.dto.IntReportVO;
import com.one.dto.MemberVO;
import com.one.service.CommonService;
import com.one.service.FinishedClassService;
import com.one.service.MyClassService;
import com.one.service.UserClassService;
import com.one.utils.GetAttachesFromMultipartFileAdapter;

@Controller
@RequestMapping("/user/myPage/completedClass")
public class ListCompletedClassController {
	
	@Autowired
	private MyClassService myClassService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private FinishedClassService finishedClassService;
	
	@Resource(name = "classUploadPath")
	private String picturePath;

	@Resource(name="extReportCertificate")
	private String fileUploadPath;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(value = "sortType", defaultValue="int", required = false) String sortType, MemberCriteria cri,ModelAndView mnv,HttpSession session, String message ) throws SQLException {
		String url = "user/myPage/ListCompletedClass/list";

		System.out.println(cri.toString());
		System.out.println("@@@@@@@@@@@@           년도써치타입      " +cri.getSearchType());
		System.out.println("@@@@@@@@@@@@           년도키워드      " +cri.getKeyword());
		System.out.println("@@@@@@@@@@@@           sortType      " +sortType);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		cri.setMemId(member.getMemId());
		String email = member.getMemEmail();
		cri.setPerPageNum(5);
		cri.setMemId(member.getMemId());
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		if(cri.getSortType().equals("int") || sortType.equals("int")) {
			dataMap = myClassService.getMemberClList(cri,email);			
		}else if(cri.getSortType().equals("ext") || sortType.equals("ext")){
			System.out.println("@@@@@@@@@@ get외부강의 리스트 cri :  [" + cri.toString());
			dataMap =  myClassService.getExtList(cri,email);
		}else {
			System.out.println("@@@@@@@@@@ get외부수료증 리스트 cri :  [" + cri.toString());			
			dataMap = myClassService.getExtReportList(cri,email);
		}
	
		
		mnv.addObject("message",message);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/deleteHRD.do")
	public String deleteHRD(String extCode, RedirectAttributes rttr, HttpSession session) throws Exception {
		String url = "redirect:/user/myPage/completedClass/list.do";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String email = member.getMemEmail();
		ExtReportCommand ext = new ExtReportCommand();
		ext.setExtCode(extCode);
		ext.setMemEmail(email);
		finishedClassService.deleteHRDByExtNo(ext);
		System.out.println("@@@@@@@@@@@@@@@@@@@111111111111111111111111111111");
		rttr.addAttribute("sortType","ext");
		rttr.addAttribute("message","삭제되었습니다.");
		return url;
	}	
	
	@RequestMapping("/extReportForm.pop")
	public ModelAndView extReportForm(ModelAndView mnv,MemberCriteria mCri, HttpSession session) throws Exception {
		String url = "user/myPage/ListCompletedClass/11"; //외부교육 수료증도 첨부해야됨...

			
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			
			MemberVO convertMember = commonService.getConvertPositionAndDpBymemInfo(member);

			mnv.addObject("convert",convertMember);
			mnv.addObject("member",member);					
		
		
		

		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/IntReportForm.pop")
	public ModelAndView IntReportForm(ModelAndView mnv,MemberCriteria mCri, HttpSession session, String memClNo) throws Exception {
		String url = "user/myPage/ListCompletedClass/IntReportForm"; //외부교육 수료증도 첨부해야됨...

			
		
			IntReportVO intReport =  finishedClassService.getIntReport(Integer.parseInt(memClNo));
			
			MemberVO member = new MemberVO();
			
			member.setDpId(intReport.getDpId());
			member.setPositionId(intReport.getPositionId());
			
			MemberVO convertMember = commonService.getConvertPositionAndDpBymemInfo(member);
			
			mnv.addObject("intReport",intReport);
			mnv.addObject("convert",convertMember);
			mnv.addObject("member",member);					
		
		
		

		mnv.setViewName(url);
		return mnv;
	}		
	@RequestMapping("/completedExtReportForm.pop")
	public ModelAndView CompletedExtReportForm(ModelAndView mnv,MemberCriteria mCri, HttpSession session, String extNo, String extState) throws Exception {
		String url = "user/myPage/ListCompletedClass/CompletedExtReportForm"; //외부교육 수료증도 첨부해야됨...

			System.out.println("@@@@@@@@@@        extNo  ["+extNo);
		
			ExtReportCommand2 ext =  myClassService.getExtReportListByExtNo(extNo);
			
			MemberVO member = new MemberVO();
			
			member.setDpId(ext.getDpId());
			member.setPositionId(ext.getPositionId());
			
			System.out.println("@@@@@@@@@@@@@@@@@@          extgetAttachDoc  [" + ext.getAttachDoc());
			MemberVO convertMember = commonService.getConvertPositionAndDpBymemInfo(member);
			
			mnv.addObject("extState", extState);
			mnv.addObject("ext",ext);
			mnv.addObject("convert",convertMember);
			mnv.addObject("member",member);					
		
		
		

		mnv.setViewName(url);
		return mnv;
	}	
	
	@Autowired
	private UserClassService service;

	@Resource(name = "extReportCertificate")
	private String extReportCertificate;
	
	@RequestMapping(value = "/getImg.do", method = RequestMethod.GET)
	public void getImg(String fileNM, HttpServletResponse response) throws Exception {
		String DIR = extReportCertificate;
		String filePath = DIR + fileNM;

		service.getImage(filePath, response);
	}
	
	
	@RequestMapping(value="/extReportRegist.do", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String extReportRegist(ExtReportCommand registReq, RedirectAttributes rttr, HttpSession session) throws Exception{
		String url = "user/myPage/ListCompletedClass/regist_success";
		ExtReportVO extReport = registReq.getExtReportVO();
		System.out.println("@@@@@@@@@@@@@@@@@@@ registReq extSign  [ " + registReq.getExtSign());
		System.out.println("@@@@@@@@@@@@@@@@@@@ extReport insertdate  [ " + extReport.getInsertCtfDate());
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		extReport.setMemEmail(loginUser.getMemEmail());
		
		List<AttachVO> attachList = GetAttachesFromMultipartFileAdapter.save(registReq.getAttachDoc(), fileUploadPath);
		extReport.setAttachDoc(attachList.get(0).getFileName());
		
		//XSS 적용
		extReport.setEduContent(HTMLInputFilter.htmlSpecialChars(extReport.getEduContent()));
		extReport.setEduReview(HTMLInputFilter.htmlSpecialChars(extReport.getEduReview()));
		
//		finishedClassService.registExtReport(extReport);
		finishedClassService.registExtReportUsingCompleted(extReport);
		
		return url;
	}
	
	@RequestMapping(value="/modifyExtReport.do", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String modifyExtReport(ExtReportCommand modifyReq, RedirectAttributes rttr) throws Exception{
		String url = "user/myPage/ListCompletedClass/modify_success";
		ExtReportVO extReport = modifyReq.getExtReportVO();
		
		
		
		List<AttachVO> attachList = GetAttachesFromMultipartFileAdapter.save(modifyReq.getAttachDoc(), fileUploadPath);
		extReport.setAttachDoc(attachList.get(0).getFileName());
		
		//XSS 적용
		extReport.setEduContent(HTMLInputFilter.htmlSpecialChars(extReport.getEduContent()));
		extReport.setEduReview(HTMLInputFilter.htmlSpecialChars(extReport.getEduReview()));
		

		finishedClassService.modifyExtReport(extReport);
		return url;
	}		
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String picture) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = picturePath;
		try {

			in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		} finally {
			in.close();
		}

		return entity;
	}
	

	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public ModelAndView regist(ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "user/myPage/ListCompletedClass/extReportForm";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/printReport.pop")
	public ModelAndView printReport(ModelAndView mnv, MemberCriteria mCri, HttpSession session, @RequestParam(value = "memClNo", defaultValue = "0") int memClNo, @RequestParam(value = "extCode", defaultValue = "0") String extCode) throws Exception {
		String url = "user/myClass/clsFinished/printReport";
		
		if(memClNo != 0) {
			IntReportVO report = finishedClassService.getIntReportInsertForm(memClNo);
			mnv.addObject("report", report);
		}else if(!extCode.equals("0")) {
			ExtReportVO report = getExtReport(extCode, mCri, session);
			mnv.addObject("report", report);
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}	
	
	private ExtReportVO getExtReport(String extCode, MemberCriteria mCri, HttpSession session) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String positionName = commonService.getCodeName1ByCommonCode(loginUser.getPositionId());
		
		mCri.setMemEmail(loginUser.getMemEmail());
		Map<String, Object> dataMap = finishedClassService.getExtFinishedClassList(mCri, loginUser.getMemId());
		
		ExtReportVO extReport = new ExtReportVO();
		
		List<FinishedClassVO> extClassList = (List<FinishedClassVO>) dataMap.get("extClassList");
		for(FinishedClassVO finished : extClassList) {
			if(finished.getExtCode().equals(extCode)) {
				extReport.setClName(finished.getExtClName());
				extReport.setCtfDate(finished.getCtfDate());
				if(finished.getExtReport() != null) {
					extReport.setExtNo(finished.getExtNo());
					extReport.setEduContent(finished.getExtReport().getEduContent());
					extReport.setEduReview(finished.getExtReport().getEduReview());
				}
			}
		}
		
		extReport.setMemName(loginUser.getMemName());
		extReport.setDpId(loginUser.getDpId());
		extReport.setDpName(commonService.getCodeName1ByCommonCode(loginUser.getDpId()));
		extReport.setPositionName(positionName);
		extReport.setPositionId(loginUser.getPositionId());
		return extReport;
	}
}
