<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .main {
            background-color: #FFFFFF;
            width: 600px;
            height: 300px;
            margin: 5em auto;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
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
            margin-bottom: 10px;
            margin-left: 65px;
            border-radius: 5px;
        }
        .text {
            color: grey;
            margin: 15px;
        }
        .email {
            background-color: #00C7AE;
            color: white;
            border: none;
            height: 50px;
            width: 100%;
            max-width: 500px;
            margin: 30px auto;
            border-radius: 5px;
        }
        .center-content {
            text-align: center;
        }
        .text2 {
            
            margin:20px
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">비밀번호 찾기</h1>
    <div class="main">
        <h3 class="text2">가입한 이메일 주소를 입력해주시요.</h3>
        <input type="text" placeholder="example@Meetgo" class="pass">
        <p class="text">가입하신 이메일 주소를 입력해주시면<br>
            새로운 비밀번호를 설정 가능한 링크를 보내드립니다.</p>
        <div class="center-content">
            <button class="email">이메일 전송하기</button>
        </div>
    </div>
</body>
</html>
    