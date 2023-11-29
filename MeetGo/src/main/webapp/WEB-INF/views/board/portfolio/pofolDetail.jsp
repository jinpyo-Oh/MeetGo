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
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&family=Gamja+Flower&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gaegu&display=swap" rel="stylesheet">

    <style>
        .outer{
        width: 1000px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }
       /* 폰트 */
       @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }

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

    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	
    <div class="outer">
        <div id="titleText">
            <p>글 제목</p>
            <hr>
                <div style="display: flex;">
                    <div id="profile-area">
                        <div style="width: 100%; height: 30%;">
                            <table>
                                <tr>
                                    <td>
                                        <img src="images.jpg" width="100px" height="100px">
                                    </td>
                                    <td>
                                        <p id="gosuName">gosuName</p>
                                        <p style="font-size: 16px;">서울시 영등포구<br>20km 이동가능</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="width: 100%; height: 50%;">
                            <p style="font-size: 16px; font-style: italic; margin: 0; color: rgb(135, 135, 135);">
                                "메이크업헤어 + 모델 시간당 포토샵 포함시<br>
                                10만원으로 진행 합니다.<br>
                                촬영 끝나고 5일 안에 보정본 보내드립니다<br>
                                포토샵 as가능합니다."
                            </p>
                            <br>
                            <p>가격 : 협의 후 결정</p>
                            <p>소요시간 : 5일 미만</p>
                        </div>

                        <!-- 견적 요청 버튼 -->
                        <div style="width: 100%; height: 15%;" align="center">
                            <button type="button">
                                견적 요청하기
                            </button>
                        </div>

                    </div>

                    <!-- 슬라이드 이미지-->
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><img src="17374f4f6a3247a7aa00fbfe115b606b.png"></div>
                            <div class="swiper-slide"><img src="스크린샷 2023-11-16 160735.png"></div>
                            <div class="swiper-slide"><img src="optimize.jpg"></div>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>   

                </div>
                
                <hr>
                <!-- 포폴내용 영역 -->
                <span>
                    안녕하세요. 프로듀스 101 출신의 아이돌을 트레이닝하고 있는 보컬 트레이너 민이쌤이라고 합니다. 그간 많은 수강생들을 가르치며 트레이닝업계에서 너무 많은 수강생분들이 피해를 입는 것 같아 이렇게 글을 남기게 되었습니다.
                    첫째, 감각을 말로 알려주려는 트레이너는 피하자.
                    첫째, 트레이너 본인이 노래를 잘하게 된 방법을 그대로 주입코자 하는 트레이너는 피하셔야 합니다. 하다보면 나온다식의 말씀을 하는 분들이 계신데 피하셔야 합니다. 감각의 영역이기 때문입니다.
                    사람마다 느끼는 방식이 다 다르기 때문에 이런트레이닝을 받는경우 나의 실력상승에 큰 효과가 미미할 가능성이 높습니다.
                    "이런 느낌으로 하면됩니다X, 자 이거 해보세요~ 어떤느낌이에요? 그쵸 바로 그느낌입니다!O" 체험시켜주는 트레이너를 만나야 합니다.
                    단 한번이라도, 아니 이게 왜 안되지 라는 말을 하는 트레이너는 피해야 합니다.
                    어떤 감각이던 느낄 수 있도록 설계된 수많은 훈련들이 있습니다. 공부를 하지 않은 트레이너는 이 훈련을 소개해줄 수 없고, 감각만을 설명해줄 수 있습니다.
                    "아 로 여기까지 올리세요! 더 힘! 뒤로돌리세요!!" No
                </span>

                <div align="center">
                    <button type="button" id="btn-goList">목록으로</button>
                </div>

            </div>
            
    </div>

    <script>
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