<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .passchang {

    width: 600px;
    height: 1200px;
    margin: 0px auto;
 }

 .password-container {
    position: relative;
 }

 .password {
    width: 76%;
    color: rgb(38, 50, 56);
    font-size: 14px;
    letter-spacing: 1px;
    background: white;
    padding: 5px 20px;
    border: 2px solid rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    height: 50px;
    margin: 10px auto; 
 }

 .password.red-border {
    border-color: red;
 }

 .password-label {
    position: absolute;
    pointer-events: none;
    left: 25px;
    top: 60px;
    transition: 0.2s ease all;
    font-size: 12px;
    color: #999;
 }

 .password:focus + .password-label,
 .password:not(:placeholder-shown) + .password-label {
    top: 30px;
    left: 12px;
    font-size: 10px;
    color: #2A8FF7;
 }
 
 .password-button {
    background-color: #2A8FF7;
    border:none;
    border-radius: 5px;
    padding:10px 100px;
 }
</style>



</head>
<body>
    <img src="https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjdfMjQz/MDAxNTcyMTU4OTA3MDY3.1lU-aEFZtkRFivV8Op92J2DEkDhdZMzblGh0wAOVMSog.CjCeUfMgDneN_9AYQmieS4MWIktiN8AbkLUAV_cf2r8g.GIF.msjin93/IMG_8430.GIF?type=w800">
    <div class="passchang">
        <div class="passwordtitle">
         <h1>패스워드 변경</h1>
        </div>
        <div class="password-container">
            <h3>새 패스워드</h3>
            <input class="password" type="password" placeholder=" " required>
            <label class="password-label">비밀번호를 입력해주세요</label>
        </div>
        <div class="password-container">
            <h3>새 패스워드 확인</h3>
            <input class="password" type="password" placeholder=" " required>
            <label class="password-label">비밀번호를 다시 한번 입력해주세요</label>
        </div>
        <div>
            <button class="password-button">변경하기</button>
        </div>
    </div>  

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
$(document).ready(function() {
    $('.password').blur(function() {
        if ($(this).val() === '') {
            $(this).addClass('red-border');
        } else {
            $(this).removeClass('red-border');
        }
    });
});
</script>
</body>
</html>
