<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내용</title>
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
    <link rel="manifest" href="assets/images/favicons/manifest.json">
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
<style type="text/css">
	.con{
		
		padding: 60px;
		}
	.head{
		margin : 6px;
		border-bottom : solid 1px;
		
		
	}
	.title{
	float:left; width: 65%
	}
	.name{
		 left: 100px; width:35%
	}
	.content{
		margin: 5px; 
		border-bottom: solid 1px;
		min-height: 300px;
		
	}
	
	.comment1{
		margin : 5px;
		height : 80px;
	}
	textarea{
		width: 80%;
	}
	.commentBody{
		margin : 5px;
		min-height: 30px;
	}
</style>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function del() {
	let chk = confirm("삭제하시겠습니까?"); //참  거짓으로 나옵니다.

	if(chk) {
		location.href ="./bdelete?board=${bdetail.bcate}&bno=${bdetail.bno }";
	}
}
function edit(){
	let chk2 = confirm("수정하시겠습니까?");
	
	if(chk2){
		location.href="./edit?board=${bdetail.bcate}&bno=${bdetail.bno }"
	}
	
}
</script>
<script type="text/javascript">
$(function(){
	$(".cdel").click(function(){
		if(confirm("댓글을 삭제하시겠습니까?")){
			let cno = $(this).parent().siblings(".cid").text();
			let comments=$(this).parent().parent().parents(".comment");
			
			$.ajax({
				url:"./cdelR",
				type:"post",
				data:{bno:${bdetail.bno}, cno:cno},
				dataType: "json",
				success:function(data){
					if(data.result==1){
						comments.remove();
					}else{
						alert("통신에 문제가 발생했습니다.")
					}
				},
				error:function(error){
					alert("에러가 발생했습니다.");

				}
			});
			
		}
	});	
	$(".cedit").click(function(){
		if(confirm("댓글을 수정하시겠습니까?")){
		 //alert("수정하기");
		let cno = $(this).parent().siblings(".cid").text();
		let comment =$(this).parent().parent().siblings(".commentBody").text();
		
		
		let recommentB='<div class="recommentB">';
		recommentB += '<form action="./cedit" method="post">';
		recommentB += '<textarea id="rcta" name="recomment">'+comment+'</textarea>';
		recommentB += '<input type="hidden" id="bno" name="bno" value="${bdetail.bno}">';
		recommentB += '<input type="hidden" id="cno" name="cno" value="'+cno+'">';
		recommentB += '<button type="submit" id="recomment">댓글수정하기</button>';
		recommentB += '</form>';
		recommentB += '</div>';
		
		let commentDIV = $(this).parents(".comment");
		commentDIV.after(recommentB);
		commentDIV.remove();
		}
	});
	
});
</script>
</head>

 <!-- --------------------------------------------------- 상단 ---------------------------------------------------------------- -->   
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="main">
        <hr class="divider-w">
        
        <section class="module-small">
          <div class="container">

          </div>
        </section>
       <hr class="divider-w">
          <div class="container con" >
          	
            	<div class="head">
					<div class="title"><h2 style="display:inline">${bdetail.btitle}</h2> &nbsp; <button onclick="edit()">수정하기</button><button onclick="del()">삭제하기</button></div>
					<div class="name" >${bdetail.mname } / ${bdetail.bdate }</div>
				</div>
			
				<div class="content">
					${bdetail.bcontent }
				</div>
				<button onclick="location.href='./board?board=${param.board}'">게시판으로</button>
			<div class="comment1">
			<form action="./comment" method="post">
				<textarea name="comment" ></textarea>
				<button type="submit" id="comment" >댓글쓰기</button>
				<input type="hidden" name ="bno" value="${bdetail.bno}">
				<input type="hidden" name ="board" value="${param.board}">
			</form>
			</div>
			<div class="commentsList">
		<c:choose>
			<c:when test="${fn:length(commentsList) gt 0 }">
			<div class="comments">
			<c:forEach items="${commentsList }" var="c" >
				<div class ="comment">
				<div class="commentHead">
				<div class="u_id">
				 ${c.mname }
				</div>
				<div class="u_date">${c.cdate }</div>
				<div class="cid">${c.cno }</div>
				<div> <button class="cedit">수정하기</button> <button class="cdel">삭제하기</button></div>
				</div>
				
				<div class="commentBody">  ${c.comment }</div>
				</div>
			</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
			<div><h2>댓글이 없습니다</h2></div>
			</c:otherwise>
		</c:choose>
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