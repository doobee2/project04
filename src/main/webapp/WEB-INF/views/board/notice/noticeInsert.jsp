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
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
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
    <div class="content" id="contents">
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
        <table class="table">
        <form action="${path }/notice/insert.do" method="post">
                <table id="table1" class="table">
                    <tbody>
                    <tr>
                        <th class="has-text-white has-text-centered">글 제목</th>
                        <td>
                            <input class="input" type="text" name="title" id="title" placeholder="제목 입력" maxlength="98" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="has-text-white has-text-centered">글 내용</th>
                        <td>
                            <textarea class="textarea" name="content" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required></textarea>
                            <script>
                                CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path }/util/imageUpload.do'});
                            </script>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="buttons is-centered">
                    <input type="submit" class="is-mainColor button" value="글 등록" >
                    <a class="button is-success" href="${path }/notice/list.do">글 목록</a>
                </div>
            </form>
    </div>
</div>
<jsp:include page="../../layout/footer.jsp" />

</body>

</html>
