<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 - 상세보기</title>

<!-- swiper 연동 -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />


    <style>
        img {
            object-fit: cover !important;
        }
       /* 폰트 */
       @font-face {
	        font-family: 'Pretendard-Regular';
	        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	        font-weight: 400;
	        font-style: normal;
    	}
    	
        .outer {
	        width: 1000px;
	        margin: auto;
	        margin-top: 100px;
	        margin-bottom: 100px;
	        box-sizing: border-box;
	        font-family: 'Pretendard-Regular';
	        font-size: 20px;
    	}

        #titleText{width: 80%; margin: auto;}
        #titleText>p{font-size: 26px; margin-left: 20px;}

        /* 프로필 사진, 이름 */
        #profile-area{
            width: 40%;
            height: 420px;
            box-sizing: border-box;
        }
        #profile-area table p{font-size: 18px; margin-left: 10px;}	
        #profile-area button{
        border: 0px;
        border-radius: 5px;
        font-size: 20px;
        width: 200px;
        height: 40px;
        background-color: gray;
        color: white;
        letter-spacing: 2px; 
        margin-top: 20px;
        margin-right: 25px;
        }
        #profile-area button:hover{
            background-color: #2A8FF7;
            cursor: pointer;
        }

       /* 포트폴리오 이미지 스와이퍼 */
       .swiper {
       margin: 0;
       margin-left:10px;
       width: 470px;
       height: 420px;
       position: relative;
       }
       .swiper-slide>img {
           width : 100%;
           height : 100%;
       }
       /* 화살표 버튼색 변경 (기본색은 파란색) */
       div[class^=swiper-button] {
           color : rgb(244, 244, 244);
       }

       /* 위 선택안된 bullet 아래 선택된 bullet*/
       .swiper-pagination-bullet {
        background-color: white;
        opacity: 2;
       }
       .swiper-pagination-bullet-active{
        background-color: #2A8FF7;
       }

       #btn-goList{
	        margin-top: 150px;
	        border: 0px;
	        border-radius: 5px;
	        background-color: #2A8FF7;
	        color: white;
	        width: 120px;
	        height: 40px;
       }
       #btn-updateForm{
       	    margin-top: 150px;
	        border: 0px;
	        border-radius: 5px;
	        background-color: rgb(19, 160, 118);
	        color: white;
	        width: 120px;
	        height: 40px;
       }
       #btn-deleteForm{
	      	margin-top: 150px;
	        border: 0px;
	        border-radius: 5px;
	        background-color: rgb(131, 16, 16);
	        color: white;
	        width: 120px;
	        height: 40px;
       }
       .btn-control{ margin-left:10px; margin-right:10px; }
	   .btn-control:hover{ opacity: 0.5; }
    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
	<jsp:include page="../../common/side.jsp"/>
	
    <div class="outer">
        <div id="titleText">
            <p>${ requestScope.list[0].pofol.pofolTitle }</p>
            <hr>
                <div style="display: flex;">
                    <div id="profile-area">
                        <div style="width: 100%; height: 30%;">
                            <table class="pofolInfoTable"> 
                                <tr>
                                    <td>
                                        <img src="${ requestScope.list[0].userProFile }" width="100px" height="100px">
                                    </td>
                                    <td>
                                        <p style="font-size: 20px; color : #2A8FF7; font-weight:700;">${ requestScope.list[0].userNickname }</p>
                                        <p style="font-size: 16px;">${ requestScope.list[0].gosu.region }<br>${ requestScope.list[0].gosu.moveDistance }</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="width: 100%; height: 50%;">
                            <p style="font-size: 20px; font-style: italic; margin: 0; color: rgb(135, 135, 135);">
                               "${ requestScope.list[0].pofol.pofolIntro }"
                            </p>
                            <br>
                            <p>가격 : ${ requestScope.list[0].pofol.pofolPrice }</p>
                        </div>

                        <!-- 견적 요청 버튼 -->
                        <div style="width: 100%; height: 15%;" align="center">
                        <!-- 로그인하거나, 자기 게시글이 아닐 경우 요청 가능 -->
                        <c:if test="${ not empty sessionScope.loginUser and sessionScope.loginUser.userNo ne requestScope.list[0].gosu.gosuNo  }">
							<button type="button" onclick="location.href='insertChatRoom?gno=${requestScope.list[0].gosu.gosuNo}'">견적 요청하기</button>
						</c:if>
                        </div>

                    </div>

                    <!-- 슬라이드 이미지-->
                    <div class="swiper">
                        <div class="swiper-wrapper">
                        <c:forEach var="item" items="${ requestScope.imgList }" >
                        	<div class="swiper-slide"><img src="${item.pofolImgUrl}"></div>
                        </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>   

                </div>
                
                <hr>
                <!-- 포폴내용 영역 -->
                <span>
                    ${ requestScope.list[0].pofol.pofolContent }
                </span>

                <div align="center">
                	<c:if test="${ sessionScope.loginUser.userNo eq requestScope.list[0].gosu.gosuNo }">
                		<button type="button" class="btn-control" id="btn-deleteForm" onclick="deletePofol(${requestScope.list[0].pofol.pofolNo});">삭제하기</button>
                		<button type="button" class="btn-control" id="btn-updateForm" onclick="sendUpdatePofol(${requestScope.list[0].pofol.pofolNo});">수정하기</button>
                	</c:if>
                    <button type="button" class="btn-control" id="btn-goList" onclick="location.href='sendPofol.po'">목록으로</button>
                </div>
				
            </div>
            
    </div>

    <script>
	
    	function sendUpdatePofol(pno){
    		location.href = "sendUpdatePofol.po?pno=" + pno;
    	}
    	
    	function deletePofol(pno) {
    		location.href = "deletePofol.po?pno=" + pno;
    	}
    
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 5000 // 5초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>