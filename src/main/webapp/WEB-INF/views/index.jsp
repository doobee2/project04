<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="./layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.css" />
    <link rel="stylesheet" href="${path }/resources/css/index.css" />
    <meta charset="utf-8">
    <title>스마트해법</title>
    <style>
        .container-fluid.bg-index {
            background-image: url("${path}/resources/image/sub/banner01.png") !important;
            background-size: cover!important;
            background-position-y: center;
        }
    </style>
</head>
<body>
<!-- 템플릿 -->
<!-- Spinner Start -->
<div id="spinner"
     class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->
<jsp:include page="./layout/header.jsp" />
<!-- 배너-->
<div class="container-fluid pt-5 hero-header mb-5 bg-index">
    <div class="container pt-5">
        <div class="row g-5 pt-5">
            <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                <div class="btn btn-sm border rounded-pill text-white px-3 mb-3 animated slideInRight">EDUTECH</div>
                <h1 class="display-4 text-white mb-4 animated slideInRight">우리 아이 첫 교육,
                    <br> 해법에서 시작하세요!</h1>
                <a href="${path}/intro" class="btn btn-light py-sm-3 px-sm-5 rounded-pill me-3 animated slideInRight">스마트해법</a>
                <a href="${path}/lecture/list.do" class="btn btn-outline-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">강의찾기</a>
            </div>
        </div>
    </div>
</div>
<!-- 배너 끝 -->

<!-- 강의목록 -->
<div class="container-fluid bg-light py-5">

    <div class="container py-5">
        <div class="mx-auto text-center wow fadeIn" data-wow-delay="0.1s" style="max-width: 500px;">
            <div class="btn btn-sm border rounded-pill text-primary px-3 mb-3">Case Study</div>
            <h1 class="mb-4">온라인에서 경험하는<br>최고의 강의!</h1>
        </div>
        <div class="row g-4">
            <c:forEach var="lec" items="${lectureList}">
            <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                <div class="case-item position-relative overflow-hidden rounded mb-2">
                    <c:choose>
                        <c:when test="${!empty lec.thumbnail}">
                        <img class="card-img-top mb-2" src="${path }/resources/upload/lecture/${lec.thumbnail }" alt="강의썸네일" />
                        </c:when>
                        <c:otherwise>
                        <img class="card-img-top mb-2" src="${path }/resources/upload/lecture/dummy.png" alt="더미썸네일" />
                        </c:otherwise>
                    </c:choose>
                    <a href="${path}/lecture/get.do?lno=${lec.lno}" class="case-overlay text-decoration-none">
                        <small>${lec.lect_tit}</small>
                        <h5 class="lh-base text-white mb-3">${lec.subTitle}</h5>
                        <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                    </a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- 강의목록 끝 -->
<!-- 수강생 후기 -->
<div class="container-xxl py-5">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-5 wow fadeIn" data-wow-delay="0.1s">
                <h1 class="mb-4">수강생 후기</h1>
                <p class="mb-4">
                    최고의 교육센터 '해법'을 경험한 수강생들의 리얼한 수강 후기입니다. <br> 여러분도 경험해보세요!
                </p>
            </div>
            <div class="col-lg-7 wow fadeIn" data-wow-delay="0.5s">
                <div class="owl-carousel testimonial-carousel border-start border-primary">
                    <c:forEach var="rev" items="${reviewList}">
                    <div class="testimonial-item ps-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p class="fs-4">${rev.content}</p>
                        <div class="d-flex align-items-center">
                            <div class="ps-3">
                                <h5 class="mb-1">${rev.memId}</h5>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 수강생 후기 끝 -->
<jsp:include page="./layout/footer.jsp" />
</body>
</html>