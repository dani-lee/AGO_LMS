package com.one.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.one.command.Criteria;
import com.one.dto.FaqVO;

public interface FaqService {
	public Map<String, Object> getFaqList(Criteria cri) throws SQLException;
	
	public List<FaqVO> getRecentFaqList(Criteria cri)throws SQLException;

	public FaqVO getFaq(int notice_no) throws SQLException;

	public void regist(FaqVO faq) throws SQLException;

	public void modify(FaqVO faq) throws SQLException;

	public void remove(int notice_no) throws SQLException;
}
