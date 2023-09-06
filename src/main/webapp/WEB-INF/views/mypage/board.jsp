<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage || board</title>
<link rel="stylesheet" href="../css/mypage/menu.css">
<link rel="stylesheet" href="../css/mypage/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	// URL에서 cate 매개변수를 가져와서 기본값으로 설정
    var defaultCate = getParameterByName('cate');
    $('#cate').val(defaultCate);
    
	$('#cate').on('change', function(){
		var cate = $('#cate').val();
		// alert(cate);
		$.ajax({
			url:'./board',
			type:'get',
			data:{cate:cate},
			success:function(data){
				location.href="./board?cate=" + cate;
				
			},
			error:function(error){
				alert('에러');
			}
		});
	});
	
	// URL에서 매개변수를 추출하는 함수
    /*function getParameterByName(name, url) {
        if (!url) {
        	url = window.location.href;
        }
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        var results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }*/
    function getParameterByName(name, url) {
    	const urlParams = new URL(location.href).searchParams;
    	return urlParams.get(name);
    }
    
    
});
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<h1>글관리</h1>
	<div class="board">
		<div class="search" style="margin-left: 200px;">
			<form action="./board" method="get">
				<select name="cate" id="cate" onclick="cateChange()">
					<optgroup label="카테고리">
						<option value="0">전체글</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</optgroup>	
				</select>
				<select name="searchN">
					<option value="title">글제목</option>
					<option value="writer">글쓴이</option>
					<option value="content">글내용</option>
				</select>
				<input type="text" name="searchV" required="required">
				<button type="submit">검색</button>
			</form>
		</div>
		<table border="1">
			<c:forEach items="${list }" var="row">
				<tr class="row" onclick="detail(${row.bno})">
					<td>${row.bno}</td>
					<td>${row.btitle}</td>
					<td>${row.bcontent}</td>
					<td>${row.bdate}</td>
					<td>
						<button onclick="edit(${row.bno})">수정</button>
						<button onclick="del(${row.bno})">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">본문제목</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="detail">
				<div class="detail-content">본문내용</div>	
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
	// 수정
    function edit(bno){
    	if(confirm("수정하시겠습니까?")){
    		location.href = "./edit?bno=" + bno;
    	}
    }
    
 	// 삭제
    function del(bno){
 		// alert(bno);
    	if(confirm("삭제하시겠습니까?")){
    		location.href = "./delete?bno=" + bno;
    	}
    }
 	
 	function detail(bno){
 		$.ajax({
 			url:'./detail',
 			type:'post',
 			data:{bno:bno},
 			dataType:'json',
 			success:function(data){
 				$(".modal-title").text(data.btitle);
 				$(".detail-content").html(data.bcontent);
 				$("#exampleModal").modal("show");
 			},
 			error:function(error){
 				alert('에러');
 			}
 		});
 	}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>