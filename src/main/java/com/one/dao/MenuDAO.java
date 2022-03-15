package com.one.dao;

import java.sql.SQLException;
import java.util.List;

import com.one.dto.MenuVO;

public interface MenuDAO {

	List<MenuVO> selectMainMenu(String mCode) throws SQLException;

	List<MenuVO> selectSubMenu(String mCode) throws SQLException;

	MenuVO selectMenuByMcode(String mCode) throws SQLException;

	MenuVO selectMenuByMname(String mName) throws SQLException;
}
