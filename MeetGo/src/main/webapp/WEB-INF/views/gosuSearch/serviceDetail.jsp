<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고수 정보</title>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!--  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" /> -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<link href="<%=request.getContextPath()%>/resources/css/slick/slick.css" rel="stylesheet" type="text/css">
	
	
	<style>
        /* 폰트 */
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        .outer { font-family: 'Pretendard-Regular'; }

        @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

        /* 전체 div 영역 */
        .outer{
            width: 1000px;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
            box-sizing: border-box;
        }

        /* 상단 타이틀 영역 */
        #detailHead-area{
            width: 70%;
            height: 250px;
            margin: auto;
            display: flex;
        }
        #image-area{ width: 35%; height: 100%;}
        #image-area>img{ width:100%; height:100%; }
        #info-area{ width: 65%; height: 100%; margin-left: 35px;}
        #gosu-name{
            font-size: 24px;
            font-weight: 700;
            color: #2A8FF7;
        }
        .regionInfo{ font-size: 20px;}
        .divBar{ margin: 70px; }
        #description{
            width: 100%;
            height: 55%;
            margin-top: 30px;
        }
        /* 소분류 표시 영역 */
        .etc-area{
            width: 70%;
            margin: auto;
            margin-bottom:20px;
        }
        .subCategory{
            border: 0px;
            border-radius: 5px;
            width: 120px;
            color: white;
            background-color: #257acec7;
            margin-left: 5px;
            margin-right: 5px;
        }

		.bi {
			font-size:40px;
			color : red;
			vertical-align: middle;
		}
		.bi:hover{ cursor:pointer; color:#257acec7; }
		
        /* 요청버튼 */
        #btn-requestService{
            border: 0px;
            border-radius: 10px;
            width: 200px;
            height: 50px;
            margin-left: 20px;
            background-color: gray;
            color: white;
            font-size: 22px;
            letter-spacing: 2px;
        }
        #btn-requestService:hover{ background-color: #2A8FF7; }

        /* 고수 상세정보 영역 */
        .detail-info{
            width: 70%;
            margin: auto;
        }
        .tableMenu{
            width: 150px;
            text-align: center;
            font-size: 26px;
            padding-bottom: 5px;
        }
        .tableMenu:hover{ cursor: pointer; color: #2f6faf; }

        /* 고수 정보 */
        #firstTb{
            font-size: 18px;
            box-sizing:border-box;
            width: 100%;
        }
        #secondTb{
            font-size: 20px;
            margin:auto;
            margin-top: 30px;
            width : 1000px;
            box-sizing:border-box;
        }
        #thirdTb{
            font-size: 22px;
            margin:auto;
            margin-top: 20px;
            width : 700px;
            box-sizing:border-box;
        }

        #myModal { margin:auto; }
        
        .modal-dialog{
            min-width:800px;
        }
        
        .modal-content{
            margin:auto;
            width:800px;
            height:800px;
            background-color:transparent;
            border:0px;
        }
        .gosuImgThumb:hover{ cursor : zoom-in; }
        .fullImage {
            margin:auto;
            box-sizing:border-box;
            width :800px;
            height:800px;
        }
        .fullImage div{
            width :800px;
            height:800px;
        }
        .info-img {
            width:800px;
            height:800px;
            object-fit : cover;
        }

        .slick-dots li button:before { color : white; opacity:1; font-size : 20px;}
        .slick-prev:before, .slick-next:before{
            color : black;
            font-size:50px;
        }
        .slick-prev { left: -55px; }
        
        .reviewImg { margin-right:20px;}
        .reviewImg:hover{ cursor:zoom-in; }
        .showMoreTag:hover{ cursor:pointer; color:#2A8FF7; }
        
        #star-rate{
            font-size: 28px;
            margin-right: 20px;
            color: #2A8FF7;
        }
        .rate{ margin-bottom: 10px; }
        .star {
		    color: gold;
		    font-size:28px;
		    display:inline;
		    margin-right:20px;
	    }
	    .revListStar{
	    	color: gold;
		    font-size:24px;
		    display:inline;
		    margin-left:20px;
	    }
    
        .pofolThumbnail:hover {
        	cursor:pointer;
        	transform: scale(1.05);
        }
        #backToListBtn{ margin-top : 100px; }
        #backToListBtn button{
	        border: 0px;
	        border-radius: 5px;
	        font-size:20px;
	        background-color: #2a91f7c0;
	        color: white;
	        width: 150px;
	        height: 50px;
        }
        #backToListBtn button:hover{ background-color: #2A8FF7; }
        
        /* 리뷰사진 */
        #enlargeImg-background{
	        position: fixed; 
	        z-index: 99;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	        background-color: rgba(0, 0, 0, 0.4);
	        display:none;
        }
        #enlargeImg-form{
        	width: 50%;
        	height: 90%;
        	background-color: white;
        	box-sizing: border-box;
        	margin: 2% auto 0 auto;
        	overflow: auto;
        }
        
        /* 리뷰 */
        #enlarge-background{
	        position: fixed; 
	        z-index: 99;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	        background-color: rgba(0, 0, 0, 0.4);
	        display:none;
        }
		
        #enlarge-form{
        	width: 40%;
        	height: 90%;
        	background-color: white;
        	box-sizing: border-box;
        	margin: 2% auto 0 auto;
        	overflow: auto;
        }
        
        .report{
        	width: 50px;
        	height: 50px;
        	margin-left:20px;
        	margin-bottom: 15px;
        	float:right;
			cursor: pointer;
        }
	
	</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
