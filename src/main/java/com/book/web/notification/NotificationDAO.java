package com.book.web.notification;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Mapper
public interface NotificationDAO {

	SseEmitter get(Long id);

	void deleteById(Long id);

	void save(Long id, SseEmitter emitter);
	
}
