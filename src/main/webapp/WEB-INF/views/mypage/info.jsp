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
<title>회원정보</title>
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
						<h1 class="module-title font-alt">회원정보 수정</h1>
					</div>
				</div>
			</div>
	
          <div class="container">
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2">
                  <div class="form-group">
                    아이디  <input class="form-control" type="text" placeholder="아이디" value="${info.mid}"/>
                  </div>
                  <div class="form-group">
                    새 비밀번호  <input class="form-control" id="pw" type="text" placeholder="새 비밀번호를 입력해주세요."/>
                  </div>
                  <div class="form-group">
                    비밀번호 확인  <input class="form-control input-sm" id="pwchk" type="text" placeholder="새 비밀번호를 한 번 더 입력해주세요."/>
                  </div>
                  <div class="form-group">
                    이름  <div class="form-control">${info.mname}</div>
                  </div>
                  <div class="form-group"> 전화번호 (숫자만 입력하세요.)
                      <div class="detail">
                      <input class="form-control" type="text" required="required" id="phone" placeholder="${info.mphone }">
						<input type="button" id="phoneChk" value = "인증번호 받기">	
						<br><br>
						<input class="form-control" id="phone2" type="text" disabled required/>
						<input type="button" id="phoneChk2" value = "본인인증" disabled="disabled">
						<div><span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span></div>
						<input type="hidden" id="phoneDoubleChk"/>
					</div>
                  </div>
                    <form action="./info" method="post" class="row">
	                  <div class="form-group">
	                    생년월일  <div class="form-control">${info.mbirth}</div>
					      <p><input id="birth" type="date" min="1900-01-01"></p>
					      <p><input type="submit" value="생일 바꾸기"></p>
	                  </div>
				    </form>
              </div>
            </div>
          </div>
		</div>
	</main>
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
		// 오늘 이후 선택이 안되게 함
		var now_utc = Date.now()// 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000;// 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("birth").setAttribute("max", today);
		var birth = $("#birth").val();
		$.ajax({
			type:"post",
	        url:"birthChange",
	        data:{birth:birth},
	        success:function(data){
	        	
	        },
	        error:function(error){
	        	
	        }
		});
	});
	</script>
	<script type="text/javascript">
	$(function(){
		 //휴대폰 번호 인증
		   $(document).on("click", "#phoneChk", function() {
		   	var phone = $("#phone").val().trim();
		   	if (!strToInt(phone)) {
	            return; // 숫자로 변환되지 않으면 함수 종료
	        }
		   	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		   	$.ajax({
		           type:"post",
		           url:"phoneCheck",// "phoneCheck?phone=" + phone하려면 밑에 data를 빼야함
		           data:{phone:phone},
		           success:function(data){
		        	    alert(data);
		           	    update();
		           		var clickCnt = 0;
		           	 $(document).on("click", "#phoneChk2", function() {
		           		if(data == $("#phone2").val().trim()){
		           			alert("본인 인증이 확인되었습니다.");
		           			$("#phoneChk2").attr("disabled",true);
		           			$("#phoneChk2").css("color",green);
		           			return;
		           		} else if (clickCnt < 5){
		           			alert("인증 번호가 틀렸습니다. 다시 시도하세요.");
		           		} else if(clickCnt >= 5){
		           			alert("인증 번호를 다시 받으세요.");
		           			location.href = "./info";
		           		}
		           		clickCnt++;
		           	 });
	           		},
	           		error:function(error){
	           			alert("에러");
	           		}
		       });
		  });
	});
	
	function strToInt(str) {
		if(str.length > 11 && str.length < 9){
			alert("다시 입력하세요...");
			return false;
		}
		
	    for (let i = 0; i < str.length; i++) {
	        if (isNaN(parseInt(str[i]))) {
	            // 숫자가 아닌 문자가 중간에 포함된 경우
	            alert("숫자만 입력하세요...");
	            return false;
	        }
	    }
	    // 숫자로만 이루어진 문자열을 정수로 변환하여 반환
	    return parseInt(str);
	}
	
	function update(){
		$("#phone2").attr("disabled",false);
   		$("#phone2").attr("placeholder","인증번호를 입력하세요...");
   		$("#phoneChk").attr("disabled",true);
   		$("#phoneChk2").attr("disabled",false);
   		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
   		$(".successPhoneChk").css("color","green");
   		$("#phone").attr("readonly",true);
	}
	</script>
</body>
</html>