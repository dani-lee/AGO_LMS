package com.one.service;

import java.sql.SQLException;
import java.util.List;

import com.one.dto.MenuVO;

public interface MenuService {

	List<MenuVO> getMainMenuList(String mCode) throws SQLException;

	List<MenuVO> getSubMenuList(String mCode) throws SQLException;

	MenuVO getMenuByMcode(String mCode) throws SQLException;

	MenuVO getMenuByMname(String mName) throws SQLException;

}
