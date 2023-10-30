<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::로그인</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <style>
        * {
            box-sizing: border-box;
        }
        h1{
            color: #3BBAE2
        }


        .container-login {
            background-color: rgba(197, 197, 197, 0.7);
            padding: 20px 40px;
            border-radius: 5px;
            width: 600px;
            display: block;
            margin: 50px auto;
        }

        .container-login h1 {
            text-align: center;
            margin-bottom: 40px;
            margin-top: 30px;
        }

        .container-login a {
            text-decoration: none;
            color: #3BBAE2;
        }

        .login-btn {
            cursor: pointer;
            display: inline-block;
            width: 100%;
            background: #3BBAE2;
            padding: 15px;
            font-family: inherit;
            font-size: 16px;
            border: 0;
            border-radius: 5px;
        }

        .login-btn:focus {
            outline: 0;
        }

        .login-btn:active {
            transform: scale(0.98);
        }

        .text {
            margin-top: 30px;
        }

        .form-controller {
            position: relative;
            margin: 20px 0 40px;
            width: 100%;
        }

        .form-controller input {
            border: none;
            border-bottom: 2px #fff solid;
            width: 100%;
            padding: 10px 0;
            font-size: 18px;
            color: black;
            display: block;
            visibility: hidden;
        }

        .form-controller input:focus,
        .form-controller input:valid {
            outline: 0;
            border-bottom-color: #3BBAE2;
        }

        .form-controller label {
            position: absolute;
            top: 19px;
            left: 8px;
            pointer-events: none;
            color: #3BBAE2;
        }

        form p {
            letter-spacing: 0.3rem;
            display: flex;
            justify-content: space-between;
        }

        .form-controller label span {
            display: inline-block;
            font-size: 18px;
            min-width: 5px;
            transition: 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
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
                <h1 class="display-4 text-white mb-4 animated slideInRight">로그인</h1>
                <nav aria-label="breadcrumb">
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- 페이지 상단 끝 -->
<div class="container-login">
    <img src="${path}/resources/image/common/logo_main.png" alt="로고">
    <form action="${path }/user/loginPro.do" id="login_frm" class="frm" method="post">
        <div class="form-controller">
            <input type="text" class="input" name="id" id="id" required />
            <label><span>아이디</span></label>
        </div>
        <div class="form-controller">
            <input type="password" class="input" name="pw" id="pw" required />
            <label><span>비밀번호</span></label>
        </div>
        <button type="submit" class="login-btn">로그인</button>
        <p class="text">회원이 아니신가요? <a href="${path }/user/term.do">회원가입</a></p>
    </form>
</div>

<script>
    $(document).ready(function(){
        $(".container-login").click(function(){
            $(".form-controller label span").css("transform", "translateY(-50px)");
            $(".form-controller input").css({"visibility": "visible", "transition-delay": "0.3s", "transition-duration": "1s"});
        })

    })
</script>`
<script src="${path }/resources/js/jquery-3.7.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="${path }/resources/js/common.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<jsp:include page="../layout/footer.jsp" />
</html>