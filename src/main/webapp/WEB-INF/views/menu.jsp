<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>DongneBook | 우리동네 동네북</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="./index">DongneBook</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Home</a>
                <ul class="dropdown-menu">
                  <li><a href="index_mp_fullscreen_video_background.html">Default</a></li>
                  <li><a href="index_op_fullscreen_gradient_overlay.html">One Page</a></li>
                  <li><a href="index_agency.html">Agency</a></li>
                  <li><a href="index_portfolio.html">Portfolio</a></li>
                  <li><a href="index_restaurant.html">Restaurant</a></li>
                  <li><a href="index_finance.html">Finance</a></li>
                  <li><a href="index_landing.html">Landing Page</a></li>
                  <li><a href="index_photography.html">Photography</a></li>
                  <li><a href="index_shop.html">Shop</a></li>
                </ul>
              </li>
                <ul class="dropdown-menu">
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Static Image Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_static.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_static.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Flexslider Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_flexslider.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_flexslider.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Video Background Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_video_background.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_video_background.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Text Rotator Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_text_rotator.html">Classic</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gradient Overlay Header</a>
                    <ul class="dropdown-menu">
                      <li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a></li>
                      <li><a href="index_mp_classic_gradient_overlay.html">Classic</a></li>
                    </ul>
                  </li>
                </ul>
              <li class="dropdown"><a class="dropdown-toggle" href="./booklist?bkcate=0" data-toggle="dropdown">책</a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="./booklist?bkcate=0">도서</a>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">장르</a>
                    <ul class="dropdown-menu">
                      <li><a href="./booklist?bkcate=1">국내도서</a></li>
                      <li><a href="./booklist?bkcate=2">외국도서</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">커뮤니티</a>
                <ul class="dropdown-menu">
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">About</a>
                    <ul class="dropdown-menu">
                      <li><a href="about1.html">About 1</a></li>
                      <li><a href="about2.html">About 2</a></li>
                      <li><a href="about3.html">About 3</a></li>
                      <li><a href="about4.html">About 4</a></li>
                      <li><a href="about5.html">About 5</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
                    <ul class="dropdown-menu">
                      <li><a href="service1.html">Service 1</a></li>
                      <li><a href="service2.html">Service 2</a></li>
                      <li><a href="service3.html">Service 3</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Pricing</a>
                    <ul class="dropdown-menu">
                      <li><a href="pricing1.html">Pricing 1</a></li>
                      <li><a href="pricing2.html">Pricing 2</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Gallery</a>
                    <ul class="dropdown-menu">
                      <li><a href="gallery_col_2.html">2 Columns</a></li>
                      <li><a href="gallery_col_3.html">3 Columns</a></li>
                      <li><a href="gallery_col_4.html">4 Columns</a></li>
                      <li><a href="gallery_col_6.html">6 Columns</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Contact</a>
                    <ul class="dropdown-menu">
                      <li><a href="contact1.html">Contact 1</a></li>
                      <li><a href="contact2.html">Contact 2</a></li>
                      <li><a href="contact3.html">Contact 3</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Restaurant menu</a>
                    <ul class="dropdown-menu">
                      <li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
                      <li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
                    </ul>
                  </li>
                  <li><a href="login_register.html">Login / Register</a></li>
                  <li><a href="faq.html">FAQ</a></li>
                  <li><a href="404.html">Page 404</a></li>
                </ul>
              </li>

              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Features</a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="alerts-and-wells.html"><i class="fa fa-bolt"></i> Alerts and Wells</a></li>
                  <li><a href="buttons.html"><i class="fa fa-link fa-sm"></i> Buttons</a></li>
                  <li><a href="tabs_and_accordions.html"><i class="fa fa-tasks"></i> Tabs &amp; Accordions</a></li>
                  <li><a href="content_box.html"><i class="fa fa-list-alt"></i> Contents Box</a></li>
                  <li><a href="forms.html"><i class="fa fa-check-square-o"></i> Forms</a></li>
                  <li><a href="icons.html"><i class="fa fa-star"></i> Icons</a></li>
                  <li><a href="progress-bars.html"><i class="fa fa-server"></i> Progress Bars</a></li>
                  <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                </ul>
              </li>

              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">관리자 페이지</a>
              	<ul class="dropdown-menu" role="menu">
                  <li><a href="/admin/board">게시물 관리</a></li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">구매</a>
                  	<ul class="dropdown-menu">
	                  <li><a href="/admin/stock">재고 관리</a></li>
	                  <li><a href="/admin/product">상품 등록</a></li>
	                  <li><a href="/admin/sales">매출액</a></li>
                  	</ul>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">대여</a>
                  	<ul class="dropdown-menu">
	                  <li><a href="/admin/rent">대여 관리</a></li>
	                  <li><a href="/admin/rentalAmount">대여량</a></li>
                  	</ul>
                </ul>
               </li>
              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">마이페이지</a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="/mypage/main">메인</a></li>
                  <li><a href="/mypage/zzim">찜목록</a></li>
                  <li><a href="/mypage/buy">구매목록</a></li>
                  <li><a href="/mypage/rent">대출이력</a></li>
                  <li><a href="/mypage/board">게시물 관리</a></li>
                  <li><a href="/mypage/comment">댓글 관리</a></li>
                  <li><a href="/mypage/info">회원정보관리</a></li>
                </ul>
              </li>
              <c:choose>
	              <c:when test="${sessionScope.mname eq null}">
	              	<li class="dropdown"><a href="/login">로그인</a></li>
	              </c:when>
	              <c:otherwise>
	             	 <li class="dropdown"><a href="/logout">로그아웃</a></li>
	              </c:otherwise>
              </c:choose>
            </ul>
          </div>
        </div>
      </nav>
 
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>