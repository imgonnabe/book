<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage || zzim</title>
<link rel="stylesheet" href="../css/mypage/menu.css">
<link rel="stylesheet" href="../css/mypage/zzim.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		var check = document.getElementsByName("rowCheck");
		var checkCnt = check.length;
		
		$('input[name="allCheck"]').click(function(){
			var checkList = $('input[name="rowCheck"]');
			for(var i = 0; i < checkList.length; i++){
				checkList[i].checked = this.checked;
			}
		});
		
		$('input[name="rowCheck"]').click(function(){
			if($('input[name="rowCheck"]:checked').length == checkCnt){
				$('input[name="allCheck"]')[0].checked = true;
			} else {
				$('input[name="allCheck"]')[0].checked = false;
			}
		});
		
		$('button[type="button"]').click(function() {
		    deleteValue();
		});
		
		function deleteValue(){
			var valueArr = new Array();
			var list = $('input[name="rowCheck"]');
			for(var i = 0; i < list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			}
			// alert("valueArr: " + valueArr);
			if(valueArr.length == 0){
				alert('선택된 글이 없습니다.');
				return false;
			} else {
				var chk = confirm('정말 삭제하시겠습니까?');
				$.ajax({
					url : './delete',
					type : 'post',
					traditional: true,// valueArr=[1, 2, 3] > valueArr=1&valueArr=2&valueArr=3
					data:{valueArr:valueArr},
					success: function(data){
						alert('삭제했습니다.');
						location.href="./zzim";
					},
					error: function(error){
						alert('에러');
					}
				});
			}
		}
	});
</script>
</head>
<body>
	<%@ include file="../menu.jsp"%>
	mid를 파라미터로 보내야한다.
	<form action="">
		<div class="recommend">
			<div>
				<input name="allCheck" type="checkbox"> 찜한 상품 <div class="zzim"></div> /
				${list[0].count }
			</div>
			<div>
				<button type="button" onclick="deleteValue()">삭제</button>
			</div>
			<hr>
			<table border="1">
				<c:forEach items="${list }" var="row">
					<tr class="list">
						<td><input name="rowCheck" type="checkbox"
							value="${row.zno }"></td>
						<td>${row.bkname}</td>
						<td>${row.bkwrite}</td>
						<td><img src="${row.bkimg}"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>