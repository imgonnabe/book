<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
const eventSource = new EventSource('http://localhost:80/notifications/main/1');

eventSource.addEventListener('sse', event => {
    console.log(event);
});
</script>
</body>
</html>