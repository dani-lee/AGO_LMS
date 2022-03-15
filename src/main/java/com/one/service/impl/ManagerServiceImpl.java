package com.one.service.impl;

import java.sql.SQLException;

import com.one.dao.ManagerDAO;
import com.one.dto.ManagerVO;
import com.one.service.ManagerService;

public class ManagerServiceImpl implements ManagerService {

	private ManagerDAO managerDAO;

	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	@Override
	public ManagerVO getManager(String managerId) throws SQLException {
			ManagerVO manager = managerDAO.selectManager(managerId);
		return manager;
	}

}
