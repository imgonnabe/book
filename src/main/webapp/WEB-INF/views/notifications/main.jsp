<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>알림</h1>
    
    <script>
        // SSE 연결 및 알림 표시 로직
        const eventSource = new EventSource('/mypage/main/${userId}'); // userId는 JSP에서 파라미터로 받아와야 합니다.

        eventSource.onmessage = function(event) {
            const notification = event.data;
            // 알림을 notification-area에 추가하는 코드 작성
            const notificationArea = document.getElementById('notification-area');
            const notificationElement = document.createElement('p');
            notificationElement.textContent = notification;
            notificationArea.appendChild(notificationElement);
        };
    </script>
</body>
</html>