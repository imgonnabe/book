package com.book.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.web.dao.AdminDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public List<Map<String, Object>> stocklist(Map<String, Object> map) {
		return adminDAO.stocklist(map);
	}
}