<script>
    let $userNo = ${sessionScope.loginUser.userNo};
    let $gosuNo = ${requestScope.list[0].gosu.gosuNo};
</script>
<div class="outer">
	<div id="detailHead-area">
		<div id="image-area">
			<img src="${ requestScope.list[0].userProfile }">
		</div>
		<div id="info-area">
			<p id="gosu-name">
				${ requestScope.list[0].userNickname }
			</p>
			
			<span class="regionInfo">${ requestScope.list[0].gosu.region }</span>
			
			<span class="regionInfo divBar">|</span>
			
			<span class="regionInfo">${ requestScope.list[0].gosu.moveDistance }</span>
			
			<div id="description">
				<span>${ requestScope.list[0].gosu.introduction }</span>
			</div>
		</div>
	
	</div>
	
	<br>
	
	<div class="etc-area" align="left">
		<c:choose>
			<c:when test="${ not empty requestScope.list[0].categorySmallName }">
				<c:forEach var="p" begin="1"
						   end="5"
						   step="1">
					<c:if test="${not empty requestScope.list[p-1].categorySmallName}">
						<button class="subCategory" disabled>${requestScope.list[p-1].categorySmallName}</button>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	
	</div>
	<div class="etc-area" align="right">
		<!-- 로그인한 유저만 좋아요, 견적요청 이용 가능 -->
		<c:if test="${ not empty sessionScope.loginUser }">
			
			<div style="display:inline-block; text-align:center;">
				<i onclick="enrollGosuLike()" id="gosuLikeIco" class="bi bi-heart-fill"></i>
				<img class="report" onclick="reportAlert('${requestScope.list[0].gosu.gosuNo}')" src="<%=request.getContextPath()%>/resources/images/common/report-icon.png">
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.loginUser }">
			<button type="button" id="btn-requestService" onclick="location.href='insertChatRoom?gno=${requestScope.list[0].gosu.gosuNo}'">견적요청</button>
		</c:if>
			
		<br><br>
		<hr>
	</div>
	
	<div class="detail-info">
		<table id="tableMenu">
			<tr>
				<td class="tableMenu" style="border-bottom: 3px solid #2A8FF7;">고수 정보</td>
				<td class="tableMenu">리뷰</td>
				<td class="tableMenu">포트폴리오</td>
			</tr>
		</table>
		
		<br><br>
		
		<!-- 고수정보 -->
		<div id="firstTb">
			<div>
				<p><b>서비스 정보</b></p>
				<p><span>"</span>${ requestScope.list[0].gosu.elaborate }<span>"</span></p>
			</div>
			<br><br><br>
			<div>
				<p><b>기본 정보</b></p>
				<p>연락 가능 시간 : <span>09:00 ~ 18:00</span></p>
				<p>직원 수 : <b>${ requestScope.list[0].gosu.employees }</b> 명</p>

				<p>개인사업자</p>
			</div>
			<br><br>
			<div>
				<p><b>경력 사항</b></p>
				<p>총 경력 : <b style="color: #2A8FF7;">${ requestScope.list[0].gosu.career }</b></p>
				<br>
				<br><br>
				<p><b>최종학력</b></p>
				<p>${ requestScope.list[0].gosu.education }</p>
			</div>
			
			<br><br><br>
			<!-- 사진 영역 -->
			<p><b>사진 및 상세설명</b></p>
			
			<div align="center"
				 style="display:flex; flex-wrap: wrap; margin: auto;">
				<c:choose>
					<c:when test="${ not empty requestScope.imageList }">
						<c:forEach var="p" begin="1"
								   end="${ requestScope.imageList.size() }"
								   step="1">
							<img class="gosuImgThumb" src="${ requestScope.imageList[p-1].gosuImgUrl }"
								 width="320px" height="250px" 
								 style="object-fit: cover; margin-right:10px; margin-left:10px; margin-bottom: 20px" data-toggle="modal" data-target="#myModal" >
						</c:forEach>
					</c:when>
					<c:otherwise>
					<div style="display:block; width:700px;" align="center">
						<p style="color:lightgray; margin-top:20px;" >등록된 이미지가 없습니다.</p>
					</div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 사진 크게보기 -->
			<div class="modal" id="myModal">
				<div class="modal-dialog" >
				<div class="modal-content">
				<div class="fullImage" >
					<c:forEach var="p" begin="1"
							   end="${ requestScope.imageList.size() }"
							   step="1">
						<div>
							<img class="info-img" src="${ requestScope.imageList[p-1].gosuImgUrl }">
						</div>
					</c:forEach>
				</div>
				</div>
				</div>
			</div>
			
		</div>
		
		<!-- slick 연동 -->
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script type="text/javascript">
            $(document).ready(function(){

                $('.fullImage').slick({
                    dots: true,
                    infinite: true,
                    speed: 0,
                    fade: true,
                    cssEase: 'linear',
                    slidesToShow: 1
                });
            });
		</script>
	
	</div>
	
	
	<!-- 리뷰 -->
	<div id="secondTb" style="display: none; width:700px;">
	
			<p style="font-size:22px;"><b>사진</b></p>
			<div align="center" style="width:700px; margin-bottom:120px;">
			
			<c:choose>
				<c:when test="${ not empty requestScope.reviewImgList }">
					<c:forEach var="p" begin="1" end="4" step="1" >
						<img class="reviewImg" src="${requestScope.reviewImgList[p-1].reviewImgUrl }"
						onclick="openEnlargeImg();" width="150px" height="150px">	
					</c:forEach>
					<div align="left">
					<br>
					<span class="showMoreTag" onclick="openEnlargeImg();">&raquo; more...</span>
					</div>
				</c:when>
				<c:otherwise>
					<p align="center" style="color:lightgray; margin-top:50px;">등록된 리뷰 이미지가 없습니다.</p>
				</c:otherwise>
			</c:choose>
			</div>
	
		<div>
			<p style="font-size:22px;"><b>리뷰&nbsp;<span>${requestScope.list[0].reviewCount}</span>건</b></p>
			<span id="star-rate">${requestScope.list[0].avgRevPoint}</span>
	
			<script> // 별점 함수
				function star(avg) {	
					// 소수점 첫째자리 정수로 할당
					let halfPoint = parseInt((avg % 1 * 10).toFixed(0));
					
					for(let i = 0; i < 5; i++) {
						
						if(i < Math.floor(avg)) { // 정수 자리수만큼 별 채우기
							$(".star").children().eq(i).addClass("bi-star-fill").removeClass("bi-star");
						}
						if(halfPoint != 0 && halfPoint > 4) { // 1~4일 경우 내림, 5이상 반개
							$(".star").children().eq(Math.floor(avg)).addClass("bi-star-half").removeClass("bi-star");
						} 
						
					}
				}
					
				function revStar(point, index){
					for(let i = 0; i < 5; i++) {
						if(i < Math.floor(point)) { // 정수 자리수만큼 별 채우기
							$('#revStar' + index).children().eq(i).addClass("bi-star-fill").removeClass("bi-star");
						}
					}
				}
			</script>
			
			<!-- 별점 -->
             <div class="star">
	  	         <i class="bi-0 bi-star"></i>
		         <i class="bi-1 bi-star"></i>
		         <i class="bi-2 bi-star"></i>
		         <i class="bi-3 bi-star"></i>
				 <i class="bi-4 bi-star"></i>
			 </div>

			<br><br>
				
			<!-- 리뷰 영역 -->
			<c:choose>
				<c:when test="${ not empty requestScope.reviewList}">
					<c:forEach var="p" begin="1" end="${requestScope.reviewList.size()}" step="1">
						<span style="font-size: 18px; font-weight: bolder; margin-right: 20px;">
                       	${requestScope.reviewList[p-1].userNickname}
                       	(${requestScope.reviewList[p-1].userName.charAt(0)}**)</span>
						<span style="font-size: 20px;">${requestScope.reviewList[p-1].reviewPoint}.0</span>
						<br>
						<p style="width: 700px; font-size: 16px;">
							${requestScope.reviewList[p-1].reviewContent}
						</p>
					</c:forEach>
				</c:when>
			</c:choose>
							
			<span onclick="openEnlargeRev();" class="showMoreTag">&raquo; more...</span>

		</div>
	</div>
	
	<!-- 리뷰이미지 확대 커스텀창 -->
	<div id="enlargeImg-background">
		<div id="enlargeImg-form">
			<div class="enlargeImg-area" align="center">
				<c:forEach var="item" items="${requestScope.reviewImgList}">
					<img src="${item.reviewImgUrl}" style="margin:20px; width:430px; height:430px;">
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 리뷰리스트 커스텀창 -->
	<div id="enlarge-background">
		<div id="enlarge-form">
			<div class="enlarge-area">
				<c:forEach var="item" items="${requestScope.reviewList}">
					<div align="left" style="width:95%; margin:auto;">
					<br>
						<span style="font-size: 18px; font-weight: bolder;">
	                       	${item.userNickname}
	                       	(${item.userName.charAt(0)}**)</span>
							<span style="font-size: 20px;">${item.reviewPoint}.0</span>
							<span id="revStar${item.reviewNo}" class="revListStar">
					  	         <i class="bi-0 bi-star"></i>
						         <i class="bi-1 bi-star"></i>
						         <i class="bi-2 bi-star"></i>
						         <i class="bi-3 bi-star"></i>
								 <i class="bi-4 bi-star"></i>
							</span>
							<span>(${item.reviewDate })</span>
							<br>
							<p style="width: 700px; font-size: 16px;">
								${item.reviewContent}
							</p>
					<br>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 포트폴리오 -->
	<div id="thirdTb" style="display: none; margin:auto;">
		<p>
			<svg class="rate" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#2A8FF7" class="bi bi-file-earmark-ppt-fill" viewBox="0 0 16 16">
				<path d="M8.188 10H7V6.5h1.188a1.75 1.75 0 1 1 0 3.5"/>
				<path d="M4 0h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2m5.5 1.5v2a1 1 0 0 0 1 1h2zM7 5.5a1 1 0 0 0-1 1V13a.5.5 0 0 0 1 0v-2h1.188a2.75 2.75 0 0 0 0-5.5z"/>
			</svg>
			<b>포트폴리오</b>
		</p>
		
		<br>
		
		<div style="display: flex; flex-wrap: wrap; width:800px;">
		
		<c:forEach var="item" items="${ requestScope.pofolList }">
			<div align="center" style="margin-left: 5px; margin-right: 5px;">
				<img class="pofolThumbnail" src="${ item.firstImg }" onclick="linkPofol(${ item.pofol.pofolNo });" style="width: 220px; height: 150px; object-fit: cover;">
				<p>${ item.pofol.pofolTitle }</p>
			</div>
		</c:forEach>			
		</div>
	
	</div>
	
	<div align="center" id="backToListBtn">
		<button type="button" onclick="history.back();">목록으로</button>
	</div>
