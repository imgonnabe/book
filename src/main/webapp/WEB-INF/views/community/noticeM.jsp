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
   	<style type="text/css">
   	.qnabox{
   		min-height: 300px;
   		
   		margin-bottom: 30px;
   		   		
   	}
   	.askbox{
   		min-height: 300px;
   		border: solid 1px;
   		margin: 30px;
   		text-align: center;
   	}
   	.login{
   		margin:70px;
   	}
   	</style>
  <script type="text/javascript">
  function commentN(){
		alert("1대1문의를 작성하려면 로그인이 필요합니다");
		let chk3 = confirm("로그인하시겠습니까?");
		
		if(chk3){
			location.href="../login"
		}	
	
	
}
  function commentM(){
	  let chk2 = confirm("1대1문의를 작성하시겠습니까?");
	  if(chk2){
		  location.href="http://localhost/community/nwrite?board=3"
	  }
  }
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
             
             <div class="col-sm-8 col-sm-offset-1">
          
               <h1>고객 센터</h1>
                <h4 class="font-alt mb-0">자주 묻는 질문</h4>
                <hr class="divider-w mt-10 mb-20">
               <div class="qnabox" >
                <c:forEach items="${qna}" var="n" varStatus="vn">
                <div class="panel-group " id="accordion">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4 class="panel-title font-alt"><a data-toggle="collapse" data-parent="#accordion" href="#support${vn.count }">${n.ntitle }</a></h4>
                    </div>
                    <div class="panel-collapse collapse " id="support${vn.count }">
                      <div class="panel-body">${n.ncontent } </div>
                  </div>
                </div>
               
          </div>
         </c:forEach>
         </div>
          <h4 class="font-alt mb-0">1:1 문의내역</h4>
         
         <c:choose>
          <c:when test="${sessionScope.mid eq null}">
          <button onclick="commentN()">1대1 문의하기</button>
       	  </c:when>
       	  <c:otherwise>
       	  <button onclick="commentM()">1대1 문의하기</button>
       	  </c:otherwise>
       	  </c:choose>
         <div class="askbox">
         	<c:choose>
         	<c:when test="${sessionScope.mid eq null}">
         	<div class="login">
         	<button onclick="commentN()">로그인</button>
         	<h3>로그인 후 이용 가능합니다.</h3>
         	</div>
         	</c:when>
         	<c:when test="${empty inquire }">
         		문의 내역이 없습니다 
         	</c:when>
         	
         	<c:otherwise>
         	<table class="table table-dark table-hover table-striped">
               <thead>
               	<tr class="row">
               		<th class="col-6 title">제목</th>
               		<th class="col-2">날짜</th>
               		<th class="col-2">글쓴이</th>
               		<th class="col-2">읽음</th>
               	</tr>
               </thead>
         	<c:forEach items="${inquire }" var="t">
       		 
       		<tr class="row detail" onclick="location.href='./ndetail?board=3&nno=${t.nno}'">
               		<td class="col-6 title">${t.ntitle }</td>
               		<td class="col-2">${t.ndate }</td>
               		<td class="col-2">${t.mid }</td>
               		<td class="col-2">${t.nread }</td>
                </tr>
         	
         	</c:forEach>
         	
         	</table>
         	</c:otherwise>
         	
         	</c:choose>
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
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
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