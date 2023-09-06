<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Titan | Multipurpose HTML5 Template</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="../assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="../assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="../assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="../assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="../assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="../assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="../assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../assets/css/colors/default.css" rel="stylesheet">
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
<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
	<%@ include file="../menu.jsp" %>
	<div style="margin-top: 100px;"></div>
	<main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <div class="main">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">글관리</h1>
              </div>
            </div>
          </div>
        
	    <section class="module-small">
          <div class="container">
            <form action="./board" method="get" class="row">
              <div class="col-sm-2 mb-sm-20">
				<select class="form-control" name="cate" id="cate" onclick="cateChange()">
					<optgroup label="카테고리">
						<option value="0">전체</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</optgroup>	
				</select>
			  </div>
				<div class="col-sm-2 mb-sm-20">
					<select class="form-control" name="searchN">
						<option value="title">글제목</option>
						<option value="writer">글쓴이</option>
						<option value="content">글내용</option>
					</select>
				</div>
				<div class="search-box">
				 	<input class="form-control" type="text" name="searchV" required="required" placeholder="Search..">
					<button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
				</div>
			</form>
		</div>
		</section>
		
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
	</main>
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
 	<!--  
    JavaScripts
    =============================================
    -->
    <script src="../assets/lib/jquery/dist/jquery.js"></script>
    <script src="../assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../assets/lib/wow/dist/wow.js"></script>
    <script src="../assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="../assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../assets/lib/smoothscroll.js"></script>
    <script src="../assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="../assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>