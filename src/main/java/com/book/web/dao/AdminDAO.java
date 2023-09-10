package com.book.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

	List<Map<String, Object>> stocklist(Map<String, Object> map);

}
