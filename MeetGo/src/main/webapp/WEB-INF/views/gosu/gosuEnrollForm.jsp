<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
       

        
        .main {
            background-color: #FFFFFF;
            width: 800px;
            margin: 7em auto;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            padding: 50px;
            text-align: center; 
        }

       
        .gosu {
            width: 80%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
        }

        .intro{
            width: 76%;
            height: 100px;
            color: rgb(38, 50, 56);
            font-size: 14px;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .name1 {
            font-size: 15px;
            margin-left: 46px;
            font-weight: bolder;
            text-align: left; 
            
        }

       
        .awq {
            width: 76%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;
            margin: 10px 10px 0px 10px;
            
        }

        .awqs {
            width: 25%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;

        }

        .awqss {
            width: 25%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;
            background-color: rgb(230, 230, 230);
        }
        
        input[type="radio"] {
            width: 20px;

        }
        .select {
        padding: 15px 10px;
        }
        .select input[type=radio]{
            display: none;
        }
        .select input[type=radio]+label{
            display: inline-block;
            cursor: pointer;
            height: 24px;
            width: 200px;
            border: 1px solid #333;
            line-height: 24px;
            text-align: center;
            font-weight:bold;
            font-size:13px;
        }
        .select input[type=radio]+label{
            background-color: #fff;
            color: #333;
        }
        .select input[type=radio]:checked+label{
            background-color: #333;
            color: #fff;
        }
        .option-select{
            margin-left: 20px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <form action="insert.me" method="post">
        
        <div class="main">
	        <h1>고수 등록</h1>
            
            <br>

            <div id="select-option-area" class="name1" align="left">
                <p style="margin-bottom: 5px;">지역 *</p>
                <select id="region-main" class="option-select dropdown">
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
                
                <select id="region-sub" class="option-select dropdown">
                    <option selected>-</option>
                </select>
    
                <br>
                <br>
                
                <p style="margin-bottom: 5px;">서비스 *</p>
                <select id="category-main" class="option-select dropdown">
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
               
                <select id="category-sub" class="option-select dropdown">
                    <option selected>-</option>
                </select>
                
                <br>
            </div>


            <br>
	
	        <div>
                <p class="name1" style="margin-bottom: 5px;">소개 *</p>
                <textarea class="intro" name="introduction" id="introduction" rows="10" style="resize: none; width: 80%;" placeholder="간단한 소개글을 100자 이내로 작성해주세요."></textarea>
                
                <br><br>
                
                <p class="name1">경력 *</p>
                <textarea class="intro" name="career" id="career" rows="10" style="resize: none; width: 80%; height: 200px;" placeholder="200자 이내로 작성해주세요."></textarea>
                
                <br><br>
                
                <p class="name1">서비스 설명 *</p>
                <input class="gosu" type="text" name="explain" id="explain" placeholder="제공 가능한 서비스를 300자 이내로 적어주세요" required>
                
                <br><br>

                <p class="name1">학력</p>
                <input class="gosu" type="text" name="edcuation" id="edcuation" placeholder="최종학력을 입력해주세요. 예) xx고등학교 졸업 / oo대학교 재학">
                
                <br><br>
                
                <p class="name1">출장 가능 지역</p>
                <input class="gosu" type="text" name="moveDistance" id="moveDistance" placeholder="출장 가능 지역을 구단위로 적어주세요.(최대 100자)" >
                
                <br><br>
                
                <p class="name1">연락 가능 시간</p>
                <input class="gosu" type="text" name="availableTime" id="availableTime" placeholder="연락 가능 시간대를 적어주세요. 예) 09~18시">
	        </div>
                 
            <br><br>

	        <div class="tq">
                <a type="button" class="btn btn-danger btn-sm">취소하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-primary btn-sm">등록하기</button>
	        </div>
    	</div>
</form>

</body>
</html>