<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
             <ul class="nav navbar-nav navbar-right" style="margin-right: -10%;">
             <c:if test="${sessionScope.mid ne null}">
               <li><a style="color: white;">안녕하세요 ${sessionScope.mname }님</a></li>
             </c:if>
            </ul>
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="/main">DongneBook</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">

            <ul class="nav navbar-nav navbar-right">
              <li><a href="/main">메인</a>
              </li>
              
              <li class="dropdown"><a class="dropdown-toggle" href="/booklist?bkcate=0" data-toggle="dropdown">책</a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="/booklist">도서</a>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">장르</a>
                    <ul class="dropdown-menu">
                      <li><a href="/booklist?bkcate=1">소설</a></li>
                      <li><a href="/booklist?bkcate=2">에세이</a></li>
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

              <c:if test="${sessionScope.mname ne null && sessionScope.mname eq 'admin'}">
	              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">관리자 페이지</a>
	              	<ul class="dropdown-menu" role="menu">
	                  <li><a href="/admin/board">게시물 관리</a></li>
	                  <li><a href="/admin/notice">공지사항</a></li>
	                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">구매</a>
	                  	<ul class="dropdown-menu">
		                  <li><a href="/admin/stock">재고 관리</a></li>
		                  <li><a href="/admin/booknotice">상품 등록</a></li>
		                  <li><a href="/admin/sales">매출액</a></li>
	                  	</ul>
	                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">대여</a>
	                  	<ul class="dropdown-menu">
		                  <li><a href="/admin/rent">대여 관리</a></li>
		                  <li><a href="/admin/rentalAmount">대여량</a></li>
	                  	</ul>
	                </ul>
	               </li>
               </c:if>
               <c:if test="${sessionScope.mname ne null && sessionScope.mname ne 'admin'}">
	              <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown">마이페이지</a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="/mypage/main">메인</a></li>
	                  <li><a href="/mypage/zzim">찜목록</a></li>
	                  <li><a href="/mypage/buy">구매목록</a></li>
	                  <li><a href="/mypage/rent">대여내역</a></li>
	                  <li><a href="/mypage/board">게시물 관리</a></li>
	                  <li><a href="/mypage/comment">댓글 관리</a></li>
	                  <li><a href="/userinfo">회원정보</a></li>
	                  <li><a href="/mypage/info">회원정보관리</a></li>
	                </ul>
	              </li>
              </c:if>
              <c:choose>
	              <c:when test="${sessionScope.mid eq null}">
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
 