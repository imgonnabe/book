package com.book.web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.book.web.dto.JoinDTO;

@Mapper
public interface JoinDAO {
	

	public int join(JoinDTO joinDTO);

	public int checkID(String mid);
	
}
