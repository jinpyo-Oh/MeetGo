<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Footer</title>
	<style>
		footer {
			width: 1200px;
			height: 200px;
			background-color: #2A8FF7;
			margin: auto;
			padding: 15px 30px;
			box-sizing: border-box;
		}
        .footer-logo{
            float: left;
		}
        .footer-logo img {
            filter: brightness(0) invert(1);
			width: 200px;
		}
		.footer-header {
            display: flex;
            justify-content: space-between;
		}
		.footer-nav-list {
            justify-content: center;
            align-items: center;
            display: flex;
            float: right;
			margin-right: 50px;
		}
		.footer-section a {
            color : #FFFFFF;
			font-size: 25px;
			margin-left: 50px;
		}
        .footer-content {
			margin-top: 10px;
			display: flex;
		}
        .footer-content-left {
			width: 55%;
		}
		.footer-content-left p {
			color: #fafafa;
			font-size: 14px;
			padding: 0;
			margin: 0;
		}
		.footer-icon{
            display: flex;
            justify-content: center;
            align-items: center;
		}
		.logo-size{
			width: 60px;
			height: 60px;
			margin: auto;
		}
	</style>
</head>
<body>
	<footer>
		<div class="">
			<section class="footer-section">
				<div class="footer-header">
					<div class="footer-logo">
						<a><img src="<%=request.getContextPath()%>/resources/images/common/meetgo_logo.png" alt=""></a>
					</div>
					<nav class="footer-nav-list">
						<li>
							<a>공지사항</a>
						</li>
						<li>
							<a>고수찾기</a>
						</li>
						<li>
							<a>커뮤니티</a>
						</li>
						<li>
							<a>고객센터</a>
						</li>
					</nav>
				</div>
				<div class="footer-content">
					<div class="footer-content-left">
						<p>
							MeetGo(주) 사업자번호 : 105-87-64746 통신판매업신고번호 : 제 2014-서울구로-1028호
						</p>
						<p>
							멤버 : 이상현,오진표,이경선,천정인,김찬영 호스팅서비스 사업자 : MeetGo(주)
						</p>
						<p>
							서울 영등포구 선유동2로 57 이레빌딩 | 고객센터 : 010-3548-9999
						</p>
						<p>
							Copyright © MeetGo Corp. All Rights Reserved.
						</p>
					</div>
					<div class="footer-icon">
						<a href="https://www.youtube.com/@user-jt1ep9tq9l">
							<img class="logo-size" src="<%=request.getContextPath()%>/resources/images/common/youtubeLogo.png" >
						</a>
						<a href="https://instagram.com/ming_my.seaweed?igshid=OGQ5ZDc2ODk2ZA%3D%3D&utm_source=qr">
							<img class="logo-size" src="<%=request.getContextPath()%>/resources/images/common/instagramLogo.png" >
						</a>
						<a href="">
							<img class="logo-size" src="<%=request.getContextPath()%>/resources/images/common/facebookLogo.png" >
						</a>
						<a href="https://blog.naver.com/programming_my00">
							<img class="logo-size" src="<%=request.getContextPath()%>/resources/images/common/blogLogo.png">
						</a>
					</div>
				</div>
			</section>
		</div>
	</footer>
</body>
</html>
