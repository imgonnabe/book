<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>우리동네 | 동네북</title>
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
<style type="text/css">
.gray{
	background-color: gray;
}

.silver{
	background-color: silver;
}
</style>
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
						<h1 class="module-title font-alt">게시물 관리</h1>
					</div>
				</div>
			</div>

			<section class="module-small">
				<div class="container">
				<div class="col-sm-2 mb-sm-20">
					<button class="btn" onclick="location.href='./board?cate=0'">전체보기</button>
				</div>
				<div class="col-sm-2 mb-sm-20">
					<button class="btn gray">회원탈퇴</button>
				</div>
				<div class="col-sm-2 mb-sm-20">
					<button class="btn silver">삭제된 게시물</button>
				</div>
				<br><br>
					<form action="./board" method="get" class="row">
						<div class="col-sm-3 mb-sm-20">
							<select class="form-control" name="cate" id="cate"
								onclick="cateChange()">
									<option selected="selected" value="0">전체</option>
									<option value="1">자유게시판</option>
									<option value="2">독후감</option>
									<option value="3">모임&amp;스터디</option>
							</select>
						</div>
						<div class="col-sm-3 mb-sm-20">
							<select class="form-control" name="searchN">
								<option value="title">글제목</option>
								<option value="content">글내용</option>
							</select>
						</div>
						<div class="col-sm-4 search-box">
							<input class="form-control" type="text" name="searchV"
								required="required" placeholder="Search..">
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
			</section>
			<c:choose>
				<c:when test="${list[0].count eq null}">
					<section class="module-small">
						<div class="container">
							<h2 style="text-align: center;">게시물이 없습니다.</h2>
						</div>
					</section>
				</c:when>
				<c:otherwise>
			<div class="container">
				<div class="row multi-columns-row">
					<div class="col-sm-15">
					<div class="menu" id="menu">
							<div class="row">
								<span class="menu-detail font-alt col-sm-1">번호</span>
								<span class="menu-title font-alt col-sm-3">제목</span>
								<span class="menu-title font-alt col-sm-2">글쓴이</span>
								<span class="menu-price font-alt col-sm-3">날짜</span>
								<span class="menu-price font-alt col-sm-3">징계</span>
							</div>
							<c:forEach items="${list }" var="row">
								<div class="row <c:if test="${row.mgrade eq 0}">gray</c:if> <c:if test="${row.bdel eq 0}">silver</c:if>">
									<div class="col-sm-13">
										<span class="menu-detail font-serif col-sm-1">${row.bno}</span>
										<span onclick="detail(${row.bno})" class="menu-title font-alt col-sm-3">${row.btitle}</span>
										<span class="menu-title font-alt col-sm-2">${row.mid}(${row.mname})</span>
										<span class="menu-price font-alt col-sm-2">${row.bdate}</span>
										<span class="menu-price font-alt col-sm-4">
											<span class="col-sm-7">
												<select class="form-control punish" name="punish">
													<option value="0">회원 탈퇴</option>
													<option value="1">게시물 삭제</option>
												</select>
											</span>
											<span>
												<input type="button" class="btn punishbtn" data-bno="${row.bno}" data-mid="${row.mid}" value="등록">
											</span>
										</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<ul class="paging">
				    <c:if test="${paging.prev}">
				        <span><a href='<c:url value="/admin/board?page=${paging.startPage-1}"/>'>이전</a></span>
				    </c:if>
				   <c:if test="${paging.endPage gt 1}">
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
					        <span><input class="page" type="button" value="${num}"></input></span>
						</c:forEach>
				    </c:if>
				    <c:if test="${paging.next && paging.endPage>0}">
				        <span><a href='<c:url value="/admin/board?page=${paging.endPage+1}"/>'>다음</a></span>
				    </c:if>
				</ul>
			</div>
			</c:otherwise>
		</c:choose>
		</div>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">본문제목</h5>
				</div>
				<div class="modal-body">
					<div class="detail">
						<div class="detail-date-read">    		
							<div class="detail-date">날짜</div>     		
							<div class="detail-read">조회수</div>	      		
						</div> 
						<div style="font-weight: bold; font-size: larger;" class="detail-content">본문내용</div>
						<div class="comment">
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
	function getParameterByName(name, url) {
    	const urlParams = new URL(location.href).searchParams;
    	return urlParams.get(name);
    }
