<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고수 찾기</title>
    <style>
    /* 폰트 */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    .outer { font-family: 'Pretendard-Regular'; }

    /* 전체 div 영역 */
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }
    
    /* 메뉴 제목 */
    #title-text{
        font-weight: bold;
        font-size: 30px;
        color: #2A8FF7;
        letter-spacing: 4px;
        text-align: center;
    }
    
    /* 옵션선택 영역 */
    #select-option-area{ width: 40%; margin: auto; }
    #select-option-area span{
        font-size: 20px;
        font-weight: 700;
        margin-right: 20px;
    }
    .option-select{ appearance: none; font-size: 20px; }
    .option-select option {
        background: white;
        font-size: 20px;
    }

    /* 옵션 select */
    #region-main{
        width: 160px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
    }
    #region-sub{
        width: 220px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-left: 15px;
    }
    #category-main{
        width: 160px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
    }
    #category-sub{
        width: 220px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-left: 15px;
    }

    /* 결과화면 영역 */
    #result-area{
        width: 50%;
        margin: auto;
    }
    #filter{
        width: 120px; height: 40px;
        border: 0px; border-bottom: 3px solid #2A8FF7;
    }
    
    /* 고수 서비스 테이블 */
    .service-object{ margin-top: 50px; margin-bottom: 50px;}
    .service-table{
        width: 600px;
        height: 200px;
        border-bottom: 1px solid lightgrey;
    }
    .service-table:hover{ cursor: pointer;}
    .service-table>thead{ height: 80%; font-size: 18px; }
    .service-table>tbody{ height: 20%; font-size: 16px; }
    .service-table>thead th{ width: 35%; }
    .service-table td:nth-child(2), #service-table td:nth-child(3)
    { height: 20px; }
    .service-table th img { max-height: 100%; }

    /* 페이징버튼 */
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
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="outer">
        <p id="title-text">고수찾기</p><br>
        <div id="select-option-area" align="center">
            <span>&nbsp;지역</span>&nbsp;&nbsp;&nbsp;           
            <select id="region-main" class="option-select">
                <option value="all" selected>전체 지역</option>
                <option value="seoul">서울특별시</option>
                <option>인천광역시</option>
                <option>대전광역시</option>
                <option>대구광역시</option>
                <option>부산광역시</option>
                <option>울산광역시</option>
                <option>광주광역시</option>
                <option>경기도</option>
                <option>강원도</option>
                <option>충청북도</option>
                <option>충청남도</option>
                <option>전라북도</option>
                <option>전라남도</option>
                <option>경상북도</option>
                <option>경상남도</option>
                <option>제주특별자치도</option>
            </select>
            <select id="region-sub" class="option-select">
                <option selected>-</option>
            </select>

            <br>
            <br>
            
            <span>서비스</span>
            <select id="category-main" class="option-select">
                <option selected>전체 서비스</option>
                <option>홈 / 리빙</option>
                <option>취미 / 레슨</option>
                <option>건강 / 미용</option>
                <option>디자인</option>
                <option>이벤트</option>
                <option>IT / 개발</option>
                <option>비즈니스</option>
                <option>법률 / 행정</option>
                <option>기타</option>
            </select>
            <select id="category-sub" class="option-select">
                <option selected>-</option>
            </select>
            
            <br><br>
        </div>

        <hr style="width: 50%;">
        
        <div id="result-area">

            <span>건 조회됨</span>

            <div align="right">
            <select id="filter" class="form-control">
                <option>리뷰많은순</option>
                <option>평점높은순</option>
                <option>경력순</option>
                <option>최신순</option>
            </select>
            </div>

            <div align="center" class="service-object">
                <div>
                    <table class="service-table">
                        <thead>
                        <tr>    
                           <th rowspan="2">
                            <div align="center">
                                <img id="gosu-profile" width="150px" height="150px" src="">
                            </div>
                           </th> 
                           <td style="width: 25%;">gosu_123</td>
                           <td>
                            <span>홈/리빙</span> > <span>인테리어</span>
                           </td>
                        </tr>
                        <tr>
                            <td colspan="2">내용</td>
                        </tr>
                        </thead>                        
                        <tbody>
                        <tr>
                            <td style="text-align: center;"><br>별점</td>
                            <td colspan="2"><br>리뷰 <b>21</b> 건</td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!-- 페이징바 -->    
        <div align="center" id="pagingBtn-area">
            <button class="pagingBtn">prev</button>
            <button class="pageBtn">1</button>
            <button class="pageBtn">2</button>
            <button class="pagingBtn">next</button>
        </div>

    </div>	
    
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>