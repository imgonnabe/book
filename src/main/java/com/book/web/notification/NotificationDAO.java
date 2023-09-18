package com.book.web.notification;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NotificationDAO {

	Map<String, Object> findMidById(String mid);

}