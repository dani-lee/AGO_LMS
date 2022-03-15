package com.one.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CSVParser {

	public static List<Map<String, String>> parse(String filePath) {
		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
		FileInputStream fis = null;
		InputStreamReader isr =null;
		BufferedReader br =null;
		try {
			if (new File(filePath).exists()) {
				fis = new FileInputStream(filePath);
				isr = new InputStreamReader(fis, "MS949");
				br = new BufferedReader(isr);
//			File csvFile = new File(filePath);
//			BufferedReader br = new BufferedReader(new FileReader(csvFile));

				String[] head = null;
				String line = null;

				if ((line = br.readLine()) != null) {
					head = line.split(",");
					while ((line = br.readLine()) != null) {
						Map<String, String> tmp = new HashMap<String, String>();
						String[] parsed = line.split(",");
						for (int i = 0; i < head.length; i++)
							tmp.put(head[i], parsed[i]);
						dataList.add(tmp);
					}
				}

			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(br != null)
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}

		return dataList;
	}
}