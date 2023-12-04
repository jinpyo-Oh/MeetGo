<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정설정</title>
    <style>
        .main {
            width: 600px;
            height: 900px;
            margin: 0 auto;
            text-align: center;
            padding:20px;
        }
        .title {
            float: left;
            font-size: 30px;
            font-weight: 900;
        }
        .profile {
           

        }
        .profileimg{
            width: 100px;
            height: 100px;
            border-radius: 50px;
            margin-right:140px;
            margin-top: 100px;

        }
        .poto {
            width: 30px;
            height: 30px;
            position: absolute;
            margin-top: -30px;
        }
        .item-title{
            color: #7777;
            margin: 20px 0px ;
        
        }
        .item-title {
            paddiong : 4px 0px 0px;


        }
        .item-description {
                color:#7777;
                

        }
        .item{
            margin:50px;
            text-align: left;
            
        }
        .arrow{
            float: right;
            width: 20px;
        }
        

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="main">
        <div class="profile">
            <h1 class="title">계정 설정</h1>
            <img src="https://news.nateimg.co.kr/orgImg/ts/2023/08/09/15379917_1159014_4221_org.jpg" class="profileimg">
        </div>
            <img src="/MeetGo/src/main/webapp/resources/images/common/poto.png" class="poto">
        <div class="item">
            <div class="item-title">
                <p>이름</p>
            </div>
            <div class="item-info">
                <p>김찬영</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <div class="item-description">
                <p>이름은 상대방에게 노출되지 않습니다.</p>
                
            </div>
            <hr>
            <div class="item-title">
                <p>숨고 활동명</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <div class="item-info">
                <p>김찬영</p>
            </div>
            <hr>
            <div class="item-title">
                <p>이메일</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <div class="item-info">
                <p>tomy2213@naver.com</p>
            </div>
            <hr>
            <div class="item-title">
                <p>비밀번호</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <div class="item-info">
                <p>********</p>
            </div>
            
            <hr>
            
            <div class="item-title">
                <p>휴대폰 전화번호</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <div class="item-info">
                <p>01050308542</p>
            </div>

            <hr>

            
            <br><br><br>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow">
            <p>계정탈퇴</p>
            
            <hr>
            

            </div>
            
            
            

    </div>
	<jsp:include page="../common/footer.jsp"/>

    
</body>
</html>