package com.book.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	List<Map<String, Object>> booklist();

	List<Map<String, Object>> zzimlist();

	int delete(String del);

	List<Map<String, Object>> buylist();

}
