<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고수페이지</title>
        <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    

    <style>
        .gosu-page {
            width: 720px;
            height: 3050px;
            margin: 0px auto;
            box-sizing: border-box;
        }
        .profile {
            display: flex;
        }
        .profile-img {
            width: 300px;
            height: 300px;
        }
        .img {
            width: 300px;
            height: 300px;
            border-radius: 30px;
        }

        .overview {
            list-style: none;
            display: flex;
            justify-content: space-around; 
            align-items: center;
            width: 100%;
            margin-top: 0px;
        }
        .item {
            margin-bottom: 10px;
        }
        .point {
            font-size: 2.75rem;
            font-weight: 500;
            line-height: 1.5;
            letter-spacing: .0375rem;
            text-align: center;
            color: #323232;
            

        }
        .label {
            font-size: .875rem;
            line-height: 1.43;
            letter-spacing: -.0125rem;
            text-align: center;
            color: #b5b5b5;
            font-weight: 500;
        }
        .btn {
            margin:10px;
        
            
        }
        .btn1 {
            padding: 10px 60px;
            background-color: #00c7ae;
            color:white;

        }
        .btn2 {
            padding: 10px 60px;
            border:1px solid #00c7ae;
            color:#00c7ae;
        }
        .my-profile-name {
            font-size: .875rem;
            font-weight: 500;
            line-height: 1.43;
            gap: 1rem;
            justify-content: flex-end;
            align-items: center;
            padding: 1.5rem 0;
            border-bottom: 0.0625rem solid #f2f2f2;
        
            
    
        }
        .action-group-wapper {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            align-items: center;
            flex:1px;
        }

        .hading{
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            align-items: center;
            font-size: .875rem;
            font-weight: 500;
            line-height: 1.43;
            flex: 1;
            
        }
        .update {
            color:#00c7ae;

        }
        .type div {
            cursor: pointer;
            letter-spacing: -.0125rem
        }
        .service {
            background-color: #00c7ae;
            border-radius: 30px;
            padding: 10px 20px;
            color:#f2f2f2   ;
        }
        .container{
            background: #f2f2f2;
            border: 0;
            border-radius: 8px;
            padding: 1.25rem 1rem;
            
        }
        .media-body li{
            list-style: none;

        }
        .file-body {
            position: relative;
        }

        .file-upload-container {
            border: 1px dashed #b5b5b5;
            border-radius: 9px;
            padding: 30px;
            text-align: center;
        }

        .plus-icon {
            font-size: 30px;
            color: #00c7ae;
        }

        input[type="file"] {
            display: none;
        }
        .value-text {
            color:#b5b5b5;
            border: 1px solid #b5b5b5;
            padding: 30px 30px;
            border-radius: 9px;
            font-size: 18px;

        }
        .value-text-btn{
            background-color: #00c7ae;
            padding: 10px 30px;
            float: right;
            color:white;
            margin-top: -19px;
           
        }
        .Education-title {
            font-size: 15px;
            font-weight: 600;
        }
        .Education-context{
            font-size: 10px;
        }
        .Education-body{
            font-size: 10px;
            color:#b5b5b5;
        }
        .portfolio {
            border:1px solid #b5b5b5;
            padding : 20px 30px;
            border-radius: 10px;

        }
        .portfolio-title {
            margin-top: 5px;
            font-weight: 900;
        }
        .portfolio-context {
            color:#b5b5b5;
            font-size: 17px;
            font-weight: 300px;

        }
        .portfolio-btn {
            background-color: #00c7ae;
            padding:15px 50px;
            border-radius: 5px;
            color:white;
            float: right;
            margin-top: -65px;
        
        }
        .profile-img-body{
            width: 30px;
            height: 30px;
        }
        .file-body-context {
            border: 1px solid #b5b5b5;
            width: 200px;
            padding:15px 10px;
            border-radius: 10px;
            margin-left: 500px;
            margin-top: -70px;  
         
        }
        .file-body-context-btn {
            background-color: #00c7ae;
            text-align: center;
            padding:10px 30px;
            border-radius: 5px;
            margin-top: 40px;
        }
        .summarry{
            margin-top: 0.625rem;
            display: inline-block;
            
        }
        .summarry li{
            list-style: none;
        }
        .star li{ 
            display: table-cell;
            vertical-align: middle;
            width: auto;
            cursor: pointer;
            line-height: 0;

        }
        .star {
            margin-right: 0.25rem;
            width: 30px;
            height: 30px;

        }
        .avg {
            font-size: 2.5rem;
            font-weight: 500;
            line-height: 1.45;
            letter-spacing: -.05rem;
            color: #323232;
            float: left;
            margin-right: 0.9375rem;
        }
        .info-star {
            font-size: .875rem;
            line-height: 1.43;
            letter-spacing: -.0125rem;
            color: #737373;
            display: inline-block;
            position: relative;
            top: 0.8125rem; 
        }
        .count {
            font-size: .875rem;
            line-height: 1.43;
            letter-spacing: -.0125rem;
            color: #737373;
            margin-top: 0.25rem;
        }
        .modal{
            position:absolute;
            display:none;
            
            justify-content: center;
            top:0;
            left:0;

            width:100%;
            height:100%;

            

            background-color: rgba(0,0,0,0.4);
        }
        .main_service_modal{
            position:absolute;
            top:50%;  
        

            width:400px; 
            height:600px; 

            padding:40px;  

            text-align: center;

            background-color: rgb(255,255,255);
            border-radius:10px;
            box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);

            transform:translateY(-50%);
            
        }
        .main_service_modal_body{
            
            height: 95%;
        }
        .modal_title {
            border-bottom: 0.1rem solid darkgray;
            text-align: center;
            font-size: 20px;
        }
        .modal_btn {
            float: left;
        }
        .modal_btn_info {
            background-color: aquamarine;
            color:white;
            border-radius: 30px;
            border-style: none;
            padding:  10px 20px;
            }
        .modal-footer {
            
            border-top: 0.1rem solid darkgray;
        }
        .modal_footer_btn{
            background-color: aquamarine;
            padding: 10px 160px;
            margin-top: 9px;
            border-style: none;
            border-radius: 5px;
        }
        .modal_delect_btn{
            color: gray;
            border-style: none;
            background-color: white;
            margin-top: 20px;
            float: left;
        }
    

            
        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="gosu-page">
        <div class="profile">
            <div class="profile-img">
                
                <div class="my-profile-overview">
                    <div class="profile-img">
                        <img src="https://cdn.newsculture.press/news/photo/202207/509775_619054_128.jpg" class="img">
                    </div>
                
                </div>

            </div>
            <div class="info">
                <ul class="overview">
                    <li class="item">
                        <div class="point">0</div>
                        <div class="label">리뷰평점</div>
                    </li>
                    <li class="item">
                        <div class="point">0</div>
                        <div class="label">리뷰수</div>
                    </li>
                    <li class="item">
                        <div class="point">0</div>
                        <div class="label">고용수</div>
                    </li>
                </ul>
                <div class="btn">
                    <a class="btn1">활동분석</a>
                    <a class="btn2">미리보기</a>
                </div>

              
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>숨고 활동명</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    김찬영
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>대표서비스</h2>
                    <div class="action-group-wapper">
                        <div class="modal">
                            <div class="main_service_modal">
                                <div class="main_service_modal_body">
                                    <div class="modal_title">
                                        대표서비스
                                    </div>
                                    <h2>고수님의 대표 서비스를 선택해</h2>
                                        <div class="modal_btn">
                                                <button class="modal_btn_info">편의점 심부름</button>
                                                <div>
                                                    <button class="modal_delect_btn">대표서비스 삭제</button>
                                                </div>
                                            </div>
                                    </div>
                                <div class="modal-footer">
                                    <button class="modal_footer_btn">등록하기</button>
                                </div>
                            </div>
                        </div>
                        <div class="type">
                            <button class="update" onclick="openMainServiceModal()" style="border-style: none; background-color: white; cursor: pointer;">
                                수정
                            </button>

                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    편의점 심부름
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>제공서비스</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                   <a class="service">+서비스 추가</a>
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>한줄소개</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    편의점 ㅈㄴ 잘함
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>본인인증</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                인증
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
               
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>활동 지역</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    관악구 남부순환로
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>연락가능시간</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    오전1시~오후12시
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>자격증 및 기타 서류 등록</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                자격증 및 기타서류
                <div class="container">
                    <sapn><img src="">개인/민감 정보를 삭제 후 등록해야 하며, 허위정보에 대한 모든 책임은 본인에게 있습니다.</sapn>
                </div>    
                
                </div>
                <div class="media-body">
                    <ul>
                        <li>
                            <div class="file-body">
                                <label class="file-upload-container">
                                    <span class="plus-icon">+</span>
                                    <input type="file">
                                </label>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>고수 서비스 상세설명</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    경력 잦됌~
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>가격</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                 수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    오전1시~오후12시
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>경력</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                   <div class="value-text">
                        상세한 경력을 작성하고<br>
                        경쟁력 있는 프로필을 만들어보세요!! <a class="value-text-btn">경력 등록하기</a>
                   </DIV> 
                   
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>학력</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                 수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    <div class="Education-title">
                        
                        하버드대학교
                    </div>
                    <div class="Education-context">2026년 10월 ~ 2030년 10월</div>
                    <div class="Education-body">학종이접기학과</div>
                    
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>포트폴리오</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                 수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    
                    <div class="portfolio">
                        <h4 class="portfolio-title">고수님의 멋진 작업물을 보여주세욘!</h4>
                        <div class="portfolio-context">
                            작업사진과 과정을 포함한 포트폴리오를<br>
                            등록할 경우 고수님을 선택할 확률이 과연 높아갈까? 
                            <div><a class="portfolio-btn">포트폴리오 작성하기</a></div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>사진 및 동영상</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                 수정
                                 
                            </div>
                           

                        </div>
                    </div>
                </div>

            </div>
            <div class="info">
                <div class="value">
                    <div><img src="https://img2.quasarzone.com/editor/2023/08/05/aa0f36449037644f47d4a2d3f120dada.jpg" class="profile-img-body">평균 고수들이8개의 사진/동영상을고수들이 등록했어요!</div>
                    <div class="media-body">
                        <ul>
                            <li>
                                <div class="file-body">
                                    <label class="file-upload-container">
                                        <span class="plus-icon">+</span>
                                        <input type="file">
                                    </label>
                                </div>
                            </li>
                        </ul>
                        <div class="file-body-context">
                            <div class="file-body-context-title">
                                고수님을 나타내는 사진과 동영상을 등록하고 고수님을 표현해보세요(장비,업무환경 등)
                                <div class="file-body-context-btn">
                                    <a style="color: white;font-weight: 700;">사진/동영상 등록하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div> 
            </div>
            
        </div>
        <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>리뷰</h2>
                    <div class="action-group-wapper">
                        <div class="type">
                            <div class="update">
                                 수정
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="summarry">
                <div class="info-star">
                    <div class="value">
                        <div class="avg">
                            0
                            <ul class="star">
                                <li><img src=".com/pngimages/8/846/png-clipart-star-star-angle-triangle.png"></li>
                                <li><img src="https://e7..com/pnimages/508/846/png-clipart-star-star-angle-triangle.png"></li>
                                <li><img src="https://e7.pngeggcom/pngimages/508/846/png-clipart-star-star-angle-triangle.png"></li>
                                <li><img src="https://e7.pngeg.com/pngimages/508/846/png-clipart-star-star-angle-triangle.png"></li>
                                <li><img src="https://e7.pngeggcom/pngimages/508/846/png-clipart-star-star-angle-triangle.png"></li>

                            </ul>
                            <div class="count">
                                0개리뷰
                            </div>
                        </div>
                            
                
                    </div>
                </div>
            </div>
        </div>
   
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script>
   function openMainServiceModal() {
        var modal = document.querySelector('.modal');
        modal.style.display = 'flex';
    }

    // 메인 서비스 모달을 닫기 위한 함수
    function closeMainServiceModal() {
        var modal = document.querySelector('.modal');
        modal.style.display = 'none';
    }

    // 문서를 클릭했을 때 모달 외부를 클릭하면 모달을 닫기 위한 이벤트 리스너 추가
    document.addEventListener('click', function (event) {
        var modal = document.querySelector('.modal');
        if (event.target === modal) {
            closeMainServiceModal();
        }
    });
       

    </script>

</body>
</html>