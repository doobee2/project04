<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>해법</title>
    <%@ include file="../../layout/head.jsp" %>
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
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
        <form action="${path }/databoard/insert.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sid" id="sid" value="${sid}">
            <table class="table">
                <tbody>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="title">제목</label></th>
                    <td><input type="text" class="input" name="title" id="title" placeholder="제목 입력"></td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="contents">내용</label></th>
                    <td>
                        <textarea name="contents" id="contents" class="textarea" placeholder="내용 입력" maxlength="1500"></textarea>
                        <script>
                            CKEDITOR.replace('contents', {filebrowserUploadUrl: '${path}/datafile/upload.do'});
                        </script>
                    </td>
                </tr>
                <tr>
                    <th class="has-text-centered has-text-white"><label for="uploadFiles">파일 업로드(10MB 이하)</label></th>
                    <td>
                        <input class="input" type="file" name="uploadFiles" id="uploadFiles" multiple="true">
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="buttons is-centered">
                <input class="button is-mainColor" type="submit" value="작성하기">
                <a href="${path }/databoard/list.do" class="button is-success">글 목록</a>
            </div>
        </form>

    </section>
</div>

<%@ include file="../../layout/footer.jsp" %>
</body>
</html>
