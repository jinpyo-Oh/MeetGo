<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    
    <!-- alertify 라이브러리 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

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
     
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
	
	<!-- 별, 뒤로가기 아이콘 -->
	<script src="https://kit.fontawesome.com/bb1372cd06.js" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
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
        height: 82px;
		padding-top: 10px;
        position : fixed;
        display: flex;
        align-items: center;
        background-color: white;
        z-index: 50;
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
		cursor: pointer;
    }
    .logo>a {
        height: 100%;
    }
    .logo img {
        width: 120px;
        margin-right: 60px;
        margin-left: 20px;
		margin-top: 5px;
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
        width: 300px;
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
        width: 300px;
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
    .w-100 {
        width: 100%;
    }
    .w-50{
        width: 50%;
    }
	.menu-userInfo {
		width: 100px;
		height: 72px;
        margin-left: 25px;
        display: flex;
		align-items: center;
		cursor: pointer;
	}
    #user-profile {
		height: 60px;
		width: 60px;
		object-fit: cover;
		border-radius: 50%;
	}
	#user-collapse {
		height: 25px;
		width: 25px;
		margin-left: 5px;
	}
	#user-info-collapse{
        position: absolute;
        background-color: white;
        width: 240px;
		right: 1%;
        box-sizing: border-box;
        border: 1px solid lightgray;
		padding: 30px;
		border-radius: 10px;
		box-shadow: 1px 1px 1px 1px lightgray;
	}
    #user-info-collapse hr {
		margin: 10px;
	}
	.user-name {
		margin-bottom: 30px;
	}
	.meetgo-red {
		border: 1px solid red;
		color : red;
	}
	.meetgo-red:hover {
		background-color: red;
		border: 1px solid black;
		color: white;
	}
	.user-menu {
		color: #3a3a3a;
		font-size: 15px;
        margin-bottom: 30px;
	}
    .user-menu div {
		margin-top: 15px;
		padding-left: 10px;
		cursor: pointer;
	}
	.user-menu div:hover {
		background-color: whitesmoke;
		border-radius: 5px;
	}
	.user-button button {
		width: 100%;
		margin: 0;
		padding: 0;
		background-color: transparent;
		border: none;
		color: black;
		font-size: 15px;
		
	}
    .user-button img {
		width: 15px;
		height: 15px;
	}
    .user-button button:hover {
		background-color: whitesmoke;
	}
    #user-info-collapse ul {
		padding: 0;
	}
	.status-icon {
		margin-left: 20px;
		width: 50px;
		height: 50px;
	}
	
    .user-status-card {
        width: 80px;
        height: 60px;
        perspective: 1000px;
		cursor: pointer;
    }

    .card-inner {
        width: 100%;
        height: 100%;
        position: relative;
        transform-style: preserve-3d;
        transition: transform 0.450s;
    }

    .user-status-card:hover .card-inner {
        transform: rotateX(180deg);
    }

    .card-front,
    .card-back {
        position: absolute;
        width: 100%;
        height: 100%;
		padding-top: 2px;
        backface-visibility: hidden;
    }

    .card-front {
        background-color: transparent;
        color: black;
        display: flex;
        align-items: center;
        border: 1px solid transparent;
        border-radius: 10px;
        justify-content: center;
        font-size: 17px;
        transform: rotateY(0deg);
    }

    .card-back {
        background-color: transparent;
        color: black;
        display: flex;
        align-items: center;
        border: 1px solid transparent;
        border-radius: 10px;
        justify-content: center;
        font-size: 17px;
        transform: rotateX(180deg);
    }
