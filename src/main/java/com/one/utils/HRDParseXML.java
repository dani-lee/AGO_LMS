package com.one.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.one.command.Criteria;
import com.one.command.PageMaker;

public class HRDParseXML {
	private int page = 1;
	private int pageSize = 10;
	private String url = "/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp";
	private String serviceKey = "vov77t96DXqKtOzdW5IUzwX8aWvjGJw8";
	private String startDate;
	private String endDate;
	private String search;
	private String searchType;

	private List<Map<String, String>> hrdList;
	private int totalCount;

	
	public HRDParseXML(Criteria cri) {

		this.page = cri.getPage();
		this.pageSize = cri.getPerPageNum();
		this.searchType = cri.getSearchType();
		this.search = cri.getKeyword();
		// System.out.println("search==================="+search+"|"+cri.getKeyword());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		Date currentDate = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentDate);
		// 현재날짜로부터 100년뒤 날짜 설정
		cal.add(Calendar.YEAR, 100);
		startDate = formatter.format(currentDate);
		endDate = formatter.format(cal.getTime());

		hrdList = new ArrayList<Map<String, String>>();
		createDocument(hrdList);
	}

	private void createDocument(List<Map<String, String>> HrdList) {
		Document documentInfo = null;

		// URL 설정
		String parseUrl = /*url + "?returnType=XML&authKey=" + serviceKey + "&pageNum=" + page + "&pageSize=" + pageSize
				+ "&srchTraStDt=" + startDate + "&srchTraEndDt=" + endDate + "&srchTraProcessNm=" + search
				+ "&outType=1&sort=ASC&sortCol=TR_STT_DT&srchTraArea1=30&srchTraArea2=30110";*/
				"https://www.hrd.go.kr/hrdp/api/apipo/APIPO0101T.do?"
					+"srchTraEndDt="+endDate
					+"&pageSize="+pageSize
					+"&srchTraArea1=30"
					+"&srchTraProcessNm="+search
					+"&srchTraStDt="+startDate
					+"&sortCol=TR_STT_DT"
					+"&authKey="+serviceKey
					+"&sort=ASC&returnType=XML"
					+"&outType=1"
					+"&pageNum="+page
					+"&srchTraPattern=N1"
					+"&srchPart=-99"
					+"&apiRequstPageUrlAdres="+url
					+"&apiRequstIp=1.212.157.149"
					+"&srchKeco1="+searchType;

		try {
			documentInfo = (Document) DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(parseUrl);
			documentInfo.getDocumentElement().normalize();
			// 총 학원 갯수
			totalCount = Integer.parseInt(getTagValue("scn_cnt", documentInfo.getDocumentElement()));

			// 목록 정보 데이터 파싱하기
			parseXml(documentInfo.getDocumentElement(), hrdList);

		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
	}

	private void parseXml(Element root, List<Map<String, String>> hrdList) {
		NodeList nList = root.getElementsByTagName("srchList").item(0).getChildNodes();

		for (int i = 0; i < nList.getLength(); i++) {
			Map<String, String> map = new HashMap<>();
			Node nNode = nList.item(i);
			Element eElement = (Element) nNode;

			// [퀘스트] 가져올 데이터를 생성하시오.
			map.put("trainCd", getTagValue("trprId", eElement)); // 과정코드
			map.put("subTitle", getTagValue("subTitle", eElement)); // 학원 이름
			map.put("title", getTagValue("title", eElement)); // 과정명
			map.put("titleLink", "https://www.hrd.go.kr/hrdp/co/pcobo/PCOBO0100P.do?"); // 디테일링크
			map.put("traEndDate", getTagValue("traEndDate", eElement)); // 훈련 기간(~까지)
			map.put("traStartDate", getTagValue("traStartDate", eElement)); // 훈련 기간(~에서)
			map.put("trainTargetCd", getTagValue("trainTargetCd", eElement)); // 디테일 링크 요소1
			map.put("trainstCstId", getTagValue("trainstCstId", eElement)); // 디테일 링크 요소2
			map.put("trprId", getTagValue("trprId", eElement)); // 디테일 링크 요소3
			map.put("trprDegr", getTagValue("trprDegr", eElement)); // 디테일 링크 요소4
			
			hrdList.add(map);
		}
		

	}

	// tag값 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nList = null;
		Node nValue = null;
		try {
			nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			nValue = (Node) nList.item(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public List<Map<String, String>> getHrdList() {
		return hrdList;
	}
}
