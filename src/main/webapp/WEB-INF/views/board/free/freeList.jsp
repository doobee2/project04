<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>해법::자유게시판</title>
	<jsp:include page="../../layout/head.jsp" />
</head>
<body>
<jsp:include page="../../layout/header.jsp" />
<!-- 페이지 상단 -->
<div class="container-fluid pt-5 bg-primary hero-header">
	<div class="container pt-5">
		<div class="row g-5 pt-5">
			<div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
				<h1 class="display-4 text-white mb-4 animated slideInRight">자유게시판</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb justify-content-center justify-content-lg-start mb-0">
						<li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
						<li class="breadcrumb-item"><a class="text-white" href="#">커뮤니티</a></li>
						<li class="breadcrumb-item text-white active" aria-current="page">자유게시판</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!-- 페이지 상단 끝 -->
<div class="container-fluid mb-5">
<section class="section blog-wrap container">
	<%-- 검색창(자유게시판-제목,내용,작성자) --%>
	<form action="${path }/free/list.do" method="get" class="field has-addons has-addons-right">
		<p class="control">
				<span class="select">
					<select id="type" name="type">
						<option value="title"<c:if test="${type eq 'title' }"> selected</c:if>>제목</option>
						<option value="content"<c:if test="${type eq 'content' }"> selected</c:if>>내용</option>
						<option value="author"<c:if test="${type eq 'author' }"> selected</c:if>>작성자</option>
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
			<th class="has-text-centered has-text-white">글번호</th>
			<th class="has-text-centered has-text-white">제목</th>
			<th class="has-text-centered has-text-white">작성자</th>
			<th class="has-text-centered has-text-white">작성일</th>
			<th class="has-text-centered has-text-white">조회수</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${not empty freeList }">
			<c:forEach items="${freeList }" var="free" varStatus="status">
				<tr>
					<td class="has-text-centered">${status.count }</td>
					<td class="has-text-centered"><a href="${path}/free/detail.do?fno=${free.fno }">${free.title }</a></td>
					<td class="has-text-centered">${free.author}</td>
					<td class="has-text-centered">
						<fmt:parseDate value="${free.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
						<fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
					</td>
					<td class="has-text-centered">${free.visited }</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty freeList }">
			<tr>
				<td class="has-text-centered" colspan="5">자유게시판에 글이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		</tbody>
	</table>
	<c:if test="${not empty sid}">
		<div class="buttons is-centered">
			<a class="button is-mainColor" href="${path }/free/insert.do">글쓰기</a>
		</div>
	</c:if>
</section>

<%-- 페이징처리 --%>
<nav class="pagination is-rounded is-centered mb-6" role="navigation" aria-label="pagination">
	<c:if test="${curPage > page.pageCount }">
		<a href="${path }/free/list.do?page=${page.blockStartNum - 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-previous">Previous</a>
	</c:if>
	<c:if test="${page.blockLastNum < page.totalPageCount }">
		<a href="${path }/free/list.do?page=${page.blockLastNum + 1 }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-next">Next page</a>
	</c:if>

	<ul class="pagination-list">
		<c:forEach var="i" begin="${page.blockStartNum }" end="${page.blockLastNum }">
			<c:choose>
				<c:when test="${i == curPage }">
					<li>
						<a href="${path }/free/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link is-current" aria-label="Page ${i }" aria-current="page">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="${path }/free/list.do?page=${i }<c:if test="${!empty keyword }">&type=${type }&keyword=${keyword }</c:if>" class="pagination-link" aria-label="Page ${i }" aria-current="page">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
</nav>

</div>
</div>

<jsp:include page="../../layout/footer.jsp" />
</body>
</html>

