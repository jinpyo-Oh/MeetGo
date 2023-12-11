<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#pagingBtn-area{margin-top: 80px;}
    .pagingBtn{
        border: 0;
        border-radius: 5px;
        width: 80px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .pageBtn{
        border: 0;
        border-radius: 5px;
        width: 40px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .none{
    	background-color: none;
    }
	
	#pagingArea {width:fit-content; margin:auto;}
	
	table>tr>td{
		size: absolute;
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

			<c:choose>
			<c:when test="${ not empty requestScope.list }">
			<c:forEach var="r" items="${ requestScope.list }">
	        <div class="aa" >
				<div class="review-info">
					<table>
						<tr>
							<td>계약서 번호 : &nbsp;</td>
							<td style="width: 50px;" class="rno">${ r.review.revNo }</td>
							<td style="width: 300px;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${ r.review.revDate }
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${ r.review.revPoint == 0 }">
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 1 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 2 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 3 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 4 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 5 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</table>
					<br>
					<p>${ r.review.revContent }<div class=""></div></p>
				</div>
				<div class="review-img" >
					<c:choose>
					<c:when test="${ not empty r.revImgUrl }">
						<img src="${ r.revImgUrl }" id="titleImg">    
					</c:when>
					<c:otherwise>
						<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/meetgo_logo.png"/>
					</c:otherwise>
					</c:choose>
				</div> 
			</div>

			</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="aa">
					<table align="center">
						<tr>
							<td>리뷰가 존재하지 않습니다.</td>
						</tr>
					</table>
				</div>
			</c:otherwise>
			</c:choose>
			
		</div>
			<c:if test="${ not empty requestScope.list }">
	            <div id="pagingArea">
                	<c:choose>
		        		<c:when test="${ requestScope.pi.currentPage eq 1 }">
		        			<button class="pagingBtn" disabled style="display:none;">prev</button>
		        		</c:when>
		        		<c:otherwise>
		        			<button class="pagingBtn" onclick="location.href='myReview.me?cPage=${ requestScope.pi.currentPage - 1 }'">prev</button>
		        		</c:otherwise>
		        	</c:choose>            
		             <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
		                    					end="${ requestScope.pi.endPage }"
		                    					step="1">
					<button class="pageBtn" onclick="location.href='myReview.me?cPage=${ p }'">${ p }</button>
		            </c:forEach>          
		            <!-- 마지막 페이지면 다음페이지로 이동 불가 -->
		            <c:choose>
			       		<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.endPage }">
			       			<button class="pagingBtn" disabled style="display:none;">next</button>
			       		</c:when>
			       		<c:otherwise>
			       			<button class="pagingBtn" onclick="location.href='myReview.me.me?cPage=${ requestScope.pi.currentPage + 1 }'">next</button>
			       		</c:otherwise>
		       		</c:choose> 
            	</div>
             </c:if>
	</div>
	<script>
		$(function(){
			
			$(".review-info").click(function(){
				
				let rno = $(this).find(".rno").text();
				
				console.log(rno);
				
				location.href = "reviewDetail.me?rno=" + rno; 
				
			});
			
		});
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>