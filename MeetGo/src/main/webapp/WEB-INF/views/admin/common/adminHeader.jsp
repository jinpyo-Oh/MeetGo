<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>adminHeader</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    li {
        list-style: none;
    }
    a {
        text-decoration: none;
    }
    .admin-header {
        width: 100%;
        height: 100px;
        position : fixed;
        display: flex;
        align-items: center;
        background-color: #2A8FF7;
        z-index: 50;
        color: white;
        left: 50%;
        transform: translate(-50%, 0);
        top : 0;
    }
    .header-nav{
        width: 1500px;
        margin-top: 20px;
    }
    .nav-list {
        display: flex;
        align-items: center;
        font-size: 18px;
        margin-left: 50px;
        height: 50px;
    }
    .nav-list div {
        height: 100%;
        color: white;
        font-size: 22px;
        font-weight: 900;
        padding: 30px;
        cursor: pointer;
    }
    .nav-list div:hover {
        color: black;
    }
    .admin-right-box{
        text-align: right;
        width: 500px;
        margin-top: 10px;
        margin-right: 30px;
        padding: 10px;
    }
    .admin-right-box-1{
        font-size: 20px;
        width: 100%;
        height: 50%;
    }
    .admin-right-box-2{
        width: 100%;
        height: 50%;
    }
    .collapse {
        position: absolute;
        background-color: #2A8FF7;
        color: white;
        width: 100%;
        top: 100px;
        left: 0;
        z-index: 49;
    }
</style>
<body>
<header class="admin-header">
	<div class="header-nav">
		<div class="nav-list">
			<div onclick="location.href='adminMainPage.ad'">메인</div>
			<div data-toggle="collapse" data-target="#collapseExample" aria-expanded="false"
				 aria-controls="collapseExample">회원 관리
			</div>
			<div onclick="location.href=''">공지사항 관리</div>
			<div onclick="location.href=''">게시판 관리</div>
			<div onclick="location.href=''">신고 내역</div>
		</div>
	</div>
	
	<div class="admin-right-box">
		<div class="admin-right-box-1">
			어드민 페이지(admin123) 접속 중
		</div>
		<div class="admin-right-box-2">
			<button>메인페이지로</button>
			<button>로그아웃</button>
		</div>
	</div>
</header>
</body>
</html>