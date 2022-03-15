package com.one.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.one.dao.MenuDAO;
import com.one.dto.MenuVO;
import com.one.service.MenuService;

public class MenuServiceImpl implements MenuService {

	private MenuDAO menuDAO;

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList(String mCode) throws SQLException {
		mCode = mCode.substring(0,3);
		List<MenuVO> menuList = menuDAO.selectMainMenu(mCode);
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectSubMenu(mCode);
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMcode(mCode);
		return menu;
	}

	@Override
	public MenuVO getMenuByMname(String mName) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMname(mName);
		return menu;
	}

}