</div>

<!-- 고수 상세메뉴 이벤트핸들링 -->
<script>
	
	
    $(function(){
    	isLiked();
    	star(${requestScope.list[0].avgRevPoint});
    	
        let $first = $("#tableMenu").find(".tableMenu").eq(0);
        let $second = $("#tableMenu").find(".tableMenu").eq(1);
        let $third = $("#tableMenu").find(".tableMenu").eq(2);
        
        $first.click(function(){
            $(this).css("border-bottom", "3px solid #2A8FF7");
            $second.css("border-bottom", "none");
            $third.css("border-bottom", "none");

            $("#firstTb").show();
            $("#secondTb").hide();
            $("#thirdTb").hide();
        });

        $second.click(function(){
            $(this).css("border-bottom", "3px solid #2A8FF7");
            $first.css("border-bottom", "none");
            $third.css("border-bottom", "none");

            $("#firstTb").hide();
            $("#secondTb").show();
            $("#thirdTb").hide();
        });

        $third.click(function(){
            $(this).css("border-bottom", "3px solid #2A8FF7");
            $first.css("border-bottom", "none");
            $second.css("border-bottom", "none");

            $("#firstTb").hide();
            $("#secondTb").hide();
            $("#thirdTb").show();

        });

    });   
    
    function isLiked(){

        if (${requestScope.isLiked eq 1}){
            $("#gosuLikeIco").removeClass("bi-heart").addClass("bi-heart-fill");
        } else {
            $("#gosuLikeIco").removeClass("bi-heart-fill").addClass("bi-heart");
        }
    }
    
    function enrollGosuLike(){
	
    	$.ajax({
    		type : "get",
    		url : "enrollGosuLike.go",
    		data : {userNumber : $userNo,
    			    gosuNumber : $gosuNo},
    		success : function(result){
    			alert(result);
    			location.reload()
    		},
    		error : function(){
    			alert("ajax통신 실패!");
    		}
    	});
    	
    }

	function linkPofol(pno) {
		location.href = "pofolDetail.po?pno=" + pno;
	}
	
	// 확대창 보이기
	function openEnlargeImg() {	
		$("#enlargeImg-background").css("display", "block");
	}
	
	function openEnlargeRev() {
		$("#enlarge-background").css("display", "block");
        <c:forEach var="p" begin="1" end="${requestScope.reviewList.size()}" step="1">
	        var reviewPoint = ${requestScope.reviewList[p-1].reviewPoint};
	        var index = ${requestScope.reviewList[p-1].reviewNo};
	        revStar(reviewPoint, index);
	    </c:forEach>
	}
	
	// 배경 누를 시 다시 숨기기
	let enImg = document.getElementById("enlargeImg-background");
    window.addEventListener('click', (e) => {
        e.target == enImg ? $('#enlargeImg-background').css("display", "none") : false;
    });
    
	let enRev = document.getElementById("enlarge-background");
    window.addEventListener('click', (e) => {
        e.target == enRev ? $('#enlarge-background').css("display", "none") : false;
    });
    
</script>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>