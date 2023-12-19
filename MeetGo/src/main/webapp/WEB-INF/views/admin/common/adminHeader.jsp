<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>adminHeader</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/bb1372cd06.js" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
	
	 <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	
</head>
<style>
    html, body {
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
    }
    body,div,h1,li,ul{
        margin:0px;
        padding:0px;
    }
    a{
        text-decoration:none;
    }
    li{
        list-style-type:none;
    }
    .nav-list{
        overflow:hidden;
    }
    .nav-list>ul{
        padding-left:20px;
    }
    .nav-list>ul>li{
        float:left;
        padding:10px 15px 10px 15px;

    }
    .nav-list>ul>li>a{
        font-size:18px;
        color:#fff;
    }
    .submenu{
        position:absolute;
        background-color:white;
        margin-top: 10px;
        display:none;
        border: 1px solid black;
    }
	.nav-list a {
		text-decoration: none;
	}
    .navItem:hover>.submenu{
        display:block;
        color: white;
    }
	.nav-list  a:hover {
		color: black;
	}
    .submenu>li{
        padding:5px 10px 5px 10px;
    }
    .submenu>li:hover{
        background-color: #c0c0c0;
    }
    .submenu>li>a{
        color:black;
    }

    .admin-header {
        width: 100%;
        height: 100px;
        position : relative;
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
        width: 70%;
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
        width: 30%;
        height: 100px;
        margin-top: 10px!important;
        margin-right: 30px;
        box-sizing: border-box;
    }
    .admin-right-box-1{
        font-size: 17px;
        width: 100%;
        height: 50px!important;
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
    .admin-button {
        width: 170px;
        height: 35px;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 2.5px;
        font-weight: 900;
        color: #000;
        background-color: #fff;
        border: none;
        border-radius: 45px;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease 0s;
        margin-left: 10px;
        cursor: pointer;
        outline: none;
    }

    .admin-button:hover {
        background-color: black;
        box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
        color: #fff;
        transform: translateY(-7px);
    }
    .addmin-logo-area {

    }
    #admin-logo{
        width: 120px;
        -webkit-filter: brightness(0) invert(1);
        filter: brightness(0) invert(1);
        margin-left: 60px;
        margin-top: 10px;
    }
    .pageTitleArea {
        margin-top: 20px;
    }

    .pageTitleArea hr {
        width: 1000px;
        border: 1px solid black;
    }

    .pageTitle {
        font-size: 30px;
    }
    .meetgo-btn {
        background-color: white;
        font-family: 'Noto Sans KR', sans-serif;
        border: 2px solid #2A8FF7;
        color: #2A8FF7;
        margin: 5px;
        border-radius: 0.4em;
        box-sizing: border-box;
    }
    .meetgo-btn:hover {
        background-color: #2A8FF7;
        border : 2px solid black;
        box-sizing: border-box;
        color: white;
    }
    .meetgo-red {
        border: 1px solid red;
        color : red;
    }
    .meetgo-red:hover {
        background-color: red!important;
        border: 1px solid black;
        color: white!important;
    }
    .w-100 {
        width: 100%;
        box-sizing: border-box;
    }
    .w-80 {
        width: 80%;
    }
    .w-50{
        width: 50%;
    }

</style>
<body>
<header class="admin-header">
	<div class="header-nav">
		<div class="addmin-logo-area" style="cursor: pointer; position: relative" onclick="location.href='adminMainPage.ad	'">
			<img id="admin-logo" src="<%=request.getContextPath()%>/resources/images/common/mainPage/meetgo_logo.png">
			<p style="position: absolute; left: 190px; top: 20px; font-size: 20px">관리자</p>
		</div>
		<div class="nav-list">
			<ul>
				<li class="navItem">
					<a href="adminMainPage.ad">Home</a>
				</li>
				<li class="navItem">
					<a href="#">회원 관리 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
					<ul class="submenu">
						<li><a href="adminMemberList.ad">일반 회원 관리</a></li>
						<li><a href="adminGosuList.ad">고수 회원 관리</a></li>
					</ul>
				</li>
				<li class="navItem">
					<a href="#">공지사항 관리 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
					<ul class="submenu">
						<li><a href="adminNoticeList.ad">공지사항 관리</a></li>
						<li><a href="adminInsertNotice.ad">공지사항 등록</a></li>
					</ul>
				</li>
				<li class="navItem">
					<a href="#">게시판 관리 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
					<ul class="submenu">
						<li><a href="adminGosuRequestList.ad">고수 찾아요 관리</a></li>
						<li><a href="adminTipList.ad">팁 노하우 관리</a></li>
						<li><a href="showAdminPofolList.ad">포트폴리오 관리</a></li>
					</ul>
				</li>
				<li class="navItem">
					<a href="adminChatList.ad">채팅방 관리</a>
				</li>
				<li class="navItem">
					<a href="#">계약 관리 <i class="fa fa-angle-down" aria-hidden="true"></i></a>
					<ul class="submenu">
						<li><a href="adminEstimateList.ad?cPage=1">계약서 관리</a></li>
						<li><a href="adminReviewList.ad?cPage=1">리뷰 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="adminReportList.ad">신고 관리</a>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="admin-right-box">
		<div class="admin-right-box-1">
			<p>어드민 페이지(admin123) 접속 중</p>
		</div>
		<div class="admin-right-box-2">
			<button class="admin-button" onclick="location.href=<%=request.getContextPath()%>/">MeetGo 바로가기</button>
			<button class="admin-button">로그아웃</button>
		</div>
	</div>
</header>
<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<c:if test="${ not empty sessionScope.errorMsg }">
		<script>
			alertify.alert('Alert', '${ sessionScope.errorMsg }',function(){ alertify.error('Fail'); });
		</script>
		<c:remove var="errorMsg" scope="session" />
	</c:if>

<script>

</script>
</body>
</html>