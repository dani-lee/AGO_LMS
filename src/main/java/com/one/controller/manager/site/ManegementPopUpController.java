package com.one.controller.manager.site;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;
import com.one.command.Criteria;
import com.one.command.PopUpRegistCommand;
import com.one.dto.PopUpVO;
import com.one.service.PopUpService;

@Controller
@RequestMapping("/manager/popUp")
public class ManegementPopUpController {

	@Autowired
	private PopUpService popupService;

	@RequestMapping("/list.do")
	public ModelAndView managementPopUpList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "manager/managementSite/managementPopUp/list";

		Map<String,Object> dataMap = popupService.getPopUpList(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/getPopup.do")
	public ModelAndView showPopup(ModelAndView mnv, int popNo) throws Exception {
		String url = "manager/managementSite/managementPopUp/detail";

		PopUpVO popup = popupService.getPopup(popNo);

		mnv.addObject("popup", popup);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/registForm.do")
	public String registPopUpForm() throws Exception {
		String url = "manager/managementSite/managementPopUp/regist";
		return url;
	}

	@RequestMapping(value="/regist.do",method=RequestMethod.POST)
	public String registPopUp(PopUpRegistCommand popupCMD, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/popUp/list.do";

		popupCMD.setPopTitle(HTMLInputFilter.htmlSpecialChars(popupCMD.getPopTitle()));
		popupCMD.setPopLink(HTMLInputFilter.htmlSpecialChars(popupCMD.getPopLink()));
		
		PopUpVO popup = popupCMD.toPopUpVO();
		popupService.registPopup(popup);
		
		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/modifyForm.do")
	public ModelAndView ModifyPopUpForm(ModelAndView mnv,int popNo) throws Exception {
		String url = "manager/managementSite/managementPopUp/modify";
		
		PopUpVO popup = popupService.getPopup(popNo);
		mnv.addObject("popup", popup);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.POST)
	public String modifyPopUp(PopUpRegistCommand popupCMD, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/popUp/list.do";
		popupCMD.setPopTitle(HTMLInputFilter.htmlSpecialChars(popupCMD.getPopTitle()));
		popupCMD.setPopLink(HTMLInputFilter.htmlSpecialChars(popupCMD.getPopLink()));
		PopUpVO popup = popupCMD.toPopUpVO();
		popupService.modifyPopup(popup);
		rttr.addFlashAttribute("from", "modify");

		return url;
	}
	
	@RequestMapping("/remove.do")
	public String removePopUp(int popNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/popUp/list.do";

		popupService.removePopup(popNo);
		rttr.addFlashAttribute("from", "remove");

		return url;
	}
	


}

