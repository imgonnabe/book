<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="mpmenu">
		<div style="height: 100px;"></div>
		<div onclick="url('main')"><img src="../img/mypage/profile.png"></div>
		<div>이름</div>
		<div onclick="url('zzim')"><img src="../img/mypage/zzim.png"></div>
		<div class="mpmenu-item" onclick="url('buy')">주문 목록</div>
		<div class="mpmenu-item" onclick="url('rent')">대여 목록</div>
		<div class="mpmenu-item" onclick="url('board')">게시물 관리</div>
		<div class="mpmenu-item" onclick="url('comment')">댓글 관리</div>
		<div class="mpmenu-item" onclick="url('question')">문의 내역</div>
		<div class="mpmenu-item" onclick="url('info')">회원정보 관리</div>
	</nav>
	<script type="text/javascript">
	function url(url){
		location.href="./" + url;
	}
</script>