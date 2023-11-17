<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>채팅</title>
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
		.chat-search {
            display: flex;
			width: 20%;
            text-align: center;
            align-items : center;
			border-left: 1px solid lightgray;
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
			border: 1px solid lightgray;
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
			background-color: #fafafa;
		}
		.chat-card{
			width: 100%;
			height: 100px;
			border-bottom: 1px solid lightgray;
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
			border-left: 1px solid lightgray;
			border-right: 1px solid lightgray;
			background-image: url("<%=request.getContextPath()%>/resources/images/chat/chat.png");
		}

		.right-box-info {
			width: 250px;
			height: 100%;
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
			border: 2px solid #2A8FF7;
			background-color: transparent;
			border-radius: 10px;
			color: #2A8FF7;
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
		.input-button {
			float: right;
			margin-right: 30px;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="chat-content">
		<div class="left-box">
			<div class="left-box-input-search">
				<div class="view-type" data-toggle="collapse" data-target="#type-collapse">
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
			</div>
		</div>
		<div class="right-box">
			<div style="display: flex; height: 85%">
				<div class="chat-area">
				</div>
				<div class="right-box-info">
					개발자 정보 영역
				</div>
			</div>
			<div>
				<div class="chat-input-box">
					<label for="chat-textarea"></label>
					<textarea id="chat-textarea" maxlength="180" placeholder="메세지를 입력해 주세요."></textarea>
					<div>
						<div class="input-icon">
							<button><img src="<%=request.getContextPath()%>/resources/images/chat/img-icon.png" alt="">사진 첨부</button>
							<button><img src="<%=request.getContextPath()%>/resources/images/chat/report-icon.png" alt="">신고</button>
						</div>
						<div class="input-button">
							<button>전송</button>
							<button>채팅방 나가기</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	</div>
	
</body>
</html>
