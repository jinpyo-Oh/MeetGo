<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            color:#323232;
        }
        .main {
            background-color: #FFFFFF;
            width: 600px;
            height: 700px;
            margin: 7em auto;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .id {
            width: 76%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px 20px;
            border: none;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
            margin-left: 65px;
            border-radius: 5px;
            height: 50px;
        }
        .pass {
            width: 76%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px 20px;
            border: none;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
            margin-left: 65px;
            border-radius: 5px;
            height: 50px;

        }
        .qw {
            font-size: 15px;
            margin-left: 46px;
            font-weight: bolder;
        }
        .loginbar {
            background-color: #00C7AE;
            color: white;
            border: none;
            height: 60px;
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            border-radius: 5px;
        }
        .loginbarform {
            text-align: center;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .link {
            text-decoration: none;
            color: #333;
            margin-right: 10px;
        }
        .kakao, .naver, .google {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .kakaosrc, .naversrc, .googlesrc {
        width: 400px;
        height: 50px;
        display: block;
        margin:  auto; 
    	}
        .kakaoss {
           width: 20px;
            
        }
        .naverr {
            width: 20px;
        }
        .googlee {
            width: 20px;
        }
        .links1 {
            width: 500px;
            padding: 50px;
        }
        .kakaologin-btn{
        	background-color:yellow;
        	boder-style:none;
        	padding: 10px 30px;
        	color: white;
        	text-align: center;
        }
        
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

<h1 class="login">로그인</h1>
<div class="main">
    <form class="form1" action="login.me" method="post">
        <p class="qw">아이디</p>
        <input class="id" type="text" align="center" placeholder="아이디를 입력해주세요." name="userId" value="${ cookie.saveId.value }"required>
        <p class="qw">비밀번호</p>
        <input class="pass" type="password" align="center" placeholder="비밀번호를 입력해주세요."name="userPwd" required>
        <div class="loginbarform">
            <button class="loginbar">로그인</button>
        </div>
    </form>
    <div class="links">
        <a class="link" href="findPassword.me">비밀번호 찾기</a>
        <a class="link" href="enrollForm.me">회원가입</a>
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
        
    </div>
  
    <ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>

</div>
<script>
	window.Kakao.init('d10703cccb5343e34a8ed27fbcf9688f'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    window.Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  </script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
</body>
</html>
