<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>믿고 안내</title>
	<style>
        img {
            object-fit: cover !important;
        }
        .guidemain {
            width: 1000px;
            height: 1800px;
            margin: 0px auto;

        }

        .guide-header {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .guide-img {
            float: right;
            margin-left: 20px; /* 사진과 텍스트 사이 간격 조절 */
            margin-top: -400px;
        }

        .gu-img {
            width: 450px;
            height: 300px;
            object-fit: cover;
        }

        .guide-body {
            margin: 200px 0;
        }
	
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="guidemain">
	<div class="guidemain-info">
		<div class="guide-heder">
			<h1 style="text-align: center; margin-top:100px;">고수를 위한 믿고 안내</h1>
		</div>
		<div class="guide-body">
			<h1>01</h1>
			<h2>고객의 요청을 싸게 보내드려요</h2>
			<p>*고객의 요청에 맞춰 견적금액과 견적설명을 적으세요</p>
			<p>*요청이 올바른지 검토한 후 고수님께 싸게 보내드려요</p>
		</div>
		<div class="guide-img">
			<img src="https://ifh.cc/g/JZyKyy.jpg" class="gu-img">
		</div>
		<div class="guide-body">
			<h1>02</h1>
			<h2>답변을 보낼 고객을 선택하세요.</h2>
			<p>*문자메시지를 통해 고객의 요청을 알려드려요.</p>
			<p>*고객에게 견적을 보낸 후 고용의 기회를 잡아보세요.</p>
		</div>
		<div class="guide-img">
			<img src="https://ifh.cc/g/JMrlDV.png" class="gu-img">
		</div>
		<div class="guide-body">
			<h1>03</h1>
			<h2>맞춤 견적을 보내세요.</h2>
			<p>*고객의 요청에 맞춰 견적금액과 견적설명을 적으세요.</p>
			<p>*고객은 채팅방에서 내 프로필과 견적을 볼 수 있습니다.</p>
		</div>
		<div class="guide-img">
			<img src="https://ifh.cc/g/YkTFpV.png" class="gu-img">
		</div>
		<div class="guide-body">
			<h1>04</h1>
			<h2>고객과 빠르게 연락하세요.</h2>
			<p>*채팅으로 안전하게 연락하세요.</p>
			<p>*고객과 상담하거나 거래가 성사되더라도 추가 비용이 들지 않습니다.</p>
		</div>
		<div class="guide-img">
			<img src="https://ifh.cc/g/DOTa2d.jpg" class="gu-img">
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>


</body>
</html>