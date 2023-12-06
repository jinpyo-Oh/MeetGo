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

    /* 요청버튼 */
    #btn-requestService{
        border: 0px;
        border-radius: 10px;
        width: 200px;
        height: 50px;
        margin-left: 30px;
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
    .gosuImgThumb:hover{ cursor : pointer; }
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
    #star-rate{
        font-size: 28px;
        margin-right: 20px;
        color: rgb(148, 219, 42);
    }
    .rate{ margin-bottom: 10px; }
    
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
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
            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="red" class="bi bi-heart" viewBox="0 0 16 16">
                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
              </svg>
            <button type="button" id="btn-requestService">견적요청</button>

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
                    <p>세부경력내용이들어갈자리	</p>
                    <br><br>
                    <p><b>최종학력</b></p>
                    <p>${ requestScope.list[0].gosu.education }</p>
                </div>

            <br><br><br>
            <!-- 사진 영역 -->
            <p><b>사진 및 상세설명</b></p>
            
            <div align="center"
	            style="display:flex; margin: auto;">
            <c:choose>
            	<c:when test="${ not empty requestScope.imageList }">
	            	<c:forEach var="p" begin="1"
						               end="${ requestScope.imageList.size() }"
						               step="1">
	            	<img class="gosuImgThumb" src="${ requestScope.imageList[p-1].gosuImgUrl }"
	            	width="200px" height="150px"
	            	style="margin-right:5px; margin-left:5px;" data-toggle="modal" data-target="#myModal" >
	            	</c:forEach> 
            	</c:when>
            	<c:otherwise>
            		<p style="color:lightgray; margin-top:20px;">등록된 이미지가 없습니다.</p>
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
            <div style="display: flex;">
                <div style="width: 50%;">
                    <p><b>총 리뷰 <span>123</span>건</b></p>
                    <span id="star-rate">4.5</span>

                    <!-- 별점 -->
                    <svg class="rate" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gold" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                    <svg class="rate" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gold" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                    <svg class="rate" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gold" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                    <svg class="rate" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gold" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                    </svg>
                    <svg class="rate" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="gold" class="bi bi-star-half" viewBox="0 0 16 16">
                        <path d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z"/>
                    </svg>
             
                    <br><br>               

                    <!-- 리뷰 영역 -->
                    <span style="font-size: 18px; font-weight: bolder; margin-right: 20px;">
                        정**</span>
                    <span style="font-size: 20px;">4.0</span>
                    <br>
                    <p style="width: 350px; font-size: 16px;">
                        내용내용내용내용내용내용내용내용내용내용내용
                        내용내용내용내용내용내용내용내용내용내용내용
                        내용내용내용내용내용내용내용내용내용내용내용
                    </p>

                    <span style="font-size: 18px; font-weight: bolder; margin-right: 20px;">
                        이**</span>
                    <span style="font-size: 20px;">5.0</span>
                    <br>
                    <p style="width: 350px; font-size: 16px;">
                        2줄로 제한 내용내용내용내용내용내용내용내용
                        내용내용내용내용내용내용내용내용내용내용내용
                    </p>

                    <span style="font-size: 18px; font-weight: bolder; margin-right: 20px;">
                        오**</span>
                    <span style="font-size: 20px;">4.5</span>
                    <br>
                    <p style="width: 350px; font-size: 16px;">
                        2줄로 제한 내용내용내용
                        내용내용내용내용내용내용내용내용내용내용내용
                        내용내용내용내용내용내용내용내용내용내용내용
                    </p>

                    <a href="">more...</a>
                </div>

                <div style="margin-left:40px; width:350px;">
                    <p><b>사진</b></p>
                    <img src="" width="150px" height="150px">
                    <img src="" width="150px" height="150px">
                    <img src="" width="150px" height="150px">
                    <img src="" width="150px" height="150px">
                    <img src="" width="150px" height="150px">
                    <img src="" width="150px" height="150px">
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

            <div style="display: flex; width: 600px;">
            <div align="center" style="margin-left: 5px; margin-right: 5px;">
                <img src="" width="220px" height="150px">
                <p>포트폴리오 게시글제목</p>
            </div>
            <div align="center" style="margin-left: 5px; margin-right: 5px;">
                <img src="" width="220px" height="150px">
                <p>포트폴리오 게시글제목</p>
            </div>
            <div align="center" style="margin-left: 5px; margin-right: 5px;">
                <img src="" width="220px" height="150px">
                <p>포트폴리오 게시글제목</p>
            </div>
            </div>
            
        </div>
        </div>


    <!-- 고수 상세메뉴 이벤트핸들링 -->
    <script>
        $(function(){

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
    </script>	

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>