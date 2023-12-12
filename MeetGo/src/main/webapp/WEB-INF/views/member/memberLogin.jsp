<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <!-- Default theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <!-- Semantic UI theme -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .login {
            text-align: center;
            margin-top: 40px;
            font-size: 40px;
            color: #323232;
        }

        .main {
            background-color: #FFFFFF;
            width: 500px;
            height: 550px;
            margin: auto;
            padding: 20px;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form1 {
            text-align: center;
        }

        .id, .pass {
            align-items: center;
            width: 80%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px 20px;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.1);
            margin: auto;
            border-radius: 5px;
            height: 50px;
        }

        .loginLabel {
            font-size: 15px;
            font-weight: bolder;
            margin-left: 10%;
            margin-top: 20px;
        }


        .login-btn {
            width: 100%;
            height: 50px;
            background-color: #2A8FF7;
            color: white;
            border: none;
            margin: 20px auto 0 auto;
            border-radius: 5px;
        }
        .login-btn:hover {
            background-color: #0076ef;

        }

        .loginbarform {
            width: 80%;
            margin: 20px auto;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .link {
            text-decoration: none;
            color: #333;
            margin-left: 15px;
            margin-right: 15px;
        }


        .kakaologin-btn {
            display: inline-block;
            width: 80%;
            height: 50px;
            margin: auto;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-image: url(<%=request.getContextPath()%>/resources/images/common/kakao_login.png);
            border-radius: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<h1 class="login">로그인</h1><br><br><br>
<div class="main">

    <form class="form1" action="login.me" method="post">
        <p class="loginLabel" align="left">아이디</p>
        <input class="id" type="text" align="center" placeholder="아이디를 입력해주세요." name="userId"
               value="${ cookie.saveId.value }" required>
        <p class="loginLabel" align="left">비밀번호</p>
        <input class="pass" type="password" align="center" placeholder="비밀번호를 입력해주세요." name="userPwd" required>
        <div class="loginbarform">
            <button class="login-btn">로그인</button>
        </div>
    </form>
    <div class="links">
        <c:choose>
            <c:when test="${ not empty cookie.saveId }">
                <input type="checkbox" id="saveId" name="saveId" value="y" checked>
                <label for="saveId">아이디 저장</label>
            </c:when>
            <c:otherwise>
                <input type="checkbox" id="saveId" name="saveId" value="y">
                <label for="saveId">아이디 저장</label>
            </c:otherwise>
        </c:choose>
        <a class="link" href="findPassword.me">비밀번호 찾기</a>
        <a class="link" href="enrollForm.me">회원가입</a>

    </div>

    <a class="kakaologin-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=d43939779978e5373136817cf1d4cc5d&redirect_uri=http://localhost:9090/meetgo/kakao-login">
    </a>


</div>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
</body>
</html>
