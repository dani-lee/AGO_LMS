package com.one.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.JsonCommand;

public class JsTreeJsonConversion {
	public static List<Map<String, String>> conversion(List<? extends JsonCommand> dataList) throws IOException {

		List<Map<String, String>> jsonData = new ArrayList<Map<String, String>>();
		Map<String, String> jsonMap = null;
		for(Object obj : dataList ) {
			jsonMap = new HashMap<String, String>();
			JsonCommand jsonCmd = (JsonCommand)obj;
			jsonMap.put("text", jsonCmd.getText());
			jsonMap.put("id", jsonCmd.getId());
			jsonMap.put("icon", jsonCmd.getIcon());

			jsonData.add(jsonMap);
		}
		return jsonData;
	}
	public static List<Map<String, String>> NoIconConversion(List<? extends JsonCommand> dataList) throws IOException {

		List<Map<String, String>> jsonData = new ArrayList<Map<String, String>>();
		Map<String, String> jsonMap = null;
		for(Object obj : dataList ) {
			jsonMap = new HashMap<String, String>();
			JsonCommand jsonCmd = (JsonCommand)obj;
			jsonMap.put("text", jsonCmd.getText());
			jsonMap.put("id", jsonCmd.getId());

			jsonData.add(jsonMap);
		}
		return jsonData;
	}
}
