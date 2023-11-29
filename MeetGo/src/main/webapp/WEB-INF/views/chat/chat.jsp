<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
			cursor: pointer;
			
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
        .chat-search-input b{
			height: 30%;
			font-size: 15px;
		}
        .chat-search-input input {
            margin: auto;
			width: 100%;
            height: 70%;
            border: none;
            border-top: 1px solid lightgray;
        }
        #type-search {
            position: absolute;
            background-color: white;
            width: 240px;
            box-sizing: border-box;
            border: 1px solid lightgray;
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
			cursor: pointer;
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
            background-color: #808080;
            border-radius: 10px;
            background-clip: padding-box;
            border: 2px solid transparent;
        }
        .chat-area::-webkit-scrollbar-track {
            background-color: #fdfdfd;
            border-radius: 10px;
            box-shadow: inset 0px 0px 5px white;
        }

        .right-box-info {
            width: 250px;
            height: 100%;
            padding-top: 20px;
            border-left: 1px solid lightgray;
			background-color: #f4f4f4;
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
			width: 60%;
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
        .info-service-list {
			margin: auto;
			text-align: center;
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
		.info-img-area, .info-pofol, .review-img-area {
            margin: auto;
            align-items: center;
            text-align: center;
            width: 100%;
			height: 100px;
			padding: 0 30px;
		}
		
		.info-img {
            width: 80px;
            height: 80px;
            object-fit:cover;
			margin: auto;
        }
        .slick-slide{
			width: 80px;
		}
        .slick-arrow {
            z-index: 10;
            width: 75px;
            height: 75px;
			top: 40px;
        }
		.slick-prev {
		}
        .slick-prev:before,
        .slick-next:before
        {
            color: black;
        }
		.display-none {
			display: none;
		}
		.disable-btn {
            pointer-events : none;
		}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="chat-content">
	<div class="left-box">
		<div class="left-box-input-search" >
			<div class="view-type" id="view-type" data-toggle="collapse" data-target="#type-collapse">
				<div style="width: 80%; text-align: center">
					<c:choose>
						<c:when test="${requestScope.type == 'noread'}">
							안 읽음
						</c:when>
						<c:when test="${requestScope.type == 'chating'}">
							협의중
						</c:when>
						<c:when test="${requestScope.type == 'complete'}">
							완료
						</c:when>
						<c:otherwise>
							전체
						</c:otherwise>
					</c:choose>
				</div>
				<img src="<%=request.getContextPath()%>/resources/images/chat/wing-icon.png" style="width: 50px; height: 50px">
			</div>
			<div class="chat-search-input display-none" id="search-type">
				<b>이름 또는 내용으로 검색</b>
				<input type="text" placeholder="검색어를 입력하세요.">
			</div>
			<div class="chat-search">
				<img src="<%=request.getContextPath()%>/resources/images/chat/search-icon.png">
				<img class="display-none" src="<%=request.getContextPath()%>/resources/images/chat/close-icon.png">
			</div>
		</div>
		<script>
            var chatSearch = document.querySelector('.chat-search');
            var viewType = document.getElementById('view-type');
            var searchType = document.getElementById('search-type');
            var searchIcon = chatSearch.querySelector('img[src$="search-icon.png"]');
            var closeIcon = chatSearch.querySelector('img[src$="close-icon.png"]');

            chatSearch.addEventListener('click', function() {
                searchIcon.classList.toggle('display-none');
                closeIcon.classList.toggle('display-none');
                viewType.classList.toggle('display-none');
                searchType.classList.toggle('display-none');
            });
		</script>
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
			<div class="chat-card select">
				<div class="chat-card-img">
					<img src="https://image-notepet.akamaized.net/seimage/20220808/c925af35fb1f498e067d15b185efb608.jpg">
				</div>
				<div class="chat-card-info">
					<p>정채연</p>
					<p></p>
				</div>
			</div>
			<div class="chat-card">
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
					<p class="sender">안녕하세요. 강아지 산책 문의 드립니다.</p>
					<p class="chat-createAt p-sender">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<img class="receiver" src="https://image-notepet.akamaized.net/seimage/20220808/c925af35fb1f498e067d15b185efb608.jpg">
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>

				<div class="chat-bubble">
					<p class="receiver">지역이 어디신가요.</p>
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<p class="sender">신길역 1번 출구 앞입니다. 아침 9시부터 12시 까지 해주셨으면 하는데 견적 부탁드립니다.</p>
					<p class="chat-createAt p-sender">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<img class="receiver" src="https://cdn.9oodnews.com/news/photo/202103/4534_6671_5932.jpg">
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<div class="chat-estimate receiver">
						<h5 class="est-title">견적서</h5>
						<p class="est-content">
							이상현 고객님 안녕하세요. 요청서에 따른 예상금액입니다.
						</p>
						<hr>
						<table>
							<tr>
								<td>서비스</td>
								<td>반려견 산책</td>
							</tr>
							<tr>
								<th>예상 금액</th>
								<td>총 30,000 원</td>
							</tr>
						</table>
						<hr>
						<div class="est-button">
							<p>취소된 견적서 입니다.</p>
						</div>
					</div>
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<p class="sender">25,000원 원합니다</p>
					<p class="chat-createAt p-sender">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<div class="chat-estimate receiver">
						<h5 class="est-title">견적서</h5>
						<p class="est-content">
							이상현 고객님 안녕하세요. 요청서에 따른 예상금액입니다.
						</p>
						<hr>
						<table>
							<tr>
								<td>서비스</td>
								<td>반려견 산책</td>
							</tr>
							<tr>
								<th>예상 금액</th>
								<td>총 30,000 원</td>
							</tr>
						</table>
						<hr>
						<div class="est-button">
							<button class="meetgo-btn disable-btn" style="width: 270px">견적서 취소</button>
						</div>
					</div>
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
				
				<div class="chat-bubble">
					<div class="chat-estimate receiver">
						<h5 class="est-title">견적서</h5>
						<p class="est-content">
							이상현 고객님 안녕하세요. 요청서에 따른 예상금액입니다.
						</p>
						<hr>
						<table>
							<tr>
								<td>서비스</td>
								<td>반려견 산책</td>
							</tr>
							<tr>
								<th>예상 금액</th>
								<td>총 25,000 원</td>
							</tr>
						</table>
						<hr>
						<div class="est-button">
							<p>확정된 견적서 입니다.</p>
							<button class="meetgo-btn disable-btn" style="width: 270px">견적 목록</button>
						</div>
					</div>
					<p class="chat-createAt p-receiver">1:45 PM</p>
				</div>
			</div>
<!--
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
								<td>서비스</td>
								<td>원룸/소형 이사</td>
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
-->
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
					<div class="info-profile-more-list">
						<div>회원 상세 조회</div>
						<div></div>
					</div>
					<h3>김세정</h3>
					<table>
						<tr>
							<td width="40%">지역</td>
							<td width="60%" >대전 중구</td>
						</tr>
						<tr>
							<td>믿고 횟수</td>
							<td>15 회</td>
						</tr>
						<tr>
							<td>서비스</td>
							<td>반려견 산책</td>
						</tr>
					</table>
					<hr style="border : 1px solid lightgray; width: 80%;">
				</div>
				<div class="info-detail">
					<h5 style="margin-left: 20px">리뷰 목록</h5>
					<div class="review-img-area">
						<div style="width: 100px!important;"><img class="info-img" src="https://news.nateimg.co.kr/orgImg/xs/2020/04/09/1586412414197720.jpg"></div>
						<div style="width: 100px!important;"><img class="info-img" src="https://post-phinf.pstatic.net/MjAyMTAyMjNfNDAg/MDAxNjE0MDY5MTYxNzE1.ID-uK_t73wGeNH9TGMIeWKJZsQq9KDg_nySZdlKTLBQg.eOm-EdEw-i_NbPvPA5qdAOeLpwlhqEu5PMVGu5DqXr8g.JPEG/4-2.jpg?type=w1200"></div>
						<div style="width: 100px!important;"><img class="info-img" src="https://post-phinf.pstatic.net/MjAyMTAyMjNfNzQg/MDAxNjE0MDY5MTk5NDk2.RuWcBaRHnRUgGHlf-PHJAfsE54JjUD3DheHMskaeGsUg.wETZ4LxUQwZ6n6UErBz_2QqIATZk6sDvtx5bdlew304g.JPEG/5-3.jpg?type=w1200"></div>
					</div>
					<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
					<script>
                        $('.review-img-area').slick({
                            slidesToShow: 2,
                            slidesToScroll: 2,
                        });
					</script>
					
				</div>
<%--				<div class="info-profile">--%>
<%--					<img class="info-profile-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPGYZhyErT9b-eoGkDeBwbFJCjEfq2EPLQew&usqp=CAU">--%>
<%--					<img class="info-profile-more" src="<%=request.getContextPath()%>/resources/images/common/info-more.png">--%>
<%--					<div class="info-profile-more-list">--%>
<%--						<div>고수 상세 조회</div>--%>
<%--						<div></div>--%>
<%--					</div>--%>
<%--					<h3>김세정</h3>--%>
<%--					<table>--%>
<%--						<tr>--%>
<%--							<td width="30%">지역</td>--%>
<%--							<td width="70%" >대전 중구</td>--%>
<%--						</tr>--%>
<%--						<tr>--%>
<%--							<td>리뷰</td>--%>
<%--							<td>☆ 4.8</td>--%>
<%--						</tr>--%>
<%--						<tr>--%>
<%--							<td>경력</td>--%>
<%--							<td>4년</td>--%>
<%--						</tr>--%>
<%--					</table>--%>
<%--					<hr style="border : 1px solid lightgray; width: 80%;">--%>
<%--				</div>--%>
<%--				<div class="info-detail">--%>
<%--					<div class="info-service">--%>
<%--						<h5 style="margin-left: 20px">제공 서비스</h5>--%>
<%--						<div class="info-service-list">--%>
<%--							<button class="meetgo-btn">보컬 트레이닝</button>--%>
<%--							<button class="meetgo-btn">웹 개발</button>--%>
<%--							<button class="meetgo-btn">앱 개발</button>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<h5 style="margin-left: 20px">소개 이미지</h5>--%>
<%--					<div class="info-img-area">--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvxZ4Eh7SoozBfSwpwOkXYxL1YHXeya0LXgA&usqp=CAU"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUfeazYf3-sn2ipj9DQcNF0L3wXPHm7wRa5g&usqp=CAU"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://img.mbn.co.kr/filewww/news/other/2023/09/06/030036230022.jpg"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRfEq5JpANKJ9qgmRHkyUKcSf22exYo2jsm-4NIJF8cIXFgtfagGHoquh-z0Xxe0Fr4A&usqp=CAU"></div>--%>
<%--						--%>
<%--					</div>--%>
<%--					<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>--%>
<%--					<script>--%>
<%--                        $('.info-img-area').slick({--%>
<%--                            slidesToShow: 2,--%>
<%--                            slidesToScroll: 2,--%>
<%--                        });--%>
<%--					</script>--%>
<%--					--%>
<%--					<h5 style="margin-left: 20px">포트폴리오</h5>--%>
<%--					<div class="info-pofol">--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvxZ4Eh7SoozBfSwpwOkXYxL1YHXeya0LXgA&usqp=CAU"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUfeazYf3-sn2ipj9DQcNF0L3wXPHm7wRa5g&usqp=CAU"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://img.mbn.co.kr/filewww/news/other/2023/09/06/030036230022.jpg"></div>--%>
<%--						<div style="width: 100px!important;"><img class="info-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRfEq5JpANKJ9qgmRHkyUKcSf22exYo2jsm-4NIJF8cIXFgtfagGHoquh-z0Xxe0Fr4A&usqp=CAU"></div>--%>
<%--					</div>--%>
<%--					<script>--%>
<%--                        $('.info-pofol').slick({--%>
<%--                            slidesToShow: 2,--%>
<%--                            slidesToScroll: 2,--%>
<%--                        });--%>
<%--					</script>--%>
<%--					--%>
<%--				</div>--%>
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
