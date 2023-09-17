package com.book.web.notification;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Mapper
public interface NotificationDAO {

	SseEmitter get(String id);

	void deleteById(String id);

	void save(String id, SseEmitter emitter);
	
}
