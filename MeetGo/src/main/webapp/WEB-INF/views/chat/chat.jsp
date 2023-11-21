<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>채팅</title>
	
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

	
	<style>
        html {
            text-align: center;
            justify-content: center;
        }
        .chat-content {
            width: 1200px;
            height: 800px;
            margin: 50px auto;
            display: flex;
            border: 1px solid lightgray;
        }
        .left-box {
            width: 300px;
            height: 100%;
            box-sizing: border-box;
        }
        .left-box-input-search {
            height: 10%;
            border-bottom: 1px solid lightgray;
            border-right: 1px solid lightgray;
            display: flex;
        }
        .view-type {
            width: 80%;
            height: 100%;
            font-size: 25px;
            display: flex;
            text-align: center;
            align-items : center;
        }
        .chat-search-input {
            width: 80%;
            display: inline-block;
            align-items: center;
        }
        .chat-search-input input {
            margin: auto;
            height: 50%;
            border: none;
        }
        #type-search {
            position: absolute;
            background-color: white;
            width: 240px;
            box-sizing: border-box;
            border: 1px solid #f4f4f4;
        }
        #type-search a{
            width: 230px;
            height: 50px;
            margin: 5px;
            font-size: 20px;
            text-align: center;
            display: block;
            line-height: 50px;
            border-radius: 10px;
        }
        .chat-search {
            display: flex;
            width: 20%;
            text-align: center;
            align-items : center;
            border-left: 1px solid #f4f4f4;
        }
        .chat-search img {
            margin: 10px auto;
            width: 30px;
        }
        #type-collapse {
            position: absolute;
            background-color: white;
            width: 240px;
            box-sizing: border-box;
            border: 1px solid #f4f4f4;
        }
        #type-collapse a{
            width: 230px;
            height: 50px;
            margin: 5px;
            font-size: 20px;
            text-align: center;
            display: block;
            line-height: 50px;
            border-radius: 10px;
        }

        .left-box-chatList {
            height: 90%;
            box-sizing: border-box;
            background-color: #e8e8e8;
        }
        .chat-card{
            width: 100%;
            height: 100px;
            border-bottom: 1px solid #f4f4f4;
            box-sizing: border-box;
            display: flex;
        }
        .chat-card-img {
            width: 80px;
            height: 100px;
        }
        .chat-card-info {
            padding: 10px;
        }
        .chat-card-info p {
            margin-bottom: 5px;
        }
        .chat-card-info p:last-child {
            color: gray;
        }
        .chat-card img {
            width: 60px;
            height: 60px;
            margin: 20px 10px;
            border-radius: 40px;
        }
        .right-box {
            width: 900px;
            height: 100%;
            box-sizing: border-box;
        }

        .chat-area {
            width: 650px;
            height: 100%;
            border-left: 1px solid #fdfdfd;
            border-right: 1px solid #fdfdfd;
            background-color: #fdfdfd;
            overflow:auto;
        }
        .chat-area::-webkit-scrollbar {
            width: 10px;
        }
        .chat-area::-webkit-scrollbar-thumb {
            background-color: #2f3542;
            border-radius: 10px;
            background-clip: padding-box;
            border: 2px solid transparent;
        }
        .chat-area::-webkit-scrollbar-track {
            background-color: grey;
            border-radius: 10px;
            box-shadow: inset 0px 0px 5px white;
        }

        .right-box-info {
            width: 250px;
            height: 100%;
            margin-top: 20px;
            border-left: 1px solid lightgray;
        }
        .chat-input-box {
            display: inline-block;
            width: 900px;
            border-top: 1px solid lightgray;
            box-sizing: border-box;
            height: 15%;
        }
        #chat-textarea{
            width: 100%;
            height: 65px;
            border: none;
            resize: none;
            padding: 10px;
            border-bottom: 1px solid lightgray;

        }
        .chat-input-box button{
            width: 150px;
            height: 40px;
            margin-top: 5px;
            margin-right: 10px;
            border-radius: 0.8em;
            color: #2A8FF7;
        }
        .select {
            background-color: white;
            border-right: none;
        }
        .input-icon {
            float: left;
            margin-left: 30px;
        }
        .input-icon img {
            width: 25px;
            height: 25px;
            float: left;
        }

        .chat-bubble {
            width: 100%;
            display: inline-block;
            align-items: flex-end;
            color: black;
            position: relative;
        }

        .chat-bubble p {
            display: inline-block;
            border : none;
            border-radius: .4em;
            max-width: 500px;
            padding: 5px 10px;
            margin: 20px;
        }
        .chat-bubble img {
            max-width: 300px;
            max-height: 300px;
            margin: 20px;
            border-radius: .4em;
            border : none;
        }
        .chat-estimate {
            width: 300px;
            padding: 10px 10px;
            margin: 20px 5px 20px 20px;
            border-radius: .4em;
            text-align: left;
            box-sizing: border-box;
            border: 1px solid #f4f4f4;
            background-color: white;
        }
        .chat-estimate hr{
            background-color: lightgray;
            border: 0;
            height: 1px;
        }
        .est-content {
            margin: 0 !important;
            color: black;
        }
        .chat-estimate table {
            width: 100%;
            margin: auto;
        }
        .chat-estimate table tr > td:last-child {
            float: right;
        }
        .sender {
            background-color: #f5f5f5;
            float: left;
        }
        .receiver {
            background-color: #f5f5f5;
            float: right;
        }

        .input-button {
            float: right;
            margin-right: 30px;
        }
        .info-profile {
            text-align: center;
            align-items: center;
        }
        .info-profile-img{
            width: 120px;
            height: 120px;
            border-radius: 60px;
        }
        .info-profile table {
            width: 80%;
            margin: auto;
        }
        .info-profile-more {
            width: 30px;
            height: 30px;
            position: absolute;
            margin-left: 25px;
        }
        .info-profile-more:hover {
            background-color: lightgray;
            border-radius: 15px;
        }
        .est-button {
            width: 100%;
            padding: 0;
            margin: 0;
        }
        .chat-createAt {
            position: absolute;
            bottom: 0;
            padding: 0 !important;
            margin:40px 0 0 0 !important;
            font-size: 0.9em;
        }
        .p-receiver {
            right: 30px;
        }
        .p-sender {
            left: 30px;
        }
		.info-img-area {
            margin: auto;
			text-align: center;
            width: 100%;
			height: 100px;
		}
        .info-img-area div {
			width: 80px;
			height: 80px;
		}
		.info-img {
            width: 100%;
            height: 100%;
            object-fit:cover;
        }
        .slick-arrow {
            z-index: 10;
            width: 50px;
            height: 50px;
        }
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="chat-content">
	<div class="left-box">
		<div class="left-box-input-search">
			<%--				<div class="view-type" data-toggle="collapse" data-target="#type-collapse">--%>
			<%--					<div style="width: 80%; text-align: center">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${requestScope.type == 'noread'}">--%>
			<%--								안 읽음--%>
			<%--							</c:when>--%>
			<%--							<c:when test="${requestScope.type == 'chating'}">--%>
			<%--								협의중--%>
			<%--							</c:when>--%>
			<%--							<c:when test="${requestScope.type == 'complete'}">--%>
			<%--								완료--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								전체--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</div>--%>
			<%--					<img src="<%=request.getContextPath()%>/resources/images/chat/wing-icon.png" style="width: 50px; height: 50px">--%>
			<%--				</div>--%>
			<div class="chat-search-input" >
				<div data-toggle="collapse" data-target="#type-search">
					<c:choose>
						<c:when test="${requestScope.search == 'name'}">
							이름으로 검색
						</c:when>
						<c:otherwise>
							내용으로 검색
						</c:otherwise>
					</c:choose>
				</div>
				<div id="type-search" class="collapse">
					<a>이름으로 검색</a>
					<a>내용으로 검색</a>
				</div>
				<input type="text" placeholder="검색어를 입력하세요.">
			</div>
			<div class="chat-search">
				<img src="<%=request.getContextPath()%>/resources/images/chat/search-icon.png">
			</div>
		</div>
		
		<div id="type-collapse" class="collapse">
			<a>전체</a>
			<a>안 읽음</a>
			<a>협의 중</a>
			<a>완료</a>
		</div>
		<script>
            var links = document.querySelectorAll('#type-collapse a');
            links.forEach(function(link) {
                link.addEventListener('mouseover', function() {
                    this.style.backgroundColor = 'lightgray';
                });
                link.addEventListener('mouseout', function() {
                    this.style.backgroundColor = '';
                });
            });
		</script>
		
		
		<div class="left-box-chatList">
			<div class="chat-card">
				<div class="chat-card-img">
					<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU">
				</div>
				<div class="chat-card-info">
					<p>해원</p>
					<p>현재 작업이 불가능합니다. 죄송합니다.</p>
				</div>
			</div>
			<div class="chat-card">
				<div class="chat-card-img">
					<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU">
				</div>
				<div class="chat-card-info">
					<p>해원</p>
					<p>현재 작업이 불가능합니다. 죄송합니다.</p>
				</div>
			</div>
			<div class="chat-card">
				<div class="chat-card-img">
					<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU">
				</div>
				<div class="chat-card-info">
					<p>해원</p>
					<p>현재 작업이 불가능합니다. 죄송합니다.</p>
				</div>
			</div>
			<div class="chat-card select">
				<div class="chat-card-img">
					<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPGYZhyErT9b-eoGkDeBwbFJCjEfq2EPLQew&usqp=CAU">
				</div>
				<div class="chat-card-info">
					<p>김세정</p>
					<p>현재 작업이 불가능합니다. 죄송합니다.</p>
				</div>
			</div>
			<div class="chat-card">
				<div class="chat-card-img">
					<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUAZ1bNfqiTna5ztoL_d_0auPA2ffL79VEw&usqp=CAU">
				</div>
				<div class="chat-card-info">
					<p>해원</p>
					<p>현재 작업이 불가능합니다. 죄송합니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="right-box">
		<div style="display: flex; height: 85%">
			<div class="chat-area" id="chatArea">
				<div class="chat-bubble">
					<p class="sender">내 이야기들 속에 가장 밝게 빛났던 순간<br>
						나의 하루는 매일 빠르게 지나가 버렸고<br>
						그 어떤 것도 내겐 두려울 게 없었던 시간<br>
						어느 순간 놓쳐버린 그때의 나<br>
						어두운 밤 하늘로 숨은 너를 찾아<br>
						구름 사이 보랏빛 길을 걷다 보면<br>
						어둠 마지막에야 너와 마주할 수 있을까<br>
						어느 순간 놓쳐버린 그때의 나
					</p>
					<p class="chat-createAt p-sender">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<p class="receiver">현재 작업이 불가능합니다. 죄송합니다.</p>
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<img class="receiver" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQELo03zaT2oC9ZCjFo-WSJu15L8oxBwMzydpM4f8IeJXSO-tqKlp9QJf67olGlruaJSSo&usqp=CAU">
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				<div class="chat-bubble">
					<img class="receiver" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPq_ZQrNax6GHEkbvI6dPvk9cuEBRcycE4HlVQFWGt303nWIZUiCtufEZchSKsPEV49so&usqp=CAU">
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				<div class="chat-bubble">
					<div class="chat-estimate sender">
						<h5 class="est-title">견적서</h5>
						<p class="est-content">
							이상현 고객님 안녕하세요. 요청서에 따른 예상금액입니다.
						</p>
						<hr>
						<table>
							<tr>
								<td width="40%">서비스</td>
								<td width="60%">원룸/소형 이사</td>
							</tr>
							<tr>
								<th>예상 금액</th>
								<td>총 350,000 원</td>
							</tr>
						</table>
						<hr>
						<div class="est-button">
							<button class="meetgo-btn" style="width: 270px">고수 프로필 보기</button>
							<div style="display: flex">
								<button class="meetgo-btn w-50">견적서 확정</button>
								<button class="meetgo-btn w-50">견적서 거절</button>
							</div>
						</div>
					</div>
					<p class="chat-createAt p-sender">1:45 PM</p>
				</div>
			</div>
			<script>
                function scrollToBottom() {
                    var chatArea = document.getElementById('chatArea');
                    chatArea.scrollTop = chatArea.scrollHeight;
                }
                $(function (){
                    scrollToBottom();
				})
			</script>
			<div class="right-box-info">
				<div class="info-profile">
					<img class="info-profile-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPGYZhyErT9b-eoGkDeBwbFJCjEfq2EPLQew&usqp=CAU">
					<img class="info-profile-more" src="<%=request.getContextPath()%>/resources/images/common/info-more.png">
					<h3>김세정</h3>
					<p>보컬 트레이닝</p>
					<table>
						<tr>
							<td width="30%">지역</td>
							<td width="70%" >대전 중구</td>
						</tr>
						<tr>
							<td>리뷰</td>
							<td>☆ 4.8</td>
						</tr>
						<tr>
							<td>경력</td>
							<td>4년</td>
						</tr>
					</table>
					<hr style="border : 1px solid lightgray; width: 80%;">
				</div>
				<div class="info-detail">
					<h5>소개 이미지</h5>
					<div class="info-img-area">
						<div><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvxZ4Eh7SoozBfSwpwOkXYxL1YHXeya0LXgA&usqp=CAU"></div>
						<div><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUfeazYf3-sn2ipj9DQcNF0L3wXPHm7wRa5g&usqp=CAU"></div>
						<div><img class="info-img" src="https://img.mbn.co.kr/filewww/news/other/2023/09/06/030036230022.jpg"></div>
						<div><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRfEq5JpANKJ9qgmRHkyUKcSf22exYo2jsm-4NIJF8cIXFgtfagGHoquh-z0Xxe0Fr4A&usqp=CAU"></div>
					</div>
					<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
					<script>
                        $('.info-img-area').slick({
                            slidesToShow: 2,
                            slidesToScroll: 2,

                        });
					</script>

					<div class="info-pofol">
					
					</div>
				</div>
			</div>
		</div>
		<div>
			<div class="chat-input-box">
				<label for="chat-textarea"></label>
				<textarea id="chat-textarea" maxlength="180" placeholder="메세지를 입력해 주세요."></textarea>
				<div>
					<div class="input-icon" >
						<button class="meetgo-btn"><img src="<%=request.getContextPath()%>/resources/images/chat/img-icon.png" alt="">사진 첨부</button>
						<button class="meetgo-btn"><img src="<%=request.getContextPath()%>/resources/images/chat/report-icon.png" alt="">신고</button>
					</div>
					<div class="input-button">
						<button class="meetgo-btn">전송</button>
						<button class="meetgo-btn">채팅방 나가기</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	

</div>



</body>
</html>
