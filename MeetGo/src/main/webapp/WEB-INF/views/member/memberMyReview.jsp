<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.review-info{
        width: 70%;
	}
	.review-img {
		width: 30%;
	}
	.review-img img {
		width: 100%;
		height: 100%;
        object-fit: cover;
	}
	.aa {
        width: 950px; height: 250px; background-color: lightgray; display: flex; margin: auto;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<br>
	
	<div class="outer" style="width: 80%; min-height: 800px; margin-top:100px; margin: auto;">
	
		<br>
		
		<div style="width: 70%; margin: auto;">
                <h4><b>내가 쓴 리뷰</b></h4>
        </div>
        
        <br>
	
		<div style="margin: auto;">

	        <div class="aa" >
				<div class="review-info" style="">
					<h2>&nbsp;&nbsp;포트폴리오 꿀팁</h2>
					<p>&nbsp;&nbsp;포트폴리오 작성시에는 신중하게 작성하는게 중요하다</p>
				&nbsp;&nbsp; &nbsp;&nbsp;<i class="bi bi-eye-fill"></i>&nbsp;&nbsp;
				</div>
				<div class="review-img" >
					<img src="<%=request.getContextPath()%>/resources/images/common/KakaoTalk_20231116_105754286.jpg"" id="titleImg" width="170" height="160" >    
				</div> 
			</div>

			
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>