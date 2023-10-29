<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>해법</title>
    <%@ include file="../../layout/head.jsp" %>
</head>
<body>
<jsp:include page="../../layout/header.jsp" />
<!-- 페이지 상단 -->
<div class="container-fluid pt-5 bg-primary hero-header">
    <div class="container pt-5">
        <div class="row g-5 pt-5">
            <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                <h1 class="display-4 text-white mb-4 animated slideInRight">자료실</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
                        <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                        <li class="breadcrumb-item"><a class="text-white" href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">자료실</li>
                    </ol>
                </nav>
            </div>
            <div class="col-lg-6 align-self-end text-center text-lg-end">
                <img class="img-fluid" src="${path }/resources/img/hero-img.png" alt="" style="max-height: 300px;">
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="searchModal" tabindex="-1">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content" style="background: rgba(20, 24, 62, 0.7);">
            <div class="modal-header border-0">
                <button type="button" class="btn btn-square bg-white btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center justify-content-center">
                <div class="input-group" style="max-width: 600px;">
                    <input type="text" class="form-control bg-transparent border-light p-3"
                           placeholder="Type search keyword">
                    <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 페이지 상단 끝 -->

<div class="content">

    <section class="page-title bg-04">
        <div class="container">
            <div class="columns">
                <div class="column is-12">
                    <div class="block has-text-centered">
                        <h1 class="is-capitalize text-lg font-happy">자료실</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="section blog-wrap container">
        <table class="table">
            <thead>
            <tr>
                <th class="item2 has-text-white has-text-centered">제목</th>
                <th class="item3 has-text-white has-text-centered">작성일</th>
                <th class="item4 has-text-white has-text-centered">조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="item2 has-text-centered">${dto.title}</td>
                <td class="item3 has-text-centered">
                    <fmt:parseDate value="${dto.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
                    <fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
                </td>
                <td class="item4 has-text-centered">${dto.visited}</td>
            </tr>
            <c:if test="${!empty datafiles}">
            <tr>
                <td colspan="3">
                    <c:forEach var="file" items="${datafiles}">
                        <div class="databoardFile">
                            <a href="${path}/resources/upload/${file.saveFolder}/${file.saveName}" download="${file.fileName}"><i class="icofont-ui-file mr-2"></i>${file.fileName}</a>
                        </div>
                    </c:forEach>
                </td>
            </tr>
            </c:if>
            <tr>
                <td colspan="3" id="content">
                    ${dto.content}
                </td>
            </tr>
            </tbody>
        </table>
        <div class="buttons is-centered">
            <a href="${path }/databoard/list.do" class="button is-mainColor">글 목록</a>
            <c:if test="${not empty sid && (sid eq 'admin' || dto.author eq sid)}">
                <a href="${path }/databoard/edit.do?bno=${dto.bno}&author=${dto.author}" class="button is-success">글 수정</a>
                <a href="${path }/databoard/delete.do?bno=${dto.bno}&author=${dto.author}" class="button is-mainColor">글 삭제</a>
            </c:if>
        </div>
    </section>


</div>

<%@ include file="../../layout/footer.jsp" %>
</body>
</html>