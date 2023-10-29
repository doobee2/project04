<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!-- Navbar Start -->
<div class="container-fluid sticky-top">
    <div class="container">

        <div class="d-block">
            <c:if test="${not empty sid}">
                <a href="${path }/user/myPage.do" class="d-inline btn btn-primary">마이페이지</a>
                <a href="${path }/user/logout.do" class="btn btn-primary px-4 mr-2"><i class="fas fa-sign-out-alt pr-2" style="color:#ffffff;"></i> 로그아웃</a>
            </c:if>
            <c:if test="${empty sid}">
                <a href="${path }/user/term.do" class="btn btn-primary px-4 mr-2"><i class="fas fa-user-plus pr-2" style="color:#ffffff;"></i>회원가입</a>
                <a href="${path }/user/login.do" class="btn btn-success px-4"><i class="fas fa-sign-in-alt pr-2" style="color:#ffffff;"></i>로그인</a>
            </c:if>
            <c:if test='${sid == "admin"}'>
                <a href="${path }/admin/" class="d-inline btn btn-primary">관리자페이지</a>
            </c:if>
        </div>


        <nav class="navbar navbar-expand-lg navbar-dark p-0">
            <a href="${path }/" class="navbar-brand">
                <h1 class="text-white"><img src="${path}/resources/image/common/logo_main.png" alt="해법로고"></h1>
            </a>
            <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto">
                    <a href="${path }/intro" class="nav-item nav-link active">해법</a>
                    <a href="${path }/lecture/list.do" class="nav-item nav-link">온라인강의</a>

                    <div class="nav-item dropdown">
                        <a href="${path }/notice/list.do" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                        <div class="dropdown-menu bg-light mt-2">
                            <a href="${path }/notice/list.do" class="dropdown-item">공지사항</a>
                            <a href="${path }/free/list.do" class="dropdown-item">자유게시판</a>
                            <a href="${path }/databoard/list.do" class="dropdown-item">학습자료실</a>
                        </div>
                    </div>
                    <a href="${path }/map" class="nav-item nav-link">오시는길</a>
                    <a href="${path }/game" class="nav-item nav-link"><i class="fas fa-gamepad" style="color: #000000;"></i></a>
                </div>
            </div>
        </nav>

    </div>
</div>

<!-- Navbar End -->