<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>해법::공지사항</title>
    <jsp:include page="../../layout/head.jsp" />
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
                        <h1 class="is-capitalize text-lg font-happy">공지사항</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <form action="${path }/notice/list.do" method="get" class="field has-addons has-addons-right">
            <p class="control">
                <span class="select">
                    <select id="type" name="type">
                        <option value="title">제목</option>
                    </select>
                </span>
            </p>
            <p class="control">
                <input class="input" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" value="${keyword }">
            </p>
            <p class="control">
                <input type="submit" class="button is-mainColor" value="검색" />
            </p>
        </form>

        <table class="table">
            <thead>
            <tr>
                <th class="has-text-white has-text-centered">글번호</th>
                <th class="has-text-white has-text-centered">제목</th>
                <th class="has-text-white has-text-centered">작성일</th>
                <th class="has-text-white has-text-centered">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${noticeList }" var="notice" varStatus="status">
                <tr>
                    <td class="has-text-centered">${status.count }</td>
                    <td class="has-text-centered"><a href="${path }/notice/detail.do?no=${notice.no }">${notice.title }</a></td>
                    <td class="has-text-centered">
                        <fmt:parseDate value="${notice.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                    </td>
                    <td class="has-text-centered">${notice.visited }</td>
                </tr>
            </c:forEach>
            <c:if test="${empty noticeList}">
                <tr>
                  <td class="has-text-centered" colspan="4">해당 목록이 존재하지 않습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>

        <c:if test='${sid eq "admin"}'>
        <div class="buttons is-centered">
            <a href="${path }/notice/insert.do" class="button is-mainColor">공지 등록</a>
        </div>
        </c:if>

        <nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
            <c:if test="${curPage > page.pageCount }">
                <a href="${path }/notice/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
            </c:if>
            <c:if test="${page.blockLastNum < page.totalPageCount }">
                <a href="${path }/notice/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
            </c:if>

            <ul class="pagination-list">
                <c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
                    <c:choose>
                        <c:when test="${i == curPage }">
                            <li>
                                <a href="${path }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${path }/notice/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </nav>
    </section>
</div>
</div>
<jsp:include page="../../layout/footer.jsp" />
</body>
</html>

