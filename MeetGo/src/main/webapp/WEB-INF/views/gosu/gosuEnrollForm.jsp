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

        input[type="radio"] {
            width: 20px;
        }
        
        .select {
        	padding: 15px 10px;
        }
        
        label{
        	margin-bottom: 30px;
        }
        
        .option-select{
            margin-left: 20px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
		
		.subOption{
			background-color: #ffffff00;
			border: none;
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
                    <option value="allRegion" selected>전체 지역</option>
                    <option value="seoul">서울특별시</option>
                    <option value="incheon">인천광역시</option>
                    <option value="daejeon">대전광역시</option>
                    <option value="daegu">대구광역시</option>
                    <option value="busan">부산광역시</option>
                    <option value="ulsan">울산광역시</option>
                    <option value="gwangju">광주광역시</option>
                    <option value="gyeonggi">경기도</option>
                    <option value="gangwon">강원도</option>
                    <option value="chungbuk">충청북도</option>
                    <option value="chungnam">충청남도</option>
                    <option value="jeonbuk">전라북도</option>
                    <option value="jeonnam">전라남도</option>
                    <option value="gyeongbuk">경상북도</option>
                    <option value="gyeongnam">경상남도</option>
                    <option value="jeju">제주특별자치도</option>
                </select>
                
                <select id="region-sub" class="option-select dropdown">
                    <option selected>-</option>
                </select>
    
                <br>
                <br>
                
                <p style="margin-bottom: 5px;">서비스 *</p>
                <select id="category-main" class="option-select dropdown">
                    <option value="0" selected>전체 서비스</option>
                    <option value="1">홈 / 리빙</option>
                    <option value="2">취미 / 레슨</option>
                    <option value="3">건강 / 미용</option>
                    <option value="4">디자인</option>
                    <option value="5">이벤트</option>
                    <option value="6">IT / 개발</option>
                    <option value="7">비즈니스</option>
                    <option value="8">법률 / 행정</option>
                    <option value="9">기타</option>
                </select>
               
                <select id="category-sub" class="option-select dropdown">
                    <option selected>-</option>
                </select>
                
                <br>
				
				<div id="serviceList" style="min-height: 1px;">
					
				</div>
				
            </div>

			
            <br>
	
	        <div>
                <p class="name1" style="margin-bottom: 5px;">소개 *</p>
                <textarea class="intro" name="introduction" id="introduction" rows="10" style="resize: none; width: 80%;" placeholder="간단한 소개글을 100자 이내로 작성해주세요."></textarea>
                
                <br><br>
                
                <p class="name1">경력 *</p>
                <textarea class="intro" name="career" id="career" rows="10" style="resize: none; width: 80%; height: 150px;" placeholder="200자 이내로 작성해주세요."></textarea>
                
                <br><br>
                
                <p class="name1">서비스 설명 *</p>
                <textarea class="intro" type="text" name="elaborate" id="elaborate" style="resize: none; width: 80%; height: 200px;" placeholder="제공 가능한 서비스를 300자 이내로 적어주세요" required></textarea>
                
                <br><br>
                
                <p class="name1">사업자 등록 여부 *</p>
                <input type="radio" name="business" id="business1" checked><label for="business1">해당 없음</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="business" id="business2"><label for="business2">개인</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="business" id="business3"><label for="business3">법인</label>
                
                <br><br>

                <p class="name1">직원 수 *</p>
                <input class="gosu" type="number" name="employees" id="employees" placeholder="숫자로만 입력해주세요." required>

                <br><br>

                <p class="name1">학력</p>
                <input class="gosu" type="text" name="edcuation" id="edcuation" placeholder="최종학력을 입력해주세요. 예) xx고등학교 졸업 / oo대학교 재학">
                

                <br><br>
                
                <p class="name1">출장 가능 지역</p>
                <input class="gosu" type="text" name="moveDistance" id="moveDistance" placeholder="출장 가능 거리를 적어주세요.예) 5km, 협의 가능, 서울 전체" >
                
                <br><br>
                
                <p class="name1">연락 가능 시간</p>
                <input class="gosu" type="text" name="availableTime" id="availableTime" placeholder="연락 가능 시간대를 적어주세요. 예) 09~18">
	        </div>
                 
            <br><br>

	        <div class="tq">
                <a type="button" class="btn btn-danger btn-sm">취소하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-primary btn-sm">등록하기</button>
	        </div>
    	</div>
</form>

	<script>

	// 선택한 항목들이 들어갈 배열 (전역변수)
	const selectedArr = [];


	// sub 지역 리스트
	let seoul = ["서울 전체", "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"];
	let sejong = ["세종 전체"];
	let gangwon = ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"];
	let incheon = ["중구", "동구", "남구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
	let gyeonggi = ["수원시", "성남시", "고양시", "용인시", "부천시", "안산시", "안양시", "남양주시", "화성시", "평택시", "의정부시", "시흥시", "파주시", "광명시", "김포시", "군포시", "광주시", "이천시", "양주시", "오산시", "구리시", "안성시", "포천시", "의왕시", "하남시", "여주시", "여주군", "양평군", "동두천시", "과천시", "가평군", "연천군"];
	let chungbuk = ["청주시", "충주시", "제천시", "청원군", "보은군", "옥천군", "영동군", "진천군", "괴산군", "음성군", "단양군", "증평군"];
	let chungnam = ["천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "당진군", "금산군", "연기군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"];
	let daejeon = ["동구", "중구", "서구", "유성구", "대덕구"];
	let gyeongbuk = ["포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉"];
	let daegu = ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"];
	let gyeongnam = ["창원시", "마산시", "진주시", "진해시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"];
	let busan = ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군"];
	let ulsan = ["중구", "남구", "동구", "북구", "울주군"];
	let jeonbuk = ["전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"];
	let jeonnam = ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군"];
	let gwangju = ["동구", "서구", "남구", "북구", "광산구"];
	let jeju = ["제주시", "서귀포시"];

	// sub 카테고리 리스트
	let homeLiving = ["청소", "인테리어", "이사", "수리"];
	let hobbyEdu = ["음악", "요리", "외국어", "미술"];
	let healthBeauty = ["메이크업", "헤어", "피부관리", "헬스"];
	let design = ["영상편집", "사진편집", "일러스트 / 공예", "3D / 애니메이션"];
	let event = ["사진촬영", "기획 / 장식", "공연"];
	let development = ["웹 개발", "소프트웨어 개발", "앱 개발"];
	let business = ["마케팅", "통역 / 번역", "컨설팅"];
	let law = ["세무 / 회계", "법무", "노무"];
	let other = ["알바", "PPT제작", "반려동물", "대여 / 대관"];
	
	$(function() {
		
	    // option 변경 이벤트 핸들러 등록
	    $("#region-main").on("change", function() {
	        updateSubRegionOptions();
	    });
	    
	    $("#category-main").on("change", function(){
	    	updateSubCategoryUpdate();
	    });
	    
	    updateSubRegionOptions();
	    updateSubCategoryUpdate();
	    
	});

	// 지역 옵션 업데이트
	function updateSubRegionOptions() {
		
	    let mainRegionSelect = $("#region-main");
	    let subRegionSelect = $("#region-sub");
	
	    // 선택된 지역 값 가져오기
	    let selectedRegion = mainRegionSelect.val();
	
	    // 서브 지역 옵션 초기화
	    let subRegionOptions = "";
	    
	    switch (selectedRegion) {
	        case "allRegion":
	                subRegionOptions += '<option value="allRegion">' + "-" + '</option>';
            break;
	        case "seoul":
	            $.each(seoul, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "sejong":
	            $.each(sejong, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "gangwon":
	            $.each(gangwon, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "incheon":
	            $.each(incheon, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "gyeonggi":
	            $.each(gyeonggi, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "chungbuk":
	            $.each(chungbuk, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "chungnam":
	            $.each(chungnam, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "daejeon":
	            $.each(daejeon, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "gyeongbuk":
	            $.each(gyeongbuk, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "daegu":
	            $.each(daegu, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "gyeongnam":
	            $.each(gyeongnam, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "busan":
	            $.each(busan, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "ulsan":
	            $.each(ulsan, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "jeonbuk":
	            $.each(jeonbuk, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "jeonnam":
	            $.each(jeonnam, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "gwangju":
	            $.each(gwangju, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "jeju":
	            $.each(jeju, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        default:
	            break;
	    }
	    // 서브 지역 옵션 업데이트
	    subRegionSelect.html(subRegionOptions);
	}
	
    // 카테고리 옵션 업데이트
    function updateSubCategoryUpdate() {
    	
	    let mainCategorySelect = $("#category-main");
	    let subCategorySelect = $("#category-sub");
	
	    // 선택된 카테고리 값 가져오기
	    let selectedCategory = mainCategorySelect.val();
	
	    // 서브 카테고리 옵션 초기화
	    let subCategoryOptions = "";
	    
	    switch(selectedCategory) {
	        case "0":
	            subCategoryOptions += '<option value="0">' + "-" + '</option>';
	    	break;
	        case "1":
            $.each(homeLiving, function(index, subCategory) {
            	 subCategoryOptions += '<option value="' + (101 + index) + '">' + homeLiving[index] + '</option>';
            });
            break;
	        case "2":
	            $.each(hobbyEdu, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (201 + index) + '">' + hobbyEdu[index] + '</option>';
	            });
	            break;
	        case "3":
	            $.each(healthBeauty, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (301 + index) + '">' + healthBeauty[index] + '</option>';
	            });
	            break;
	        case "4":
	            $.each(design, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (301 + index) + '">' + design[index] + '</option>';
	            });
	            break;
	        case "5":
	            $.each(event, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (501 + index) + '">' + event[index] + '</option>';
	            });
	            break;
	        case "6":
	            $.each(development, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (601 + index) + '">' + development[index] + '</option>';
	            });
	            break;
	        case "7":
	            $.each(business, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (701 + index) + '">' + business[index] + '</option>';
	            });
	            break;
	        case "8":
	            $.each(law, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (801 + index) + '">' + law[index] + '</option>';
	            });
	            break;
	        case "9":
	            $.each(other, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (901 + index) + '">' + other[index] + '</option>';
	            });
	            break;
	        default:
	            break;

	    }
	    subCategorySelect.html(subCategoryOptions);
    }
    
    $(function(){
    	
    	$("#category-sub").on("change", function(){
    		
    		let mainCategory = $("#category-main").val();

    		let buttonCount = $("#serviceList button").length;
			
			let selectedValue = $(this).val();

			let lastCharacter = selectedValue.charAt(selectedValue.length - 1);

			
			// 푸시 전 로또번호처럼 중복체크하고 중복되는게 없으면 푸시
			selectedArr.push(selectedValue); // 선택했을때




			// console.log(lastCharacter);

			console.log(mainCategory);

			let showVal = "";
			
			switch(mainCategory) {
				case '1' : 
					showVal = homeLiving[lastCharacter - 1];
				break;
				case '2' : 
					showVal = hobbyEdu[lastCharacter - 1];
				break;
				case '3' : 
					showVal = healthBeauty[lastCharacter - 1];
				break;
				case '4' : 
					showVal = design[lastCharacter - 1];
				break;
				case '5' : 
					showVal = event[lastCharacter - 1];
				break;
				case '6' : 
					showVal = development[lastCharacter - 1];
				break;
				case '7' : 
					showVal = business[lastCharacter - 1];
				break;
				case '8' : 
					showVal = law[lastCharacter - 1];
				break;
				case '9' : 
					showVal = other[lastCharacter - 1];
				break;
			}
			
			/*
			let homeLiving = ["청소", "인테리어", "이사", "수리"];
			let hobbyEdu = ["음악", "요리", "외국어", "미술"];
			let healthBeauty = ["메이크업", "헤어", "피부관리", "헬스"];
			let design = ["영상편집", "사진편집", "일러스트 / 공예", "3D / 애니메이션"];
			let event = ["사진촬영", "기획 / 장식", "공연"];
			let development = ["웹 개발", "소프트웨어 개발", "앱 개발"];
			let business = ["마케팅", "통역 / 번역", "컨설팅"];
			let law = ["세무 / 회계", "법무", "노무"];
			let other = ["알바", "PPT제작", "반려동물", "대여 / 대관"];
			*/
			
			00
			if (buttonCount < 5) {
				let btr = "<button type='button' class='subOption'> <span class='selectedOption'>"
						+ showVal 
						+ "</span><span class='cancel'> x </span></button>&nbsp;";
				
				$("#serviceList").append(btr);
			} else {

				alert("최대 5개의 서비스만 선택 가능합니다.");
			}
    	})
    	
    	$("#serviceList").on("click", ".cancel", function () {
            
			$(this).closest("button").remove();

			// 인덱스값을 지우려면
        });
    	
    });
    
	

    </script>
</body>
</html>