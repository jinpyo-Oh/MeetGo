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
            height: 3000px;
            margin: 0px auto;
            box-sizing: border-box;
            
            
            
        }
        .profile {
            display: flex;
            margin-top:100px;
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
            font-weight: 600;
            line-height: 1.43;
            flex: 1;
            margin:10px auto;
            
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
	       .editable-field {
	        width: 100%;
	        padding: 10px;
	        margin-bottom: 10px;
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        box-sizing: border-box;
	    }
	
	    .save-button {
	        padding: 10px 20px;
	        background-color: #00c7ae;
	        color: white;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
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
                    
                        <img src="${sessionScope.loginUser.userProFile}" class="img">
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
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="info">
                <div class="value">
                    <div id="displayText">${sessionScope.loginUser.userName}</div>
                    <input type="text" id="editInput" style="display: none;">
                    <button id="saveButton" style="display: none;" onclick="saveChanges()">저장</button>
                </div>
            </div>
        </div> 
         <div class="my-profile-name">
            <div class="comp-hader">
                <div class="hading">
                    <h2>대표서비스</h2>
                    <div class="action-group-wapper">
                        
                    </div>
                </div>
            </div>
             <div class="info">
        <div class="value">
            <p>편의점 심부름</p>
        </div>
    </div>
</div>

		<div class="my-profile-name">
		    <div class="comp-hader">
		        <div class="hading">
		            <h2>제공서비스</h2>
		            <div class="action-group-wapper">
		                <div class="type">
		                    <div class="update" onclick="openServiceModal()">
		                        수정
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="info">
		        <div class="value">
		            <a class="service" href="addService.me">+서비스 추가</a>
		        </div>
		    </div>
		</div>
<form action="introductionUpdate.me">
     <div class="my-profile-name">
    <div class="comp-hader">
        <div class="hading">
            <h2>한줄소개</h2>
            <div class="action-group-wapper">
                <div class="type">
                    <div class="update" onclick="toggleEditMode('intro')">
                        수정
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="info">
        <div class="value">
            <div id="introDisplayText">${sessionScope.loginGosu.introduction}</div>
            <input type="text" id="introEditInput"  name="introduction"style="display: none;" class="editable-field">
            <button id="introSaveButton" style="display: none;" onclick="saveChanges('intro')" class="save-button">저장</button>
        </div>
    </div>
</div>
</form>
<form action="emplyeesUpdate.me">
 <div class="my-profile-name">
    <div class="comp-hader">
        <div class="hading">
            <h2>직원수</h2>
            <div class="action-group-wapper">
                <div class="type">
                    <div class="update" onclick="toggleEditMode('employeeCount')">
                        수정
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="info">
        <div class="value">
            <!-- 디스플레이 모드 내용 -->
            <div id="employeeCountDisplayText">${sessionScope.loginGosu.employees}</div>
            <!-- 편집 모드 내용 -->
            <input type="text" name="employeesUpdate" id="employeeCountEditInput" style="display: none;" class="editable-field" placeholder="직원수를 입력하세요">
            <button id="employeeCountSaveButton" style="display: none;" onclick="saveChanges('employeeCount')" class="save-button">저장</button>
        </div>
    </div>
</div>
</form>
<form action="region.me">
       <div class="my-profile-name">
    <div class="comp-hader">
        <div class="hading">
            <h2>활동 지역</h2>
            <div class="action-group-wapper">
                <div class="type">
                    <div class="update" onclick="toggleEditMode('activityArea')">
                        수정
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="info">
        <div class="value">
            <!-- 디스플레이 모드 내용 -->
            <div id="activityAreaDisplayText">${sessionScope.loginGosu.region}</div>
            <!-- 편집 모드 내용 -->
            <input type="text" name="regionUpdate" id="activityAreaEditInput" style="display: none;" class="editable-field" placeholder="활동 지역을 입력하세요">
            <button id="activityAreaSaveButton" style="display: none;" onclick="saveChanges('activityArea')" class="save-button">저장</button>
        </div>
    </div>
</div>
</form>
  <form action="moveDistanceUpdate.me">
    <div class="my-profile-name">
        <div class="comp-hader">
            <div class="hading">
                <h2>이동 가능 거리</h2>
                <div class="action-group-wapper">
                    <div class="type">
                        <div class="update" onclick="toggleEditMode('moveDistance')">
                            수정
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="info">
            <div class="value">
                <div id="moveDistanceDisplayText">${sessionScope.loginGosu.moveDistance}</div>
                <input type="text" name="moveDistanceUpdate" id="moveDistanceEditInput" style="display: none;" placeholder="이동 가능 거리를 입력하세요" class="editable-field">
                <button id="moveDistanceSaveButton" style="display: none;" onclick="saveChanges('moveDistance')" class="save-button">저장</button>
            </div>
        </div>
    </div>
</form>
      
      
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
                    
                    10000만원부터 시작
                </div>
            </div>
        </div>
        
        
        
     <form action="elaborateUpdate.me">  
        
       <div class="my-profile-name">
	    <div class="comp-hader">
	        <div class="hading">
	            <h2>고수 서비스 상세설명</h2>
	            <div class="action-group-wapper">
	                <div class="type">
	                    <div class="update" onclick="toggleEditMode('description')">
	                        수정
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <div class="info">
	    
	        <div class="value">
	            <div id="descriptionDisplayText"><p> ${sessionScope.loginGosu.elaborate}</p></div>
	            <input type="text" name="elaborate"id="descriptionEditInput" style="display: none;" class="editable-field">
	            <button id="descriptionSaveButton" style="display: none;" onclick="saveChanges('description')" class="save-button">저장</button>
	        </div>
	    </div>
	</div>
</form>


<form action="availableTimeUpdate.me" >
     <div class="my-profile-name">
    <div class="comp-hader">
        <div class="hading">
            <h2>연락가능시간</h2>
            <div class="action-group-wapper">
                <div class="type">
                    <div class="update" onclick="toggleEditAvailableTime()">
                        수정
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="info">
        <div class="value">
            <div id="availableTimeDisplayText">${sessionScope.loginGosu.availableTime}</div>
            <input type="text" name="availableTimeUpdate" id="availableTimeEditInput" style="display: none;" placeholder="예시)오전0시~오후0시" class="editable-field">
            <button id="availableTimeSaveButton" style="display: none;" onclick="saveChangesAvailableTime()" class="save-button">저장</button>
        </div>
    </div>
</div>
</form>
<form action="careerUpdate.me" method="post">
    <div class="my-profile-name">
        <div class="comp-hader">
            <div class="hading">
                <h2>경력</h2>
                <div class="action-group-wapper">
                    <div class="type">
                        <div class="update" onclick="toggleEditMode('career')">
                            수정
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="info">
            <div class="value">
                <!-- Display mode content -->
                <div id="careerDisplayText">${sessionScope.loginGosu.career}</div>
                <!-- Edit mode content -->
                <select name="careerUpdate" id="careerEditInput" style="display: none;" class="editable-field">
                    <option value="1년 미만">경력 1년 미만</option>
                    <option value="1년 이상">경력 1년</option>
                    <option value="2년 이상">경력 2년</option>
                    <option value="3년 이상">경력 3년</option>
                    <option value="4년 이상">경력 4년</option>
                    <option value="5년 이상">경력 5년</option>
                    <option value="6년 이상">경력 6년</option>
                    <option value="7년 이상">경력 7년</option>
                    <option value="8년 이상">경력 8년</option>
                    <option value="9년 이상">경력 9년</option>
                    <option value="10년 이상">경력 10년</option>
                     <option value="15년 이상">경력 15년</option>
                     <option value="20년 이상">경력 20년</option>
              
                    
                    <!-- 다른 경력 옵션들도 필요에 따라 추가 -->
                </select>
                <button id="careerSaveButton" style="display: none;" onclick="saveChanges('career')" class="save-button">저장</button>
            </div>
        </div>
    </div>
</form>
<form action="educationUpdate.me" method="post">
    <div class="my-profile-name">
        <div class="comp-hader">
            <div class="hading">
                <h2>학력</h2>
                <div class="action-group-wapper">
                    <div class="type">
                        <div class="update" onclick="toggleEditMode('education')">
                            수정
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="info">
            <div class="value">
                <!-- Display mode content -->
                <div id="educationDisplayText" class="Education-title">${sessionScope.loginGosu.education}</div>
                <!-- Edit mode content -->
                <input type="text" name="educationUpdate" id="educationEditInput" class="editable-field" style="display: none;" placeholder="대학교명 입학~졸업일 학과를 적으세요" class="editable-field">
                <button id="educationSaveButton" class="save-button editable-field" style="display: none;" onclick="saveChanges('education')" class="save-button">저장</button>
            </div>
        </div>
    </div>
</form>
        
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
       									 <input type="file" id="fileInput" onchange="displayImagePreview()">
                                    </label>
                                </div>
								<div id="imagePreview" style="margin-top: 10px;"></div>
                                
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
       
                    </div>
            
                   
                    
                  

    <jsp:include page="../common/footer.jsp"/>
    <script>
    function displayImagePreview() {
        var fileInput = document.getElementById('fileInput');
        var imagePreview = document.getElementById('imagePreview');

        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                imagePreview.innerHTML = '<img src="' + e.target.result + '" style="max-width:100%; max-height:200px;" />';
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    }
</script>
    <script>
   
    function toggleEditMode() {
        var displayText = document.getElementById('displayText');
        var editInput = document.getElementById('editInput');
        var saveButton = document.getElementById('saveButton');

        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 입력 필드 값을 현재 표시 텍스트로 설정합니다.
        editInput.value = displayText.innerText;
    }

    function updateDisplayText() {
        // 입력 필드 값이 변경될 때마다 표시 텍스트 업데이트
        var displayText = document.getElementById('displayText');
        var editInput = document.getElementById('editInput');
        displayText.innerText = editInput.value;
    }

    function saveChanges() {
        var displayText = document.getElementById('displayText');
        var editInput = document.getElementById('editInput');
        var saveButton = document.getElementById('saveButton');

        // 입력 필드 값으로 표시 텍스트를 업데이트합니다.
        displayText.innerText = editInput.value;

        // 저장 버튼과 입력 필드를 숨깁니다.
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';
    }
	
    function toggleEditMode(fieldName) {
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        var saveButton = document.getElementById(fieldName + 'SaveButton');

        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 입력 필드 값을 현재 표시 텍스트로 설정합니다.
        editInput.value = displayText.innerText;
    }

    // 표시 텍스트 업데이트
    function updateDisplayText(fieldName) {
        // 입력 필드 값이 변경될 때마다 표시 텍스트 업데이트
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        displayText.innerText = editInput.value;
    }

    // 변경 사항 저장
    function saveChanges(fieldName) {
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        var saveButton = document.getElementById(fieldName + 'SaveButton');

        // 입력 필드 값으로 표시 텍스트를 업데이트합니다.
        displayText.innerText = editInput.value;

        // 저장 버튼과 입력 필드를 숨깁니다.
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';
    }
    </script>

<script>
    function toggleEditAvailableTime() {
        var displayText = document.getElementById('availableTimeDisplayText');
        var editInput = document.getElementById('availableTimeEditInput');
        var saveButton = document.getElementById('availableTimeSaveButton');

        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 입력 필드 값을 현재 표시 텍스트로 설정합니다.
        editInput.value = displayText.innerText;
    }

    function saveChangesAvailableTime() {
        var displayText = document.getElementById('availableTimeDisplayText');
        var editInput = document.getElementById('availableTimeEditInput');
        var saveButton = document.getElementById('availableTimeSaveButton');

        // 입력 필드 값으로 표시 텍스트를 업데이트합니다.
        displayText.innerText = editInput.value;

        // 저장 버튼과 입력 필드를 숨깁니다.
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';
    }
</script>
    <script>
        // Function to toggle between display and edit mode
        function toggleEditMode(section) {
            var displayElements = document.querySelectorAll('.value .Education-title, .value .Education-context, .value .Education-body');
            var editElements = document.querySelectorAll('.value .editable-field');
            var saveButton = document.querySelector('.value .save-button');

            // Toggle display and edit mode
            displayElements.forEach(function (element) {
                element.style.display = 'none';
            });

            editElements.forEach(function (element) {
                element.style.display = 'block';
            });

            saveButton.style.display = 'block';
        }
    </script>
    <script>
    function toggleEditMode(field) {
        // Display the editable field and save button for the specified field
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // Set the input value to the current display text content
        editInput.value = displayText.innerText;

        // Toggle the display property
        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';
    }

    function saveChanges(field) {
        // Save the changes for the specified field
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // Update the display text with the input value
        displayText.innerText = editInput.value;

        // Toggle the display property
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';
    }
</script>
<script>
    // 직원수 섹션을 편집 모드로 전환하는 함수
    function toggleEditMode(field) {
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // 디스플레이 모드 숨김, 편집 모드 표시
        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 입력 필드에 현재 값을 표시
        editInput.value = displayText.innerText;
    }

    // 변경 사항을 저장하는 함수
    function saveChanges(field) {
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // 편집 모드 숨김, 디스플레이 모드 표시
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';

        // 입력 필드의 값을 디스플레이 모드에 적용
        displayText.innerText = editInput.value;
    }
    // 활동지역 섹션을 편집 모드로 전환하는 함수
    function toggleEditMode(field) {
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // 디스플레이 모드 숨김, 편집 모드 표시
        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 입력 필드에 현재 값을 표시
        editInput.value = displayText.innerText;
    }

    // 변경 사항을 저장하는 함수
    function saveChanges(field) {
        var displayText = document.getElementById(field + 'DisplayText');
        var editInput = document.getElementById(field + 'EditInput');
        var saveButton = document.getElementById(field + 'SaveButton');

        // 편집 모드 숨김, 디스플레이 모드 표시
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';

        // 입력 필드의 값을 디스플레이 모드에 적용
        displayText.innerText = editInput.value;
    }
</script>
<script>
    function toggleEditMode(fieldName) {
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        var saveButton = document.getElementById(fieldName + 'SaveButton');

        displayText.style.display = 'none';
        editInput.style.display = 'block';
        saveButton.style.display = 'block';

        // 현재 표시 텍스트와 일치하는 드롭다운 값을 선택합니다.
        var currentValue = displayText.innerText;
        var dropdown = document.getElementById(fieldName + 'EditInput');
        for (var i = 0; i < dropdown.options.length; i++) {
            if (dropdown.options[i].value === currentValue) {
                dropdown.selectedIndex = i;
                break;
            }
        }
    }

    // 표시 텍스트 업데이트
    function updateDisplayText(fieldName) {
        // 선택된 드롭다운 값을 표시 텍스트에 업데이트
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        displayText.innerText = editInput.value;
    }

    // 변경 사항 저장
    function saveChanges(fieldName) {
        var displayText = document.getElementById(fieldName + 'DisplayText');
        var editInput = document.getElementById(fieldName + 'EditInput');
        var saveButton = document.getElementById(fieldName + 'SaveButton');

        // 선택된 드롭다운 값을 표시 텍스트에 업데이트
        displayText.innerText = editInput.value;

        // 저장 버튼과 드롭다운을 숨깁니다.
        displayText.style.display = 'block';
        editInput.style.display = 'none';
        saveButton.style.display = 'none';
    }
</script>

</body>
</html>