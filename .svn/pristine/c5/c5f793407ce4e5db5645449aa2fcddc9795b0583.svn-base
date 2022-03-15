package com.one.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.command.PageMaker;
import com.one.dao.FaqDAO;
import com.one.dto.FaqVO;
import com.one.service.FaqService;

public class FaqServiceImpl implements FaqService {

	private FaqDAO faqDAO;

	public void setFaqDAO(FaqDAO faqDAO) {
		this.faqDAO = faqDAO;
	}

	@Override
	public Map<String, Object> getFaqList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(12);
		cri.setSearchType("up");
		List<FaqVO> faqList = faqDAO.selectFAQList(cri);

		int totalCount = faqDAO.selectFAQListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		Criteria dashCri = new Criteria();
		dashCri.setPerPageNum(4);
		dashCri.setSortType("e");
		dashCri.setSearchType("up");
		List<FaqVO> faqEList = faqDAO.selectDashboardFAQList(dashCri);
		dashCri.setSortType("c");
		List<FaqVO> faqCList = faqDAO.selectDashboardFAQList(dashCri);
		dashCri.setSortType("l");
		List<FaqVO> faqLList = faqDAO.selectDashboardFAQList(dashCri);
		dataMap.put("faqList", faqList);
		dataMap.put("faqEList", faqEList);
		dataMap.put("faqCList", faqCList);
		dataMap.put("faqLList", faqLList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<FaqVO> getRecentFaqList(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		return faqDAO.selectDashboardFAQList(cri);
	}

	@Override
	public FaqVO getFaq(int faqNo) throws SQLException {
		FaqVO faq = faqDAO.selectFAQByFaqNo(faqNo);
		return faq;
	}

	@Override
	public void regist(FaqVO faq) throws SQLException {
		int faqNo = faqDAO.selectFQASeqNextValue();
		faq.setFaqNo(faqNo);
		System.out.println(faq.toString());
		faqDAO.insertFAQ(faq);
	}

	@Override
	public void modify(FaqVO faq) throws SQLException {
		faqDAO.updateFAQ(faq);
	}

	@Override
	public void remove(int faqNo) throws SQLException {
		faqDAO.deleteFAQ(faqNo);
	}

}
