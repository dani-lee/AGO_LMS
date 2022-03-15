package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.command.Criteria;
import com.one.dto.PopUpVO;

public interface PopUpDAO {

	public List<PopUpVO> selectPopupList(Criteria cri) throws SQLException;
	
	public int countPopup() throws SQLException;

	public PopUpVO selectPopup(int popNo) throws SQLException;
	
	public void insertPopup(PopUpVO popUp) throws SQLException;
	
	public int selectPopupSequenceNextValue() throws SQLException;
	
	public List<PopUpVO> selectPopupListByDate() throws SQLException;
	
	public void updatePopup(PopUpVO popUp) throws SQLException;
	
	public void deletePopup(int popNo) throws SQLException;
	
}
