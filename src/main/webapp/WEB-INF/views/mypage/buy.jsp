<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage || buy</title>
<link rel="stylesheet" href="../css/mypage/menu.css">
<link rel="stylesheet" href="../css/mypage/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	
}
</script>
</head>
<body>
	<%@ include file="../menu.jsp" %>
	<h1>주문 목록</h1>
	<div class="recommend">
	${list[0].count }
	<div class="search">
		<button class="btn" onclick="location.href='./buy'">전체보기</button>
		<form action="./buy" method="get">
			<select name="searchN">
				<option value="no">주문번호</option>
				<option value="title">책제목</option>
				<option value="writer">글쓴이</option>
			</select>
			<input type="text" name="searchV" required="required">
			<button type="submit">검색</button>
		</form>
	</div>
		<table border="1">
			<c:forEach items="${list }" var="row">
				<tr class="list">
					<td>${row.tgroup}</td>
					<td><img src="${row.bkimg}"></td>
					<td>${row.bkname}</td>
					<td>${row.bkprice}원</td>
					<td>${row.tamount}</td>
					<td>${row.tdate}</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
</body>
</html>