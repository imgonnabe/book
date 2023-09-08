<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>대여목록</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="../assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="../assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="../assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="../assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="../assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="../assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="../assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="../assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="../assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="../assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="../assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="../assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="../assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="../assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="../assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="../assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="../assets/css/colors/default.css"
	rel="stylesheet">
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<%@ include file="../menu.jsp"%>
	<div style="margin-top: 100px;"></div>
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h1 class="module-title font-alt">대여목록</h1>
			</div>
		</div>
	</div>
	
	<section class="module-small">
		<div class="container">
		<button class="btn" onclick="location.href='./rent'">전체보기</button>
		<button class="btn" onclick="rsearch()">상세조회</button>
			<form action="./rent" method="get" class="row">
				<div class="mb-sm-20">
					<select class="form-control" name="searchN">
						<option value="title">책제목</option>
						<option value="writer">저자</option>
					</select>
				</div>
				<div class="search-box">
					<input class="form-control" type="text" name="searchV"
						required="required" placeholder="Search..">
					<button class="search-btn" type="submit">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</section>
	<div class="container">
	<div class="module-subtitle font-alt">${list[0].count }</div>
		<div class="row multi-columns-row">
			<div class="col-sm-6">
				<div class="widget-posts">
					<c:forEach items="${list }" var="row">
						<h4 class="widget-posts-title font-serif"><a href="../bookdetail?bkno=${row.bkno}">${row.bkname}</a></h4>
						<div class="widget-posts-image"><a href="../bookdetail?bkno=${row.bkno}"><img src="${row.bkimg }" alt="Blog-post Thumbnail"/></a></div>
						<div class="widget-posts-title font-alt">${row.bkwrite}</div>
						<div class="widget-posts-title font-serif">${row.rsdate}</div>
						<div class="widget-posts-title font-serif">${row.rddate}</div>
						<c:choose>
							<c:when test="${row.rdel eq 1}">
								<div class="widget-posts-title font-alt">대출중</div>
							</c:when>
							<c:otherwise>
							<div class="widget-posts-title font-alt">반납</div>
							</c:otherwise>
						</c:choose>
						<hr>
					</c:forEach>
				</div>
			</div>
			</div>
	</div>
	</div>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">기간조회</h5>
				</div>
				<div class="modal-body">
					<div class="detail">
						<div class="mb-sm-20">
							<select class="form-control" name="searchN">
								<option value="1">최근 1개월</option>
								<option value="3">최근 3개월</option>
								<option value="6">최근 6개월</option>
							</select>
						</div>
						<div class="search-box">
							<input class="datepicker" id="start"> ~ <input class="datepicker" id="end">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="../assets/lib/jquery/dist/jquery.js"></script>
	<script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/lib/wow/dist/wow.js"></script>
	<script
		src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="../assets/lib/smoothscroll.js"></script>
	<script
		src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
		});
	
		dateFormatter = function(newDay, today){
			let year = newDay.getFullYear();
			let month = newDay.getMonth() + 1;
			let date = newDay.getDate();
		
			// 기존 날짜와 새로운 날짜가 다른 경우
			if(today){
				let todayDate = today.getDate();
				if(date != todayDate){
					if(month == 0){
						year = 1;
						month = (month + 11) % 12;
						date = new Date(year, month, 0).getDate();// 달의 마지막 날짜
					}
				}
			}
		
			month = ("0" + month).slice(-2);
			date = ("0" + date).slice(-2);
			return year + "-" + month + "-" + date;
			}
		
		document.getElementsByName("filterDate").forEach(e => {
			e.addEventListener('click', function(){
				let endDate = new Date($('#end').val());
				let newDate = new Date($('#end').val());
				
				switch(this.value){
				case '1' :
					console.log('1개월');
					newDate.setDate(newDate.getMonth() - 1);
					newDate = dateFormatter(newDate);
					break;
				case '2' :
					console.log('3개월');
					newDate.setDate(newDate.getMonth() - 3);
					newDate = dateFormatter(newDate);
					break;
				case '3' :
					console.log('6개월');
					newDate.setDate(newDate.getMonth() - 6);
					newDate = dateFormatter(newDate);
					break;
				}
				$('#start').val(newDate);
			})
		})
		
		function rsearch(){
	 		$.ajax({
	 			url:'./rent',
	 			type:'get',
	 			success:function(data){
	 				$("#exampleModal").modal("show");
	 			},
	 			error:function(error){
	 				alert('에러');
	 			}
	 		});
			
		}
		
</script>
</body>
</html>