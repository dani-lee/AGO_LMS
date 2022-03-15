package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.FaqVO;

public interface FaqDAO {
	public List<FaqVO> selectFAQList(Criteria cri) throws SQLException;

	public List<FaqVO> selectDashboardFAQList(Criteria cri) throws SQLException;
	
	public int selectFAQListCount(Criteria cri) throws SQLException;

	public FaqVO selectFAQByFaqNo(int faqNo) throws SQLException;

	public void updateFAQ(FaqVO faq) throws SQLException;

	public void deleteFAQ(int faqNo) throws SQLException;

	public void insertFAQ(FaqVO faq) throws SQLException;

	public int selectFQASeqNextValue() throws SQLException;
}