</style>
<body>
<jsp:include page="tawk.jsp"/>
<jsp:include page="reportAlert.jsp"/>
    <header class="global-header">
        <div class="global-navigation-bar">
            <div class="left-section">
                <div class="logo" onclick="location.href='<%=request.getContextPath()%>'">
                    <a style="height: 100%;"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/meetgo_logo.png" alt=""></a>
                </div>
                <nav class="nav-list">
                    <li><a href="noticeList.bo">공지사항</a></li>
                    <li><a href="searchMain.go">고수찾기</a></li>
                    <li><a href="gosuList.bo">커뮤니티</a></li>
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
						<c:when test="${ empty sessionScope.loginUser }">
							<li>
							    <a href="loginForm.me">로그인</a>
							</li>
							<li>
							    <a href="enrollForm.me">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
		
							</li>
							<li><a href="estimate.me?cPage=1">견적 목록</a></li>
							<li><a href="chat.ct?type=all">채팅</a></li>
							<li>

								<div class="menu-userInfo" data-toggle="collapse" data-target="#user-info-collapse">
									<img id="user-profile" src="${sessionScope.loginUser.userProFile}">
									<img id="user-collapse" src="<%=request.getContextPath()%>/resources/images/chat/wing-icon.png">
								</div>
								<div id="user-info-collapse" class="collapse">
									<c:choose>
										<c:when test="${sessionScope.loginUser.userStatus eq 1}">
											<div class="user-name">
												<h5>${sessionScope.loginUser.userName} 고객님</h5>
											</div>
											<div class="user-menu">
												<ul>
													<li><div onclick="window.location.href='myPage.me'">내 정보 조회</div></li>
													<li><div onclick="window.location.href=''">견적 목록</div></li>
													<li><div onclick="window.location.href=''">내 리뷰 관리</div></li>
												</ul>
											</div>
											<hr>
											<div class="user-button">
												<button onclick="location.href='changeStatus.me'"><img src="<%=request.getContextPath()%>\resources\images\common\exchange-icon.png">&nbsp;&nbsp; 고수 전환</button>
											</div>
											<hr>
											<div class="user-button">
												<button onclick="location.href='logout.me'"><img style="width: 20px; height: 20px;" src="<%=request.getContextPath()%>\resources\images\common\logout-icon.png">&nbsp;&nbsp; 로그아웃</button>
											</div>
										</c:when>
										<c:when test="${sessionScope.loginUser.userStatus eq 2}">
											<div class="user-name">
												<h5>${sessionScope.loginUser.userName} 고수님</h5>
											</div>
											<div class="user-menu">
												<ul>
													<li><div onclick="window.location.href='myPage.me'">내 정보 조회</div></li>
													<li><div onclick="window.location.href='gosuPage.me'">고수 프로필 관리</div></li>
													<li><div onclick="window.location.href=''">견적 목록</div></li>
												</ul>
											</div>
											<hr>
											<div class="user-button">
												<button onclick="location.href='changeStatus.me'"><img src="<%=request.getContextPath()%>\resources\images\common\exchange-icon.png">&nbsp;&nbsp; 회원 전환</button>
											</div>
											<hr>
											<div class="user-button">
												<button onclick="location.href='logout.me'"><img style="width: 20px; height: 20px;" src="<%=request.getContextPath()%>\resources\images\common\logout-icon.png">&nbsp;&nbsp; 로그아웃</button>
											</div>
										</c:when>
									</c:choose>
								</div>
							</li>
							<li>
								<c:choose>
									<c:when test="${sessionScope.loginUser.userStatus eq 1}">
										<div class="user-status-card"  onclick="location.href='changeStatus.me'">
											<div class="card-inner">
												<div class="card-front">
													Customer
												</div>
												<div class="card-back" style="text-align: center">
													Gosu <br>전환
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="user-status-card"  onclick="location.href='changeStatus.me'">
											<div class="card-inner">
												<div class="card-front">
													Gosu
												</div>
												<div class="card-back" style="text-align: center">
													Customer <br> 전환
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</li>
						</c:otherwise>
					</c:choose>
                </nav>
				<br>
				
            </div>
			
			<script>
			
			</script>
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
        function reportAlert(targetUserNo){
            $.ajax({
				url : "selectReportedGosuInfo",
				data : {
                    gosuNo : targetUserNo
				},
				success : function (result){
                    console.log(result);
					$('#reported-user').text(result.userName);
                    $('#reported-userNo').val(result.userNo);
				},
				error : function (){
                    console.log("실패");
				}
			})
			$('#modalWrapReport').css("display", "flex");
		}
    </script>
    
</body>
</html>