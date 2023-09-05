<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage || main</title>
<link rel="stylesheet" href="../css/mypage/menu.css">
<link rel="stylesheet" href="../css/mypage/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".recommend").hide();
	
    $(document).on("change","#color_mode", function () {
        colorModePreview(this);
    })
});

function colorModePreview(event) {
    if($(event).prop("checked") == true){
    	$(".recommend").show();
    }
    else if($(event).prop("checked") == false){
    	$(".recommend").hide();
    }
}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="toggle">
	  <div class="btn-container">
	      <label class="switch toggle-switch">
	            <input type="checkbox" name="color_mode" id="color_mode" value="1">
	            <label for="color_mode" data-on="추천" data-off="알림" class="toggle-switch-inner"></label>
	      </label>
	  </div>
	</div>
	
	<div class="recommend">
		<table>
			<c:forEach items="${list }" var="row">
				<tr class="list">
					<td>${row.bkname}</td>
					<td>${row.bkwrite}</td>
					<td><img src="${row.bkimg}"></td>
					<td>${row.bkprice}원</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
</body>
</html>