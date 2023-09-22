<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible">
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
    <link rel="manifest" href="../assets/images/favicons/manifest.json">
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
    <script src="../js/jquery-3.7.0.min.js"></script>
    <script type="text/javascript">
    
 

    </script>
    
  </head>
  <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="../menu.jsp"%>
    <main>
      <div class="main">
        <hr class="divider-w">
        
        <section class="module-small">
          <div class="container">

          </div>
        </section>
       <hr class="divider-w">
          <div class="container" style="width: 100%">
             <div class="col-sm-1 col-md-1 sidebar">
             
                <div class="widget">
                <h4><b>커뮤니티</b></h4>
                  <h3 class="widget-title"></h3>
                  <ul class="icon-list">
                    <li ><a href="../community/boardM">커뮤니티 홈</a></li>
                    <li><a href="../community/">커뮤니티</a></li>
                    <li><a href="../community/board?board=1">자유게시판</a></li>
                    <li><a href="../community/board?board=2">독후감</a></li>
                    <li><a href="../community/board?board=3">모임&스터디</a></li>
                  </ul>
                </div>
                
                     <div class="widget">
                <h4><b>고객센터</b></h4>
                  <h3 class="widget-title"></h3>
                  <ul class="icon-list">
                    <li ><a href="../community/noticeM">고객센터 홈</a></li>
                    <li><a href="../community/notice?board=1">공지사항</a></li>
                    <li><a href="../community/notice?board=2">Q&A</a></li>
                    
                  </ul>
                </div>
              </div>
             
             <div class="col-sm-8 col-sm-offset-2">
              <h4 class="font-alt mt-40 mb-0">커뮤니티</h4>
                <hr class="divider-w mt-10 mb-20">
                <div class="row multi-columns-row mb-70">
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="alt-features-item">
                      <div class="features-icon"><span class="icon-lightbulb"></span></div>
                      <h3 class="features-title font-alt">전체글</h3> 
                      <table class="table table-dark table-hover table-striped">
              			<c:forEach items="${board1 }" var="b">
              				<tr onclick="location.href='./bdetail?board=${b.bcate}&bno=${b.bno}'">
              					<td>${b.btitle }</td>
              					<td>${b.bdate }</td>
              					<td>${b.mname}</td>
              					<td>${b.bread }</td>
              					<td>${b.stitle }</td>
              				</tr>
              			</c:forEach>
              			</table>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="alt-features-item">
                      <div class="features-icon"><span class="icon-bike"></span></div>
                      <h3 class="features-title font-alt">WEEKLY BEST</h3>
                <table class="table table-dark table-hover table-striped">
              	<c:forEach items="${board2}" var="b">
              		<tr onclick="location.href='./bdetail?board=${b.bcate}&bno=${b.bno}'">	
              			<td>${b.btitle }</td>
              			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.bdate}"/></td>
              			<td>${b.mname}</td>
              			<td>${b.bread }</td>
              			<td>${b.bcate }</td>
              		</tr>
              	</c:forEach>
              	</table> 
                    </div>
                  </div>
                </div>
                <h4 class="font-alt mt-40 mb-0">고객센터</h4>
                <hr class="divider-w mt-10 mb-20">
                <div class="row multi-columns-row mb-70">
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="alt-features-item">
                      <div class="alt-features-icon"><span class="icon-tools-2"></span></div>
                      <a href="./notice?board=1"><h3 class="alt-features-title font-alt">공지사항</h3></a>
				<table class="table table-dark table-hover table-striped">
              	<c:forEach items="${board3}" var="b">
              	<tr onclick="location.href='./ndetail?board=${b.ncate}&nno=${b.nno}'">	
              		<td>${b.ntitle }</td>
              		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.ndate}"/></td>
              		<td>${b.mname}</td>
              		<td>${b.nread }</td>
              		<td>${b.ncate }</td>
              	</tr>
              	</c:forEach>
              	</table > 
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="alt-features-item">
                      <div class="alt-features-icon"><span class="icon-tools"></span></div>
                      <a href="./notice?board=2"><h3 class="alt-features-title font-alt">Q&A</h3></a>
				<table class="table table-dark table-hover table-striped">
              	<c:forEach items="${board4}" var="b">
              	<tr onclick="location.href='./ndetail?board=${b.ncate}&nno=${b.nno}'">	
              		<td>${b.ntitle }</td>
              		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.ndate}"/></td>
              		<td>${b.mname}</td>
              		<td>${b.nread }</td>
              		<td>${b.ncate }</td>
              	</tr>
              	</c:forEach>
              </table> 
                    </div>
                  </div>
                </div>
          </div>
      </div> 
       </div>  
        <hr class="divider-w">
        
        <section class="module">
          <div class="container">
          </div>
        </section>
                
                
 <!-- --------------------------------------------------- 하단 풋---------------------------------------------------------------- -->
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="../index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa  fa-chevron-up"></i></a></div>
    </main>
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