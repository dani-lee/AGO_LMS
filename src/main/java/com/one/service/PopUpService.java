package com.one.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator;

import com.one.command.Criteria;
import com.one.dto.PopUpVO;

public interface PopUpService {

	public Map<String,Object> getPopUpList(Criteria cri) throws SQLException;
	
	public PopUpVO getPopup(int popNo) throws SQLException;
	
	public void registPopup(PopUpVO popUp) throws SQLException;
	
	public List<PopUpVO> getPopupListByDate() throws SQLException;
	
	public void modifyPopup(PopUpVO popUp) throws SQLException;
	
	public void removePopup(int popNo) throws SQLException;
	
}
