<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    html, body {
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
    li {
        list-style: none;
    }
    a {
        text-decoration: none;
        color: black;
    }
    .global-header button {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .global-header a, global-header a:hover {
        text-decoration: none;
    }
    .global-header li {
        list-style: none;
    }
    .global-header {
        width: 100%;
        height: 72px;   
    }
    .global-navigation-bar {
        width: 1200px;
        height: 72px;
        position : fixed;
        display: flex;
        align-items: center;
        background-color: white;
        z-index: 99;
        left: 50%;
        transform: translate(-50%, 0);
        top : 0;
    }
    .left-section {
        width: 330px;
        height: 70%;
        display: flex;
        align-items: center;    
        flex: 1;
    }
    .nav-list {
        display: flex;
        align-items: center;
        font-size: 18px;
    }
    .logo{
        align-items: center;    
        height: 100%;
    }
    .logo>a {
        height: 100%;
    }
    .logo img {
        width: 120px;
        margin-right: 60px;
        margin-left: 20px   ;
    }
    .nav-list li:nth-child(n+2) a {
        margin-left: 15px; 
    }
    .center-section{
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .search-bar {
        width: 350px;
        height: 40px;
        border-radius: 6px;
        background-color: #f4f4f4;
    }
    .search-bar img {
        max-width: 100%;
        margin: 8px;
        margin-top: 8px;
    }
    .input-group {
        width: 240px;
        height: 40px;
        padding: 0 12px;
        display: flex;
    }
    .input-group input {
        margin-left: 15px;
        border: none;
        background-color: transparent;
        outline: none;
    }
    .input-search-img {
        width: 24px;
        height: 100%;
    }
    .right-section{
        display: flex;
        align-items: center;
        float: right;
        margin-right: 30px;
    }
    .right-section button {
        width: 80px;
        height: 35px;
        margin-left: 15px;
        border-radius: 5px;
        border: none;
        background-color: #2A8FF7;
        color: white;
    }
    .right-section button:hover {
        background-color: #1673d1;
    }
</style>
<body>
    <header class="global-header">
        <div class="global-navigation-bar">
            <div class="left-section">
                <div class="logo">
                    <a style="height: 100%;"><img src="<%=request.getContextPath()%>/resources/images/common/meetgo_logo.png" alt=""></a>
                </div>
                <nav class="nav-list">
                    <li>
                        <a>공지사항</a>
                    </li>
                    <li>
                        <a>고수찾기</a>
                    </li>
                    <li>
                        <a>커뮤니티</a>
                    </li>
                </nav>
            </div>
            <div class="center-section">
                <div class="search-bar">
                    <form>
                        <div class="input-group">
                            <div class="input-search-img">
                                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
                            </div>
                            <input id="search-input" type="text" placeholder="어떤 서비스가 필요하세요?" class="" >
                        </div>
                    </form>
                </div>
            </div>
            <div class="right-section">
                <nav class="nav-list">
                    <c:choose>
                        <c:when test="">
                        
                        </c:when>
                        <c:otherwise>
                        
                        </c:otherwise>
                    </c:choose>
                    <li>
                        <a>로그인</a>
                    </li>
                    <li>
                        <a>회원가입</a>
                    </li>
                </nav>
            </div>
        </div>
    </header>

    <script>
        const inputField = document.querySelector("#search-input");
        const searchBar = document.querySelector(".search-bar");

        inputField.addEventListener("focus", function() {
            searchBar.style.backgroundColor = "white";
            searchBar.style.border = "1px solid #1673d1"; 
        });

        inputField.addEventListener("blur", function() {
            searchBar.style.backgroundColor = "#f4f4f4"; 
            searchBar.style.border = "none";
        });
    </script>
</body>
</html>