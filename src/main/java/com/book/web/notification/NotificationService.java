package com.book.web.notification;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Service
public class NotificationService {
	@Autowired
	private NotificationDAO notificationDAO;
	// 기본 타임아웃 설정
    private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;// 60분동안 SSE 연결 유지
	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();

	public SseEmitter createSseEmitter(String mid) {
		SseEmitter emitter = new SseEmitter(DEFAULT_TIMEOUT);
		emitters.put(mid, emitter);
		System.out.println("createSseEmitter에서 보냄--------------" +  mid);

		// SSEEmitter가 완료되면 제거합니다.
		emitter.onCompletion(() -> emitters.remove(mid));

		return emitter;
	}

	public void sendNotification(String mid, String notification) {
		SseEmitter emitter = emitters.get(mid);
		if (emitter != null) {
			try {
				emitter.send(SseEmitter.event().data(notification));
			} catch (IOException e) {
				// 예외 처리 로직 추가
			}
		}
	}
	
	public Map<String, Object> findMidById(String mid) {
		return notificationDAO.findMidById(mid);
	}
}
