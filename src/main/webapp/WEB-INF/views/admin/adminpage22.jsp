<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../layout/head.jsp" />
    <meta charset="utf-8">
    <title>해법해법</title>
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <link rel="stylesheet" href="${path }/resources/css/admin.css">
</head>
<body>


<!--*******************
    Preloader start
********************-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
    </div>
</div>

<%-- 관리자 페이지 바 --%>
<div id="main-wrapper">
    <div class="nav-header">
        <div class="brand-logo">
            <a href="${path }/admin/adminpage">
                <b class="logo-abbr"> </b>
                <span class="brand-title">
                         <a href="${path }/admin/adminpage" class="navbar-brand">
                <h1 class="text-white"><img src="${path }/resources/image/common/logo.png" alt="해법 로고"></h1>
            </a></span>

            </a>
        </div>
    </div>
    <div class="nk-sidebar">
        <div class="nk-nav-scroll">
            <ul class="metismenu" id="menu">
                <li class="nav-label">회원관리</li>
                <li class="mega-menu mega-menu-sm">
                    <ul aria-expanded="false">
                        <li><a href="${path }/admin/UserListAdmin.do">회원목록</a></li>
                    </ul>
                </li>
                <li class="nav-label">게시판관리</li>
                <li>
                    <ul aria-expanded="false">
                        <li><a href="${path }/admin/noticeList.do">공지사항</a></li>
                        <li><a href="${path }/admin/FreeListAdmin.do">자유게시판</a></li>
                        <li><a href="">묻고답하기</a></li>
                        <li><a href="./index-2.html">자주묻는질문</a></li>
                        <li><a href="">자료실</a></li>
                    </ul>
                </li>
                <li class="nav-label">강의관리</li>
                <li>
                    <ul aria-expanded="false">
                        <li><a href="${path }/admin/lectList.do">강의 관리</a></li>
                        <li><a href="">강사 관리</a></li>
                        <li><a href="">수강생 관리</a></li>
                    </ul>
                </li>

                <li class="nav-label">Pages</li>
                <li>
                    <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                    </a>
                    <ul aria-expanded="false">
                        <li><a href="./page-login.html">Login</a></li>
                        <li><a href="./page-register.html">Register</a></li>
                        <li><a href="./page-lock.html">Lock Screen</a></li>
                        <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                            <ul aria-expanded="false">
                                <li><a href="./page-error-404.html">Error 404</a></li>
                                <li><a href="./page-error-403.html">Error 403</a></li>
                                <li><a href="./page-error-400.html">Error 400</a></li>
                                <li><a href="./page-error-500.html">Error 500</a></li>
                                <li><a href="./page-error-503.html">Error 503</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <%-- 관리자 페이지 바 끝 --%>


    <!-- 최신 강의 목록 -->
    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <h>최신 강의 확인하기</h>
            <c:forEach var="lec" items="${lectureList}">
                <div class="col-sm-12 col-xl-6">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h4><a href="${path}/lecture/get.do?lno=${lec.lno}">${lec.lect_tit}</a></h4>
                            <p>${lec.subTitle}</p>
                        </div>
                        <c:choose>
                            <c:when test="${!empty lec.thumbnail}">
                                <img class="card-img-top mb-2" id="worldwide-sales" src="${path }/resources/upload/lecture/${lec.thumbnail }" width="300px" alt="강의썸네일" />
                            </c:when>
                            <c:otherwise>
                                <img class="card-img-top mb-2" id="worldwide-sales" src="${path }/resources/upload/lecture/dummy.png" width="300px" alt="더미썸네일" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- 강의 목록 끝 -->
    <!-- 리뷰 목록 -->
    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-sm-12 col-md-6 col-xl-8">
                <div class="h-100 bg-light rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <h6 class="mb-0">최신 리뷰</h6>
                    </div>
                    <c:forEach var="rev" items="${reviewList}">
                        <div class="d-flex align-items-center border-bottom py-3">
                            <div class="w-100 ms-3">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-0">${rev.memId}</h6>
                                </div>
                                <span>${rev.content}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- 리뷰목록 끝 -->


    <%-- 관리자 페이지 메인 시작 --%>
    <div class="content-body">
        <div class="container-fluid mt-3">
            <div class="row">
                <h2> 안녕하세요 관리자님! </h2>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-3">
                        <div class="card-body">
                            <h3 class="card-title text-white">현재 회원</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">4565</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-1">
                        <div class="card-body">
                            <h3 class="card-title text-white">강의</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">4565</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-2">
                        <div class="card-body">
                            <h3 class="card-title text-white">Net Profit</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">$ 8541</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-sm-6">
                    <div class="card gradient-4">
                        <div class="card-body">
                            <h3 class="card-title text-white">Customer Satisfaction</h3>
                            <div class="d-inline-block">
                                <h2 class="text-white">99%</h2>
                                <p class="text-white mb-0">Jan - March 2019</p>
                            </div>
                            <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            <%-- 회원 목록 --%>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="active-member">
                                <div class="table-responsive">
                                    <h2 class="h1">회원 목록</h2>
                                    <table class="table table-xs mb-0">
                                        <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>포인트</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        gsdfgfgdg
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="social-graph-wrapper widget-facebook">
                            <span class="s-icon"><i class="fa fa-facebook"></i></span>
                        </div>
                        <div class="row">
                            <div class="col-6 border-right">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">89k</h4>
                                    <p class="m-0">Friends</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">119k</h4>
                                    <p class="m-0">Followers</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="social-graph-wrapper widget-linkedin">
                            <span class="s-icon"><i class="fa fa-linkedin"></i></span>
                        </div>
                        <div class="row">
                            <div class="col-6 border-right">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">89k</h4>
                                    <p class="m-0">Friends</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">119k</h4>
                                    <p class="m-0">Followers</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="social-graph-wrapper widget-googleplus">
                            <span class="s-icon"><i class="fa fa-google-plus"></i></span>
                        </div>
                        <div class="row">
                            <div class="col-6 border-right">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">89k</h4>
                                    <p class="m-0">Friends</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">119k</h4>
                                    <p class="m-0">Followers</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="social-graph-wrapper widget-twitter">
                            <span class="s-icon"><i class="fa fa-twitter"></i></span>
                        </div>
                        <div class="row">
                            <div class="col-6 border-right">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">89k</h4>
                                    <p class="m-0">Friends</p>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="pt-3 pb-3 pl-0 pr-0 text-center">
                                    <h4 class="m-1">119k</h4>
                                    <p class="m-0">Followers</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- 관리자 페이지 메인 끝ㅌ --%>
</div>

</body>



</html>