$(function(){
	var defaultCate = getParameterByName('cate');
    var page = getParameterByName('page');
    if(page == null){
    	page = 1;
    }
    $('#cate').val(defaultCate);
	
   $(".punishbtn").click(function(){
	  var cate = $('#cate').val();
	  if(cate == null){
		  cate = 0;
	  }
	  var selected = $(this).parent().siblings().children(".punish").val();
   	  var bno = $(this).data("bno");
   	  var mid = $(this).data("mid");
	  if(selected == '0'){
		  var con = confirm("회원을 탈퇴시키겠습니까?");
		  if(con){
			  $.ajax({
				  url: 'memberOut',
	                type: 'post',
	                data: {mid: mid,cate:cate,page:page},
	                success: function(data){
	                    location.href="./board?cate=" + cate + "&page=" + page;
	                },
	                error: function(error){
	                    alert('에러');
	                }
			  });
		  }
	  } else if(selected == '1'){
		  var con2 = confirm("게시물을 삭제하시겠습니까?");
		  if(con2){
			  $.ajax({
				  url: 'bdel',
	                type: 'post',
	                data: {bno:bno,cate:cate,page:page},
	                success: function(data){
	                    location.href="./board?cate=" + cate + "&page=" + page;
	                },
	                error: function(error){
	                    alert('에러');
	                }
			  });
		  }
	  } else {
		  return false;
	  }
	});
});   
   
 	function detail(bno){
 		$.ajax({
 			url:'./detail',
 			type:'post',
 			data:{bno:bno},
 			dataType:'json',
 			success:function(data){
 				var detail = data.detail;
 				var comment = data.comment;
 				// alert(comment);
 				$(".modal-title").text(detail.btitle);
 				var date = new Date(detail.bdate).toISOString().split("T")[0];
 				$(".detail-date").text("날짜 : "+date);
 				$(".detail-read").text("조회수:"+detail.bread);
 				$(".detail-content").html(detail.bcontent + "<hr>");
 				
 				var commentHtml = "";
 	            for(var i = 0; i < comment.length; i++){
 	                commentHtml += "<div class='comment-item'>";
 	                commentHtml += comment[i].mid + "(" + comment[i].mname + ")&nbsp;&nbsp;&nbsp;";
 	               	var date = new Date(detail.bdate).toISOString().split("T")[0];
 	                commentHtml += cdate[i] + "<br>";
 	                commentHtml += "<div style='font-weight: bold; font-size: larger;'>" + comment[i].comment + "</div>";
 	                commentHtml += "</div><hr>";
 	            }
 	            $(".comment").html(commentHtml);
 				$("#exampleModal").modal("show");
 			},
 			error:function(error){
 				alert('에러');
 			}
 		});
 	}
 	
 	$(function() {
 	// URL에서 cate 매개변수를 가져와서 기본값으로 설정
 		var defaultCate = getParameterByName('cate');
	    $('#cate').val(defaultCate);
    
	$(document).on('change', '#cate', function(){
		var cate = $('#cate').val();
		if(cate == null){
			cate = 0;
		}
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
	
	$(document).on('click', '.page', function(){
	    var cate = $('#cate').val();
	    if(cate == null){
			cate = 0;
		}
	    var page = $(this).val();
	    $.ajax({
	        url: './board',
	        type: 'get',
	        data: { cate: cate, page: page },
	        success: function(data) {
	            location.href = "./board?cate=" + cate + "&page=" + page;
	        },
	        error: function(error) {
	            alert('에러');
	        }
	    });
	});
	
	});
 	</script>
 	
</body>
</html>