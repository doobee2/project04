<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>해법해법</title>
    <jsp:include page="../layout/head.jsp" />
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<div class="container-fluid bg-light py-5">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                <div class="case-item position-relative overflow-hidden rounded mb-2">
                    <a href="${path}/admin/memberConf.do" class="case-overlay text-decoration-none">
                        <h2 class="card-img-top mb-2">회원관리</h2>
                        <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                <div class="case-item position-relative overflow-hidden rounded mb-2">
                    <img class="card-img-top mb-2" src="${path }/resources/upload/lecture/${lec.thumbnail }" alt="강의썸네일" />
                    <a href="${path}/admin/" class="case-overlay text-decoration-none">
                        <h2 class="card-img-top mb-2">강의관리</h2>
                        <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                <div class="case-item position-relative overflow-hidden rounded mb-2">
                    <img class="card-img-top mb-2" src="${path }/resources/upload/lecture/${lec.thumbnail }" alt="강의썸네일" />
                    <a href="${path}/lecture/get.do?lno=${lec.lno}" class="case-overlay text-decoration-none">
                        <h2>결제관리</h2>
                        <h5 class="lh-base text-white mb-3">${lec.subTitle}</h5>
                        <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                <div class="case-item position-relative overflow-hidden rounded mb-2">
                    <img class="card-img-top mb-2" src="${path }/resources/upload/lecture/${lec.thumbnail }" alt="강의썸네일" />
                    <a href="${path}/lecture/get.do?lno=${lec.lno}" class="case-overlay text-decoration-none">
                        <h2>게시판관리</h2>
                        <h5 class="lh-base text-white mb-3">${lec.subTitle}</h5>
                        <span class="btn btn-square btn-primary"><i class="fa fa-arrow-right"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../layout/adminFooter.jsp" />
</body>



</html>