package com.one.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class PropertiesParser {
	public static Map<String, String> parser(String path, String fileName) {
		Map<String, String> dataMap = new HashMap<String, String>();
		String filePath = path + "src/main/resources/com/one/ago/properties";
		fileName += ".properties";
		File file = new File(filePath, fileName);
		System.out.println(file.getAbsolutePath());
		Properties props = null;

		props = new Properties();
		try {
			props.load(new FileInputStream(file.getAbsolutePath()));
			Set<Object> sets = props.keySet();
			for (Object key : sets) {
				dataMap.put((String) key, props.getProperty((String) key));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dataMap;
	}
}
