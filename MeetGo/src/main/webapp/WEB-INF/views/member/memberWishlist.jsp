<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>찜한 고수</title>
    <style>
        body {
            background-color: #F4F4F4;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }
        .wishlist-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .wishlist-header {
            background-color: #3498DB;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-radius: 10px 10px 0 0;
        }
        .wishlist-item {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin: 20px;
            padding: 10px;
            cursor: pointer;
            transition: border 0.3s, box-shadow 0.3s;
            position: relative;
        }
        .wishlist-item:hover {
            border: 2px solid limegreen;
            box-shadow: 0 0 10px rgba(0, 128, 0, 0.3);
        }
        .wishlist-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .wishlist-info {
            flex: 1;
            padding: 0 10px;
        }
        .wishlist-btn {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: none;
            background-color: #3498DB;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
           text-align: center;
        }
        .wishlist-btn:hover {
            background-color: #2980B9;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="wishlist-container">
        <div class="wishlist-header">
            <h1>찜한 고수</h1>
        </div>
        <form action="myWishlist">
            <div class="wishlist-item" name="wishlist">
                <div class="wishlist-content">
                    <div class="wishlist-info">
                        <h3>${ sessionScope.loginUser.userName }고수님</h3>
                        <p>편의점 개잘합니다</p>
                        <p>경력 5년</p>
                    </div>
                    <img src="${ sessionScope.loginUser.userProFile }" alt="Profile" style="width: 80px; height: 80px; border-radius: 50%;">
                </div>
            </div>
            <a class="wishlist-btn" type="submit" href="searchMain.go">고수 찜 하러가기</a>
        </form>
    </div>
            <jsp:include page="../common/footer.jsp"/>
</body>
</html>