<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포폴</title>
<style>
    .portfolio-main {
        border: 1px solid black;
        width: 600px;
        height: 1200px;
        margin:0px auto;
        
    }
    .protfolio-input{
        width: 76%;
        color: rgb(38, 50, 56);
        font-size: 14px;
        letter-spacing: 1px;
        background: white;
        padding: 5px 20px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        height: 30px;
        margin: 10px auto; 

         }
    .description {
        
        background-color: #f4f4f4;
        padding: 20px 20px;
        border-radius: 15px;
    }
    .media-body li{
        list-style: none;

    }
    .file-body {
        position: relative;
        margin-top: 50px;
        float: left;
    }

    .file-upload-container {
        border: 1px dashed #b5b5b5;
        border-radius: 9px;
        padding: 40px;
        text-align: center;
    }

    .plus-icon {
        font-size: 30px;
        color: #00c7ae;
    }

    input[type="file"] {
        display: none;
    }
</style>
</head>
<body>
    <div class="portfolio-main">
        <div class="protfolio-hader">
            <h1>포트폴리오 등록</h1>
        </div>
        <div class="protfolio-context">
            <h2>필수 정보*</h2>
        </div>
        <div class="protfolio-serverice">
            <h4>서비스종류</h4>
            편의점심부름
        </div>
        <div class="protfolio-title">
            <h4>포트폴리오 제목</h4>
            <input class="protfolio-input" placeholder="포트폴리오 제목을 입력해주세요" >
        </div>
        <div class="protfolio-img-title">
            <h4>대표이미지 등록</h4>
            <div class="description">
                이미지는 가로,세로600px 이상 1:1 비율로 권장합니다.
            </div>
        </div>
        <div class="protfolio-img">
            <div class="media-body">
                <ul>
                    <li>
                        <div class="file-body">
                            <label class="file-upload-container">
                                <span class="plus-icon">+</span>
                                <input type="file">
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        
            
        
    </div>
</body>
</html>