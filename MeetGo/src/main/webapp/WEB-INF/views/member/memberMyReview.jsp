<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bb1372cd06.js" crossorigin="anonymous"></script>
<style>
	.review-info{
        width: 70%;
	}

	.review-img {
		width: 30%;
	}

	.review-img img {
		width: 180px;
		height: 90%;
        object-fit: cover;
		float: right;
	}
	.aa {
        width: 950px; height: 200px; 
		display: flex; 
		margin: auto;
		margin-bottom: 30px;
		border-bottom: 1px solid lightgray;
	}

	.far{
		-webkit-font-smoothing: antialiased;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<br>
	
	<div class="outer" style="width: 80%; min-height: 800px; margin-top:100px; padding-bottom: 50px; margin: auto;">
	
		<br>
		
		<div style="width: 1100px; margin: auto;">
                <h3><b>내가 쓴 리뷰</b></h3>
        </div>
        
		<br>
        <br>
	
		<div style="margin: auto;">

	        <div class="aa" >
				<div class="review-info">
					<table>
						<tr>
							<td>계약번호 : &nbsp;</td>
							<td>a-1234</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								2023-11-20
							</td>
						</tr>
					</table>
					<br>
					<p>정말 <br> 좋았습니다. <br> 심부름이 <br> 아주 빠릅니다. <br> 자주 이용할게요<div class=""></div></p>
				</div>
				<div class="review-img" >
					<img src="<%=request.getContextPath()%>/resources/images/common/KakaoTalk_20231116_105754286.jpg"" id="titleImg">    
				</div> 
			</div>

			<div class="aa" >
				<div class="review-info">
					<table>
						<tr>
							<td>계약번호 : &nbsp;</td>
							<td>a-1234</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
							</td>
						</tr>
					</table>
					<br>
					<p>정말 <br> 좋았습니다. <br> 심부름이 <br> 아주 빠릅니다. <br> 자주 이용할게요<div class=""></div></p>
				</div>
				<div class="review-img" >
					<img src="<%=request.getContextPath()%>/resources/images/common/KakaoTalk_20231116_105754286.jpg"" id="titleImg">    
				</div> 
			</div> 	

			<div class="aa" >
				<div class="review-info">
					<table>
						<tr>
							<td>계약번호 : &nbsp;</td>
							<td>a-1234</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
							</td>
						</tr>
					</table>
					<br>
					<p>정말 <br> 좋았습니다. <br> 심부름이 <br> 아주 빠릅니다. <br> 자주 이용할게요<div class=""></div></p>
				</div>
				<div class="review-img" >
					<img src="<%=request.getContextPath()%>/resources/images/common/KakaoTalk_20231116_105754286.jpg"" id="titleImg">    
				</div> 
			</div>

			<div class="aa" >
				<div class="review-info">
					<table>
						<tr>
							<td>계약번호 : &nbsp;</td>
							<td>a-1234</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
							</td>
						</tr>
					</table>
					<br>
					<p>정말 <br> 좋았습니다. <br> 심부름이 <br> 아주 빠릅니다. <br> 자주 이용할게요<div class=""></div></p>
				</div>
				<div class="review-img" >
					<img src="<%=request.getContextPath()%>/resources/images/common/KakaoTalk_20231116_105754286.jpg"" id="titleImg">    
				</div> 
			</div>
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>