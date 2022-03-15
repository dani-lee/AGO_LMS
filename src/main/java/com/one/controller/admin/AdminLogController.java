package com.one.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.one.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminLogController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/adminManagement/main.do")
	public String adminManagementMain() throws Exception {
		String url = "admin/adminManagement/main";
		return url;
	}

	@RequestMapping(value = "/managerManagement/logList.do")
	public String userManagementMain() throws Exception {
		String url = "admin/managerManagement/logList";
		return url;
	}

	@RequestMapping(value = "/userManagement/logList.do")
	public String userManagementLogList() throws Exception {
		String url = "admin/userManagement/logList";
		return url;
	}

	@RequestMapping(value = "/errorManagement/logList.do")
	public String errorManagementLogList() throws Exception {
		String url = "admin/errorManagement/logList";
		return url;
	}

	@RequestMapping(value = "/savePathManagement/main.do")
	public ModelAndView savePathManagementMain(HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url = "admin/savePathManagement/main";
		Map<String, String> dataMap = null;
		String path = request.getServletContext().getRealPath("/").replace("\\", "/");
		path = path.substring(0, path.indexOf("/.metadata")) + "/AGO2/";
		
		dataMap = adminService.selectProperties(path, "savePath");
		List<String> keys = new ArrayList<>(dataMap.keySet());

		for (String key : keys) {
			System.out.println(key);
			System.out.println(dataMap.get(key));
		}
		mnv.addObject("keys", keys);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
