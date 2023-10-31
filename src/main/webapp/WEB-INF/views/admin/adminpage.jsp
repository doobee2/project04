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

    <style>
        .content.menu {
            text-align: center;
            font-size: 40px;
        }
        .content.menu a {
            width: 300px;
            height: 200px;
            margin: 50px;
            text-align: center;
            line-height: 9;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<!-- 페이지 상단 -->
<div class="container-fluid pt-5 bg-primary hero-header">
    <div class="container pt-5">
        <div class="row g-5 pt-5">
            <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                <h1 class="display-4 text-white mb-4 animated slideInRight">관리자페이지</h1>
            </div>
        </div>
    </div>
</div>
<!-- 페이지 상단 끝 -->
<!-- 메뉴탭-->
<div class="container-fluid">
    <div class="content menu">
        <a href="${path}/admin/" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">관리자홈</a>
        <a href="${path}/admin/memberConf.do" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">회원관리</a>
        <a href="${path}/admin/paylistAdmin.do" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">결제목록</a><br>
        <a href="${path}/admin/lectList.do" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">강의관리</a>
        <a href="${path}/admin/noticeList.do" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">공지사항</a>
        <a href="${path}/admin/FreeListAdmin.do" class="btn btn-primary btn-lg" tabindex="-1" role="button" aria-disabled="true">자유게시판</a>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>