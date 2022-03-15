package com.one.controller.manager.management;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.command.Criteria;
import com.one.dto.CommonVO;
import com.one.dto.MessageVO;
import com.one.service.ClassService;
import com.one.service.CommonService;
import com.one.service.MemberService;
import com.one.service.MessageService;

@Controller
@RequestMapping("/manager/message")
public class ManagementMessageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private ClassService classService;

	@RequestMapping("/list.do")
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "manager/management/message/list";
		
		Map<String,Object> dataMap = messageService.getMsgList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/detail.do")
	@ResponseBody
	public ResponseEntity<MessageVO> detail(int msgNo) throws Exception {
		ResponseEntity<MessageVO> entity = null;
		
		try {
			MessageVO msgDetail = messageService.getMsg(msgNo);
			entity = new ResponseEntity<MessageVO>(msgDetail, HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<MessageVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}

	@RequestMapping("/sendForm.do")
	public String sendForm() throws Exception {
		String url = "manager/management/message/send";

		return url;
	}

	@RequestMapping("/msgMemberList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> msgMemberList() throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> jsonList = new HashMap<String, Object>();
		List<Object> children = new ArrayList<Object>();
		Map<String, Object> map = null;
		// 부서명 가져오기
		List<CommonVO> dpIdList = commonService.getCommonByGroupCode("DP1");
		jsonList.put("id", "ROOT");
		jsonList.put("text", "부서별");
		
		try {
			for (int i = 0; i < dpIdList.size(); i++) {
				CommonVO common = dpIdList.get(i);
				map = new HashMap<String, Object>();
				List<Map<String, String>> memberList = memberService.getMemberByDpIdNoIcon(common.getCommonCode());
				map.put("text", common.getCodeName1());
				map.put("id", "ROOT" + i);
				map.put("children", memberList);

				children.add(map);
			}
			jsonList.put("children", children);

			entity = new ResponseEntity<Map<String, Object>>(jsonList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping("/msgClassList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> msgClassList() throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> jsonList = new HashMap<String, Object>();
		List<Object> children = new ArrayList<Object>();
		Map<String, Object> map = null;
		// open된 강의(opcl) 가져오기
		List<Map<String, String>> classList = classService.getClassAllListNoIcon();
		jsonList.put("id", "ROOT");
		jsonList.put("text", "강의별");
		
		try {
			for (int i = 0; i < classList.size(); i++) {
				String opclStr = classList.get(i).get("id");
				int opcl = Integer.parseInt(opclStr);

				map = new HashMap<String, Object>();
				List<Map<String, String>> memberClList = memberService.getMemberClByOpcl(opcl);
				map.put("text", classList.get(i).get("text"));
				map.put("id", "ROOT" + i);
				map.put("children", memberClList);

				children.add(map);
			}
			jsonList.put("children", children);

			entity = new ResponseEntity<Map<String, Object>>(jsonList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "/send.do", method = RequestMethod.POST)
	public String sendMessage(MessageVO message, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/message/list.do";
		
		messageService.registMessage(message);

		rttr.addFlashAttribute("from", "send");

		return url;
	}
	
	
	@RequestMapping("/remove.do")
	public String removePopUp(int msgNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/message/list.do";

		messageService.removeMsgByManager(msgNo);
		
		rttr.addFlashAttribute("from", "remove");

		return url;
	}
	
	@RequestMapping(value = "/removeList.do", method = RequestMethod.GET)
	public String removeDebateBoardList(@RequestParam("msgNo") int[] msgNoArr, Criteria cri, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/manager/message/list.do";
		
		for(int msgNo : msgNoArr) {
			messageService.removeMsgByManager(msgNo);
			rttr.addFlashAttribute("from", "remove");
		}
		return url;
	}
}
