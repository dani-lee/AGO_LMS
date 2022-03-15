package com.one.service;

import java.sql.SQLException;

import com.one.dto.ManagerVO;

public interface ManagerService {
	public ManagerVO getManager(String managerId) throws SQLException;
}
