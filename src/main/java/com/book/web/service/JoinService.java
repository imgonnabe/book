package com.book.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.web.dao.JoinDAO;
import com.book.web.dto.JoinDTO;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO joinDAO;

	public int join(JoinDTO joinDTO) {
		return joinDAO.join(joinDTO);
	}

	public int checkID(String mid) {
		return joinDAO.checkID(mid);
	}
}
