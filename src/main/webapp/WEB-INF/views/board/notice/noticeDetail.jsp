<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>공지사항 상세보기</title>
    <jsp:include page="../../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/boardget.css">
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
        <section class="section blog-wrap container">
            <div class="detail">
                <div class="conwrap">
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
                            <a class="btn btn-warning" href="${path }/notice/list.do">목록</a>
                            <c:if test='${sid eq "admin"}'>
                                <a class="btn btn-info" href="${path }/notice/edit.do?no=${notice.no}">수정</a>
                                <a class="btn btn-danger" href="${path }/notice/delete.do?no=${notice.no}">삭제</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
        <jsp:include page="../../layout/footer.jsp" />
</body>
</html>
