package com.book.web.notification;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
@RequestMapping("/notifications")
public class NotificationController {
	@Autowired
    private NotificationService notificationService;

    @GetMapping(value = "/main", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter subscribe(HttpSession session) {
    	String mid = (String) session.getAttribute("mid");
    	System.out.println("notifications/main에서 보냄---------------" + mid);
    	return notificationService.createSseEmitter(mid);
    }
    
}
