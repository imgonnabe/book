package com.book.web.notification;


import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
@RequestMapping("/notifications")
public class NotificationController {
    private NotificationService notificationService;

    @GetMapping(value = "/main/{id}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter subscribe(@PathVariable String id) {
        return notificationService.main(id);
    }

    @PostMapping("/send-data/{id}")
    public void sendDataTEst(@PathVariable String id) {
        notificationService.notify(id, "data");
    }
}
