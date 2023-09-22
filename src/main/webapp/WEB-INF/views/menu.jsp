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
              
              < <li class="dropdown"><a class="dropdown-toggle" href="/community/boardM" data-toggle="dropdown">커뮤니티&고객센터</a>
                <ul class="dropdown-menu">
                  <li class="dropdown"><a class="dropdown-toggle" href="/community/" data-toggle="dropdown">커뮤니티</a>
                    <ul class="dropdown-menu">
                      <li><a href="/community/board?board=1">자유게시판</a></li>
                      <li><a href="/community/board?board=2">독후감</a></li>
                      <li><a href="/community/board?board=3">모임&스터디</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="dropdown-toggle" href="/community/noticeM" data-toggle="dropdown">고객센터</a>
                    <ul class="dropdown-menu">
                      <li><a href="/community/notice?board=1">공지사항</a></li>
                      <li><a href="/community/notice?board=2">Q&A</a></li>
                    </ul>
                  </li>
             
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
 