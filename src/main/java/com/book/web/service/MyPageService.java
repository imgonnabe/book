package com.book.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.web.dao.MyPageDAO;

@Service
public class MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	public List<Map<String, Object>> booklist() {
		return myPageDAO.booklist();
	}

	public List<Map<String, Object>> zzimlist() {
		return myPageDAO.zzimlist();
	}

	public int delete(String del) {
		return myPageDAO.delete(del);
	}

	public List<Map<String, Object>> buylist(Map<String, Object> map) {
		return myPageDAO.buylist(map);
	}

	public List<Map<String, Object>> rentlist() {
		return myPageDAO.rentlist();
	}
}
