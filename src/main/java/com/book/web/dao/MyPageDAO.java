package com.book.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	List<Map<String, Object>> booklist();

	List<Map<String, Object>> zzimlist();

	int zdelete(String del);

	List<Map<String, Object>> buylist(Map<String, Object> map);

	List<Map<String, Object>> rentlist();

	List<Map<String, Object>> boardlist(Map<String, Object> map);

	void bdelete(Map<String, Object> map);

	Map<String, Object> bdetail(int bno);

}
