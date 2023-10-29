<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항 상세보기</title>
    <jsp:include page="../../layout/head.jsp" />
    <link rel="stylesheet" href="${path}/resources/css/board.css">
</head>

<body>

<jsp:include page="../../layout/header.jsp" />
<!-- 페이지 상단 -->
<div class="container-fluid pt-5 bg-primary hero-header">
    <div class="container pt-5">
        <div class="row g-5 pt-5">
            <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                <h1 class="display-4 text-white mb-4 animated slideInRight">공지사항</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                        <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                        <li class="breadcrumb-item"><a class="text-white" href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">공지사항</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- 페이지 상단 끝 -->

<div class="container-fluid mb-5">
<div class="content">
    <section class="page-title bg-02">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">공지사항 상세보기</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section blog-wrap container">
        <div class="detail">
            <div class="conwrap">
                <div class="h3group">
                    <div class="location">
                        <span class="depth">홈</span>
                        <span class="depth">/ 회사소개</span><strong class="this">/ 공지사항</strong>
                    </div>
                </div>
    <div class="viewbody">
        <div class="hgroup">
            <c:if test="${ sid eq 'admin'}">
                <div class="no">NO ${notice.no }</div>
            </c:if>
            <div class="tit">${notice.title }</div>
            <div class="util">
                <div class="date">작성일${notice.regdate }</div>
                <div class="hit">조회수 ${notice.visited }</div></div>
        </div>
        <div class="content">
            ${notice.content }
        </div>
        <div class="buttons is-centered">
            <a class="button is-mainColor" href="${path }/notice/list.do">글 목록</a>
            <c:if test='${sid eq "admin"}'>
                <a class="button is-success" href="${path }/notice/edit.do?no=${notice.no}">글 수정</a>
                <a class="button is-mainColor" href="${path }/notice/delete.do?no=${notice.no}">글 삭제</a>
            </c:if>
        </div>
    </div>
</div>
</div>
        <jsp:include page="../../layout/footer.jsp" />
</body>

</html>